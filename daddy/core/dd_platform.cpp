/// @brief     Definition of platform functions.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_platform.hpp"

// Dependencies
#include "dd_binary.hpp"
#include "dd_thread.hpp"
#include <csignal>
#include <map>
#include <string>
#include <thread>
#include <stack>
#if DD_OS_WINDOWS
    #if DD_OS_WINDOWS_MINGW
        #include <ws2tcpip.h>
    #else
        #include <windows.h>
        #pragma comment(lib, "ws2_32.lib")
        #include <psapi.h>
        #pragma comment(lib, "psapi.lib")
    #endif
    #define SOCKET_DATA                       SOCKET
    #define SOCKET_NEW                        socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
    #define SOCKET_SET_KEEPALIVE(S)           do {char _ = 1; setsockopt(S, SOL_SOCKET, SO_KEEPALIVE, &_, sizeof(_));} while(false)
    #define SOCKET_SET_TIMEOUT(S, MSEC, RET)  do {fd_set fd; FD_ZERO(&fd); FD_SET(S, &fd); \
                                              struct timeval _ = {0, (MSEC) * 1000}; \
                                              RET = select(int(S + 1), &fd, nullptr, nullptr, &_);} while(false)
    #define SOCKET_DELETE(S)                  closesocket(S)
    #define SOCKET_CONNECT(S, ADDR, LEN)      connect(S, ADDR, LEN)
    #define SOCKET_BIND(S, ADDR, LEN)         bind(S, ADDR, LEN)
    #define SOCKET_ACCEPT(S, ADDR, LEN)       accept(S, ADDR, LEN)
    #define SOCKET_LISTEN(S, COUNT)           listen(S, COUNT)
    #define SOCKET_SEND(S, BUF, LEN)          send(S, (const char*) BUF, LEN, 0)
    #define SOCKET_RECV(S, BUF, LEN)          recv(S, (char*) BUF, LEN, 0)
    #define SOCKET_RECVLEN(S, LEN)            ioctlsocket(S, FIONREAD, (u_long*) &LEN)
    #undef min
    #undef max
#elif DD_OS_LINUX
    #include <arpa/inet.h>
    #include <cstring>
    #include <netdb.h>
    #include <netinet/in.h>
    #include <sys/ioctl.h>
    #include <sys/socket.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <dirent.h>
    #include <unistd.h>
    #define SOCKET_DATA                       int
    #define SOCKET_NEW                        ::socket(AF_INET, SOCK_STREAM, 0)
    #define SOCKET_SET_KEEPALIVE(S)           do {int _ = 1; ::setsockopt(S, SOL_SOCKET, SO_KEEPALIVE, &_, sizeof(_));} while(false)
    #define SOCKET_SET_TIMEOUT(S, MSEC, RET)  do {fd_set fd; FD_ZERO(&fd); FD_SET(S, &fd); \
                                              struct timeval _ = {0, (MSEC) * 1000}; \
                                              RET = ::select(S + 1, &fd, nullptr, nullptr, &_);} while(false)
    #define SOCKET_DELETE(S)                  ::close(S)
    #define SOCKET_CONNECT(S, ADDR, LEN)      ::connect(S, ADDR, LEN)
    #define SOCKET_BIND(S, ADDR, LEN)         ::bind(S, ADDR, LEN)
    #define SOCKET_ACCEPT(S, ADDR, LEN)       ::accept(S, ADDR, (socklen_t*) LEN)
    #define SOCKET_LISTEN(S, COUNT)           ::listen(S, COUNT)
    #define SOCKET_SEND(S, BUF, LEN)          ::send(S, BUF, LEN, MSG_NOSIGNAL)
    #define SOCKET_RECV(S, BUF, LEN)          ::recv(S, BUF, LEN, MSG_NOSIGNAL)
    #define SOCKET_RECVLEN(S, LEN)            ::ioctl(S, FIONREAD, &LEN)
    #define SOCKET_ERROR                      (-1)
