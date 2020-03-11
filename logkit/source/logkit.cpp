#include <daddy.hpp>
#include <algorithm>
#include <csignal>
#include <thread>

class LogKit
{
public:
    LogKit();
    ~LogKit();

public:
    bool Connect(utf8s host, uint16_t port);
    int32_t SendOnce();
    bool RecvOnce();

private:
    dSocket mSocket;
};

DD_global bool gInterrupt = false;
static void OnInterrupt(int signum)
{
    printf("[daddy] Interrupt signal: %d\n", signum);
    gInterrupt = true;
}

int main(int argc, char* argv[])
{
    signal(SIGINT, OnInterrupt); // Ctrl+C

    if(argc == 2)
    {
        LogKit Client;
        const uint16_t Port = 7070;
        if(Client.Connect(argv[1], Port))
        {
            printf("[daddy] successfully connected to \"%s:%hu\"", argv[1], Port);
            int32_t SleepMs = 10;
            while(!gInterrupt)
            {
                const int32_t SendCount = Client.SendOnce();
                const bool RecvFlag = Client.RecvOnce();

                if(SendCount == -1)
                    return 0;
                else if(50 < SendCount || RecvFlag)
                    SleepMs = std::max(5, int32_t(SleepMs * 0.9));
                else if(SendCount < 5 && SleepMs < 500)
                    SleepMs++;
                std::this_thread::sleep_for(std::chrono::milliseconds(SleepMs));
            }
        }
        else
        {
            printf("[daddy] could not connect to \"%s:%hu\" (waiting 3sec)", argv[1], Port);
            std::this_thread::sleep_for(std::chrono::milliseconds(3000));
        }
    }
    else
    {
        printf(
            "[daddy] call the argument again like this! (waiting 3sec)\n"
            "C:\\>logclient_vs.exe www.logserver.com\n");
        std::this_thread::sleep_for(std::chrono::milliseconds(3000));
    }
    return 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ LogKit
LogKit::LogKit()
{
}

LogKit::~LogKit()
{
}

bool LogKit::Connect(utf8s host, uint16_t port)
{
    return mSocket.openClient(dString(host), port);
}

int32_t LogKit::SendOnce()
{
    struct PacketHeader
    {
        uint32_t mSize;
        uint16_t mFuncID;
    };

    auto ReadCB = [this](dDetector::FuncID id, addr payload, uint32_t size)->void
    {
        PacketHeader HeaderTemp;
        HeaderTemp.mSize = sizeof(uint16_t) + size;
        HeaderTemp.mFuncID = id;
        mSocket.sendTo(0, dBinary::fromExternal((dumps) &HeaderTemp, sizeof(uint32_t) + sizeof(uint16_t)), false);
        mSocket.sendTo(0, dBinary::fromExternal((dumps) payload, size), false);
    };

    int32_t SendCount = 0;
    while(true)
    {
        dDetector::ReadResult Result = dDetector::readOnce(ReadCB);
        if(Result == dDetector::Readed)
            SendCount++;
        else return (Result == dDetector::Unreaded)? SendCount : -1;
    }
    return -1;
}

bool LogKit::RecvOnce()
{
    struct PacketValid
    {
        int32_t mPacketType; // 'VALD'
        int32_t mKey;
        int32_t mCommand;
    };

    bool Result = false;
    while(true)
    {
        dBinary NewBinary = mSocket.recvFrom(0);
        if(0 < NewBinary.length())
        {
            Result = true;
            dumps OneBuffer = NewBinary.buffer();
            switch(*((int32_t*) OneBuffer))
            {
            case 'VALD':
                {
                    auto Packet = (PacketValid*) OneBuffer;
                    char ValidSemaphore[1024];
                    sprintf(ValidSemaphore, "detector-valid-%d", Packet->mKey);

                    if(FILE* NewFile = fopen(ValidSemaphore, "wb"))
                    {
                        fwrite(&Packet->mCommand, 4, 1, NewFile);
                        fclose(NewFile);
                    }

                    dSemaphore Waiting;
                    Waiting.bind(ValidSemaphore);
                    Waiting.unlock();
                }
                break;
            }
        }
        else break;
    }
    return Result;
}
