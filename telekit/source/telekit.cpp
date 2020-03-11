#include <daddy.hpp>
#include <csignal>
#include <string.h>
#include <thread>

#if DD_OS_WINDOWS
    #include <windows.h>
    #define LIB_DATA                  HMODULE
    #define LIB_LOAD(PATH)            LoadLibraryA(PATH)
    #define LIB_FREE(LIB)             FreeLibrary(LIB)
    #define LIB_PROC(LIB, NAME)       GetProcAddress(LIB, NAME)
#elif DD_OS_LINUX
    #include <dlfcn.h>
    #define LIB_DATA                  void*
    #define LIB_LOAD(PATH)            dlopen(PATH, RTLD_LAZY)
    #define LIB_FREE(LIB)             dlclose(LIB)
    #define LIB_PROC(LIB, NAME)       dlsym(LIB, NAME)
#endif
typedef LIB_DATA LibData;

class TeleKit : public dTeleAdapter
{
public:
    TeleKit(LibData lib);
    ~TeleKit() override;

public:
    bool onCreate() override;
    bool onDestroy() override;

public:
    void sleep() override;
    bool alived() const override;

private:
    bool mAlived;
    dTeleApi::V10::onPlugInCB mPlugInCB;
    dTeleApi::V10::onCycleCB mCycleCB;
};

DD_global bool gInterrupt = false;
static void OnInterrupt(int signum)
{
    printf("[daddy] Interrupt signal: %d\n", signum);
    gInterrupt = true;
}

static int ErrorToExit(utf8s message)
{
    printf(message);
    std::this_thread::sleep_for(std::chrono::milliseconds(3000));
    return 0;
}

int main(int argc, char* argv[])
{
    signal(SIGINT, OnInterrupt); // Ctrl+C

    if(argc == 2)
    {
        // 동적라이브러리 연결
        printf("[daddy] * * * * * load library * * * * *\n");
        LibData NewLib = LIB_LOAD(argv[1]);
        if(!NewLib) return ErrorToExit("[daddy] library not found.\n");
        auto MarkIn = (dTelepath::onMarkInCB) LIB_PROC(NewLib, "onMarkIn");
        if(!MarkIn) return ErrorToExit("[daddy] onMarkIn function does not exist.\n");

        // 컴포넌트의 정보획득
        utf8s ComponentVer = MarkIn((int32_t) dTeleApi::MarkInType::ComponentVer);
        utf8s EntityVer = MarkIn((int32_t) dTeleApi::MarkInType::EntityVer);
        utf8s EntityName = MarkIn((int32_t) dTeleApi::MarkInType::EntityName);
        utf8s EntityUuid = MarkIn((int32_t) dTeleApi::MarkInType::EntityUuid);
        printf("[daddy] componentVer: %s\n", ComponentVer);
        printf("[daddy] entityVer: %s\n", EntityVer);
        printf("[daddy] entityName: %s\n", EntityName);
        printf("[daddy] entityUuid: %s\n", EntityUuid);

        // 클라이언트 생성
        printf("[daddy] * * * * * create client * * * * *\n");
        auto NewClient = (TeleGateClientP*) MarkIn((int32_t) dTeleApi::MarkInType::CreateClient);
        if(!NewClient) return ErrorToExit("[daddy] client creation failed.\n");

        // 버전에 맞는 어댑터 할당
        printf("[daddy] * * * * * create adapter * * * * *\n");
        dTeleAdapter* Adapter = nullptr;
        if(!strcmp(ComponentVer, "V10"))
            Adapter = new TeleKit(NewLib);
        else return ErrorToExit("[daddy] componentVer\'s answer could not be understood.\n");

        // 생명주기
        do
        {
            if(Adapter->onCreate())
            {
                while(Adapter->alived() && !gInterrupt)
                {
                    dTelepath::gateCall("localhost", NewClient, MarkIn);
                    while(dTelepath::nextReceive(NewClient));
                    Adapter->sleep();
                }
            }
        }
        while(!Adapter->onDestroy() && !gInterrupt);

        // 어댑터 해제
        printf("[daddy] * * * * * release adapter * * * * *\n");
        delete Adapter;

        // 클라이언트 소멸
        printf("[daddy] * * * * * release client * * * * *\n");
        auto ReleaseResult = (bool) MarkIn((int32_t) dTeleApi::MarkInType::ReleaseClient);
        if(!ReleaseResult) return ErrorToExit("[daddy] client release failed.\n");

        // 동적라이브러리 해제
        printf("[daddy] * * * * * free library * * * * *\n");
        LIB_FREE(NewLib);

        printf("[daddy] * * * * * done * * * * *\n");
        return 0;
    }
    return ErrorToExit("[daddy] call the argument again like this! (waiting 3sec)\n"
        "C:\\>adapter.exe core.dll\n");
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ TeleKit
TeleKit::TeleKit(LibData lib)
{
    mAlived = false;
    mPlugInCB = (dTeleApi::V10::onPlugInCB) LIB_PROC(lib, "onPlugIn");
    mCycleCB = (dTeleApi::V10::onCycleCB) LIB_PROC(lib, "onCycle");
}

TeleKit::~TeleKit()
{
}

bool TeleKit::onCreate()
{
    mAlived = true;
    printf("[daddy] * * * * * calling onCreate() * * * * *\n");
    return mCycleCB((int32_t) dTeleApi::CycleType::Create);
}

bool TeleKit::onDestroy()
{
    printf("[daddy] * * * * * calling onDestroy() * * * * *\n");
    return mCycleCB((int32_t) dTeleApi::CycleType::Destroy);
}

void TeleKit::sleep()
{
    std::this_thread::sleep_for(std::chrono::milliseconds(10));
    mAlived &= mCycleCB((int32_t) dTeleApi::CycleType::Tick);
}

bool TeleKit::alived() const
{
    return mAlived;
}