#endif
typedef SOCKET_DATA SocketData;

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ SocketAgentP
class SocketAgentP : public dEscaper
{
public:
    static void checkNetwork(bool push);

public:
    void attach() const;
    void detach() const;
    void disconnect();

public:
    virtual uint32_t count() const;
    virtual bool sendTo(uint32_t id, const dBinary& binary, bool sizefield);
    virtual bool sendAll(const dBinary& binary, bool sizefield);
    virtual dBinary recvFrom(uint32_t id);
    virtual void recvAll(dSocket::RecvCB cb);
    virtual void kick(uint32_t id);

public:
    inline bool isConnected() const
    {return (mSocket != SOCKET_ERROR);}

DD_escaper(SocketAgentP, dEscaper):
    void _init_(InitType)
    {
        mSocket = SOCKET_ERROR;
        mAssignCB = nullptr;
        mWaitForDumpLength = 0;
        mWaitForDumpPos = 0;
        mWaitForDumps = nullptr;
        mRefCount = 1;
    }
    void _quit_()
    {
        DD_assert(mRefCount == 0 || mRefCount == 1, "reference count does not match.");
        disconnect();
    }
    void _move_(_self_&& rhs)
    {
        mSocket = DD_rvalue(rhs.mSocket);
        mAssignCB = DD_rvalue(rhs.mAssignCB);
        mWaitForDumpLength = DD_rvalue(rhs.mWaitForDumpLength);
        mWaitForDumpPos = DD_rvalue(rhs.mWaitForDumpPos);
        mWaitForDumps = DD_rvalue(rhs.mWaitForDumps);
        mRefCount = DD_rvalue(rhs.mRefCount);
    }
    SocketData mSocket;
    dSocket::AssignCB mAssignCB;
    uint32_t mWaitForDumpLength;
    uint32_t mWaitForDumpPos;
    dump* mWaitForDumps;
    mutable int32_t mRefCount;

public:
    DD_passage(SocketAgentP, SocketData socket, dSocket::AssignCB cb)
    {
        _init_(InitType::Create);

        if(socket)
        {
            checkNetwork(true);
            mSocket = socket;
            mAssignCB = cb;
        }
    }
};

void SocketAgentP::checkNetwork(bool push)
{
    static int32_t gRefCount = 0;
    if(push)
    {
        if(gRefCount++ == 0)
        {
            #if DD_OS_WINDOWS
                WSADATA WsaData;
                if(WSAStartup(MAKEWORD(2, 2), &WsaData) != 0)
                    DD_assert(false, "WSAStartup failed...");
            #elif DD_OS_LINUX
                signal(SIGPIPE, SIG_IGN); // 닫힌 Socket에 send시 크래시방지
            #endif
        }
    }
    else
    {
        if(--gRefCount == 0)
        {
            #if DD_OS_WINDOWS
                WSACleanup();
            #endif
        }
    }
}

void SocketAgentP::attach() const
{
    mRefCount++;
}

void SocketAgentP::detach() const
{
    if(--mRefCount == 0)
        delete this;
}

void SocketAgentP::disconnect()
{
    if(mWaitForDumps)
    {
        delete[] mWaitForDumps;
        mWaitForDumps = nullptr;
    }
    if(mSocket != SOCKET_ERROR)
    {
        SOCKET_DELETE(mSocket);
        mSocket = SOCKET_ERROR;
        checkNetwork(false);
    }
}

uint32_t SocketAgentP::count() const
{
    return (isConnected())? 1 : 0;
}

bool SocketAgentP::sendTo(uint32_t, const dBinary& binary, bool sizefield)
{
    if(mSocket != SOCKET_ERROR)
    {
        const uint32_t Length = binary.length();
        if(sizefield)
        {
            if(0 <= SOCKET_SEND(mSocket, &Length, 4))
            if(0 <= SOCKET_SEND(mSocket, binary.buffer(), Length))
                return true;
        }
        else if(0 <= SOCKET_SEND(mSocket, binary.buffer(), Length))
            return true;
        disconnect();
    }
    return false;
}

bool SocketAgentP::sendAll(const dBinary& binary, bool sizefield)
{
    return sendTo(0, binary, sizefield);
}

dBinary SocketAgentP::recvFrom(uint32_t)
{
    if(mSocket != SOCKET_ERROR)
    {
        if(mWaitForDumps == nullptr)
        {
            uint32_t RecvLength = 0;
            if(0 <= SOCKET_RECVLEN(mSocket, RecvLength))
            {
                if(4 <= RecvLength)
                {
                    if(0 <= SOCKET_RECV(mSocket, &mWaitForDumpLength, 4))
                    {
                        mWaitForDumpPos = 0;
                        mWaitForDumps = new dump[mWaitForDumpLength];
                    }
                    else disconnect();
                }
            }
            else disconnect();
        }
        if(mWaitForDumps != nullptr)
        {
            uint32_t RecvLength = 0;
            if(0 <= SOCKET_RECVLEN(mSocket, RecvLength))
            {
                if(0 < RecvLength)
                {
                    if(mWaitForDumpLength - mWaitForDumpPos < RecvLength)
                        RecvLength = mWaitForDumpLength - mWaitForDumpPos;
                    if(0 <= SOCKET_RECV(mSocket, &mWaitForDumps[mWaitForDumpPos], RecvLength))
                    {
                        if((mWaitForDumpPos += RecvLength) == mWaitForDumpLength)
                        {
                            dump* OldDumps = mWaitForDumps;
                            mWaitForDumps = nullptr;
                            return dBinary::fromInternal(OldDumps, mWaitForDumpLength);
                        }
                    }
                    else disconnect();
                }
            }
            else disconnect();
        }
    }
    return dBinary();
}

void SocketAgentP::recvAll(dSocket::RecvCB cb)
{
    DD_assert(cb, "cb cannot be nullptr");
    dBinary Result = recvFrom(0);
    if(0 < Result.length())
        cb(0, Result);
}

void SocketAgentP::kick(uint32_t)
{
    disconnect();
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ ServerAgentP
class ServerAgentP : public SocketAgentP
{
public:
    uint32_t count() const override;
    bool sendTo(uint32_t id, const dBinary& binary, bool sizefield) override;
    bool sendAll(const dBinary& binary, bool sizefield) override;
    dBinary recvFrom(uint32_t id) override;
    void recvAll(dSocket::RecvCB cb) override;
    void kick(uint32_t id) override;

DD_escaper(ServerAgentP, SocketAgentP):
    void _init_(InitType type)
    {
        SocketAgentP::_init_(type);
        mPeers = (type == InitType::Create)? new std::map<uint32_t, SocketAgentP*>() : nullptr;
        mLastAcceptID = 0;
        mInterrupted = false;
        mAcceptor = nullptr;
    }
    void _quit_()
    {
        mPeerMutex.lock();
        {
            for(const auto& iSocket : *mPeers)
                if(iSocket.second)
                    iSocket.second->detach();
            delete mPeers;
        }
        mPeerMutex.unlock();

        if(mAcceptor)
        {
            mInterrupted = true;
            mAcceptor->join();
            delete mAcceptor;
        }
        SocketAgentP::_quit_();
    }
    void _move_(_self_&& rhs)
    {
        SocketAgentP::_move_(DD_rvalue(rhs));
        mPeers = DD_rvalue(rhs.mPeers);
        mPeerMutex = DD_rvalue(rhs.mPeerMutex);
        mLastAcceptID = DD_rvalue(rhs.mLastAcceptID);
        mInterrupted = DD_rvalue(rhs.mInterrupted);
        mAcceptor = DD_rvalue(rhs.mAcceptor);
    }
    std::map<uint32_t, SocketAgentP*>* mPeers;
    dMutex mPeerMutex;
    uint32_t mLastAcceptID;
    bool mInterrupted;
    std::thread* mAcceptor;

public:
    DD_passage_(ServerAgentP, SocketData socket, dSocket::AssignCB cb)_with_super(socket, cb)
    {
        mPeers = new std::map<uint32_t, SocketAgentP*>();
        mLastAcceptID = 0;
        mInterrupted = false;
        mAcceptor = new std::thread([](ServerAgentP* self)->void
        {
            while(!self->mInterrupted)
            {
                int Result = 0;
                SOCKET_SET_TIMEOUT(self->mSocket, 100, Result);
                if(0 < Result)
                {
                    struct sockaddr_in Addr;
                    memset(&Addr, 0, sizeof(Addr));
                    int AddrSize = sizeof(Addr);
                    SocketData NewSocket = SOCKET_ACCEPT(self->mSocket, (struct sockaddr*) &Addr, &AddrSize);
                    if(NewSocket == SOCKET_ERROR) return;
                    SOCKET_SET_KEEPALIVE(NewSocket);

                    self->mPeerMutex.lock();
                    {
                        DD_assert(self->mPeers, "mPeers cannot be nullptr");
                        uint32_t NewAcceptID = ++self->mLastAcceptID;
                        (*self->mPeers)[NewAcceptID] = new SocketAgentP(NewSocket, nullptr);
                    }
                    self->mPeerMutex.unlock();

                    if(self->mAssignCB)
                        self->mAssignCB(dSocket::AssignType::Entrance, self->mLastAcceptID);
                }
                else if(Result == 0) // TimeOut
                    continue;
                else return; // Error
            }
        }, this);
    }
};

uint32_t ServerAgentP::count() const
{
    return uint32_t(mPeers->size());
}

bool ServerAgentP::sendTo(uint32_t id, const dBinary& binary, bool sizefield)
{
    bool Result = false;
    mPeerMutex.lock();
    {
        DD_assert(mPeers, "mPeers cannot be nullptr");
        auto CurSocket = mPeers->find(id);
        if(CurSocket != mPeers->end())
        {
            Result = CurSocket->second->sendTo(0, binary, sizefield);
            if(!Result) mPeers->erase(CurSocket);
        }
    }
    mPeerMutex.unlock();
    return Result;
}

bool ServerAgentP::sendAll(const dBinary& binary, bool sizefield)
{
    bool Result = false;
    mPeerMutex.lock();
    {
        DD_assert(mPeers, "mPeers cannot be nullptr");
        int SuccessCount = 0, FailureCount = 0;
        for(auto iSocket = mPeers->begin(); iSocket != mPeers->end();)
        {
            const bool CurResult = iSocket->second->sendTo(0, binary, sizefield);
            if(!CurResult)
            {
                iSocket = mPeers->erase(iSocket);
                FailureCount++;
            }
            else
            {
                iSocket++;
                SuccessCount++;
            }
        }
        Result = (0 < SuccessCount && FailureCount == 0);
    }
    mPeerMutex.unlock();
    return Result;
}

dBinary ServerAgentP::recvFrom(uint32_t id)
{
    dBinary Result;
    mPeerMutex.lock();
    {
        DD_assert(mPeers, "mPeers cannot be nullptr");
        auto CurSocket = mPeers->find(id);
        if(CurSocket != mPeers->end())
            Result = CurSocket->second->recvFrom(0);
    }
    mPeerMutex.unlock();
    return Result;
}

void ServerAgentP::recvAll(dSocket::RecvCB cb)
{
    std::stack< std::pair<uint32_t, dBinary> > CallStack;

    DD_assert(cb, "cb cannot be nullptr");
    mPeerMutex.lock();
    {
        DD_assert(mPeers, "mPeers cannot be nullptr");
        for(auto iSocket : *mPeers)
        {
            dBinary NewBinary = iSocket.second->recvFrom(0);
            if(0 < NewBinary.length())
                CallStack.push(std::make_pair(iSocket.first, NewBinary));
        }
    }
    mPeerMutex.unlock();

    while(!CallStack.empty())
    {
        cb(CallStack.top().first, CallStack.top().second);
        CallStack.pop();
    }
}

void ServerAgentP::kick(uint32_t id)
{
    mPeerMutex.lock();
    {
        DD_assert(mPeers, "mPeers cannot be nullptr");
        auto CurSocket = mPeers->find(id);
        if(CurSocket != mPeers->end())
            mPeers->erase(CurSocket);
    }
    mPeerMutex.unlock();
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dSocket
bool dSocket::openClient(dLiteral host, uint16_t port, AssignCB cb)
{
    SocketAgentP::checkNetwork(true);
    {
        if(const struct hostent* Host = gethostbyname(host.buildNative()))
        {
            struct sockaddr_in Addr;
            memset(&Addr, 0, sizeof(Addr));
            Addr.sin_family = AF_INET;
            #if DD_OS_WINDOWS
                Addr.sin_addr.S_un.S_un_b.s_b1 = (Host->h_addr_list[0][0] & 0xFF);
                Addr.sin_addr.S_un.S_un_b.s_b2 = (Host->h_addr_list[0][1] & 0xFF);
                Addr.sin_addr.S_un.S_un_b.s_b3 = (Host->h_addr_list[0][2] & 0xFF);
                Addr.sin_addr.S_un.S_un_b.s_b4 = (Host->h_addr_list[0][3] & 0xFF);
            #elif DD_OS_LINUX
                Addr.sin_addr.s_addr = *((long int*) Host->h_addr_list[0]);
            #else
                #error [daddy] this platform is not ready!
            #endif
            Addr.sin_port = htons(port);

            SocketData NewSocket = SOCKET_NEW;
            if(NewSocket != SOCKET_ERROR)
            {
                SOCKET_SET_KEEPALIVE(NewSocket);
                if(SOCKET_CONNECT(NewSocket, (struct sockaddr*) &Addr, sizeof(Addr)) != SOCKET_ERROR)
                {
                    mRefAgent->detach();
                    mRefAgent = new SocketAgentP(NewSocket, cb);
                    SocketAgentP::checkNetwork(false);
                    return true;
                }
                SOCKET_DELETE(NewSocket);
            }
        }
        close();
    }
    SocketAgentP::checkNetwork(false);
    return false;
}

bool dSocket::openServer(uint16_t port, AssignCB cb)
{
    SocketAgentP::checkNetwork(true);
    {
        struct sockaddr_in Addr;
        memset(&Addr, 0, sizeof(Addr));
        Addr.sin_family = AF_INET;
        Addr.sin_addr.s_addr = htonl(INADDR_ANY);
        Addr.sin_port = htons(port);

        SocketData NewSocket = SOCKET_NEW;
        if(NewSocket != SOCKET_ERROR)
        {
            SOCKET_SET_KEEPALIVE(NewSocket);
            if(SOCKET_BIND(NewSocket, (struct sockaddr*) &Addr, sizeof(Addr)) != SOCKET_ERROR)
            if(SOCKET_LISTEN(NewSocket, SOMAXCONN) != SOCKET_ERROR)
            {
                mRefAgent->detach();
                mRefAgent = new ServerAgentP(NewSocket, cb);
                SocketAgentP::checkNetwork(false);
                return true;
            }
            SOCKET_DELETE(NewSocket);
        }
        close();
    }
    SocketAgentP::checkNetwork(false);
    return false;
}

void dSocket::close()
{
    auto* OldRefAgent = mRefAgent;
    (mRefAgent = blank().mRefAgent)->attach();
    OldRefAgent->detach();
}

uint32_t dSocket::count() const
{
    return mRefAgent->count();
}

bool dSocket::sendTo(uint32_t id, const dBinary& binary, bool sizefield)
{
    return mRefAgent->sendTo(id, binary, sizefield);
}

bool dSocket::sendAll(const dBinary& binary, bool sizefield)
{
    return mRefAgent->sendAll(binary, sizefield);
}

dBinary dSocket::recvFrom(uint32_t id)
{
    return mRefAgent->recvFrom(id);
}

void dSocket::recvAll(RecvCB cb)
{
    mRefAgent->recvAll(cb);
}

void dSocket::kick(uint32_t id)
{
    mRefAgent->kick(id);
}

const dSocket& dSocket::blank()
{DD_global_direct(dSocket, _, (ptr_u) new SocketAgentP()); return _;}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dSocket::escaper
void dSocket::_init_(InitType type)
{
    if(type == InitType::Create)
        (mRefAgent = blank().mRefAgent)->attach();
    else mRefAgent = nullptr;
}

void dSocket::_quit_()
{
    if(mRefAgent)
        mRefAgent->detach();
}

void dSocket::_move_(_self_&& rhs)
{
    mRefAgent = rhs.mRefAgent;
}

void dSocket::_copy_(const _self_& rhs)
{
    (mRefAgent = rhs.mRefAgent)->attach();
}

DD_passage_define_alone(dSocket, ptr_u agent)
{
    mRefAgent = (SocketAgentP*) agent;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dUtility
ptr_u dUtility::runProcess(dLiteral exepath, dLiteral args, dLiteral runtype, dLiteral runpath)
{
    ptr_u ProcessHandle = 0;

    #if DD_OS_WINDOWS
        char ExecutePath[1024] = {};
        strcat_s(ExecutePath, exepath.buildNative());
        strcat_s(ExecutePath, " ");
        strcat_s(ExecutePath, args.buildNative());

        utf8s CurrentDirectory = NULL;
        if(0 < runpath.length())
        {
            CurrentDirectory = runpath.buildNative();
            CreateDirectoryA(CurrentDirectory, NULL);
        }

        // 프로세스 실행
        STARTUPINFOA SI;
        ZeroMemory(&SI, sizeof(SI));
        SI.cb = sizeof(SI);
        PROCESS_INFORMATION PI;
        ZeroMemory(&PI, sizeof(PI));
        if(!strcmp(runtype.buildNative(), "run"))
        {
            CreateProcessA(NULL, ExecutePath, NULL, NULL, FALSE, CREATE_NO_WINDOW, NULL,
                CurrentDirectory, &SI, &PI);
            ProcessHandle = *((ptr_u*) &PI.hProcess);
        }
        else if(!strcmp(runtype.buildNative(), "run_with_console"))
        {
            CreateProcessA(NULL, ExecutePath, NULL, NULL, FALSE, CREATE_NEW_CONSOLE, NULL,
                CurrentDirectory, &SI, &PI);
            ProcessHandle = *((ptr_u*) &PI.hProcess);
        }
    #elif DD_OS_LINUX
        char ExecutePath[1024] = {};
        strcat(ExecutePath, exepath.buildNative());

        if(chmod(ExecutePath, 0755) != -1)
        {
            // 프로세스 실행
            if(!strcmp(runtype.buildNative(), "certify_only")) {} // 스킵
            else if(!strcmp(runtype.buildNative(), "run"))
            {
                if(fork() == 0)
                {
                    chmod(ExecutePath, 0755);
                    if(0 < args.length())
                        execlp(ExecutePath, ExecutePath, args.buildNative(), NULL);
                    else execlp(ExecutePath, ExecutePath, NULL);
                }
            }
            else if(!strcmp(runtype.buildNative(), "run_with_console"))
            {
                chmod(ExecutePath, 0755);
                char SystemCall[1024];
                SystemCall[0] = '\0';
                if(0 < runpath.length())
                {
                    strcat(SystemCall, "mkdir -p ");
                    strcat(SystemCall, runpath.buildNative());
                    strcat(SystemCall, " && cd ");
                    strcat(SystemCall, runpath.buildNative());
                    strcat(SystemCall, " && ");
                }
                strcat(SystemCall, "gnome-terminal -e '");
                strcat(SystemCall, ExecutePath);
                if(0 < args.length())
                {
                    strcat(SystemCall, " ");
                    strcat(SystemCall, args.buildNative());
                }
                strcat(SystemCall, "\'");
                system(SystemCall);
            }
        }
    #else
        #error [daddy] this platform is not ready!
    #endif

    return ProcessHandle;
}

void dUtility::killProcess(ptr_u handle)
{
    #if DD_OS_WINDOWS
        HANDLE OldHandle = *((HANDLE*) &handle);
        TerminateProcess(OldHandle, 0);
        CloseHandle(OldHandle);
    #elif DD_OS_LINUX
        pid_t ProcessID = *((pid_t*) &handle);
        kill(ProcessID, SIGINT);
    #else
        #error [daddy] this platform is not ready!
    #endif
}

void dUtility::killProcessAll(dLiteral exename)
{
    #if DD_OS_WINDOWS
        DWORD* ProcessIDs = new DWORD[100000];
        DWORD ProcessBytes = 0;
        EnumProcesses(ProcessIDs, sizeof(DWORD) * 100000, &ProcessBytes);
        const int ProcessCount = ProcessBytes / sizeof(DWORD);

        utf8 TempName[256];
        utf8s CompName = exename.buildNative();
        for(int i = 0; i < ProcessCount; ++i)
        {
            HANDLE CurProcess = OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcessIDs[i]);
            if(GetModuleBaseNameA(CurProcess, 0, TempName, 256))
                if(!strcmp(TempName, CompName))
                    TerminateProcess(CurProcess, 0);
            CloseHandle(CurProcess);
        }
        delete[] ProcessIDs;
    #elif DD_OS_LINUX
        DIR* CurDir = opendir("/proc/");
        dirent* CurDirEntry = nullptr;
        while((CurDirEntry = readdir(CurDir)) != nullptr)
        {
            if(strspn(CurDirEntry->d_name, "0123456789") == strlen(CurDirEntry->d_name))
            {
                char ExeLink[252];
                strcpy(ExeLink, "/proc/");
                strcat(ExeLink, CurDirEntry->d_name);
                strcat(ExeLink, "/exe");

                char TargetName[252];
                int TargetLength = readlink(ExeLink, TargetName, 252);
                if(0 < TargetLength)
                {
                    TargetName[TargetLength] = '\0';
                    if(strstr(TargetName, exename.buildNative()))
                    {
                        const int ProcessID = atoi(CurDirEntry->d_name);
                        kill(ProcessID, SIGINT);
                    }
                }
            }
        }
        closedir(CurDir);
    #else
        #error [daddy] this platform is not ready!
    #endif
}

} // namespace Daddy
