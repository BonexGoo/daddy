/// @brief     Definition of unique-id utility.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_unique.hpp"

// Dependencies
#include "dd_thread.hpp"
#if DD_OS_WINDOWS
    #include <windows.h>
    #include <intrin.h>
    #pragma comment(lib, "advapi32.lib")
#elif DD_OS_LINUX
    #include <linux/if.h>
    #include <netdb.h> // IPPROTO_IP가 쓰임
    #include <scsi/sg.h>
    #include <stdint.h>
    #include <string.h>
    #include <sys/ioctl.h>
    #include <unistd.h>
#endif

namespace Daddy {

dString dUnique::fingerPrint(utf8s_nn string, int32_t length)
{
    DD_assert(-1 <= length, "the index has exceeded the array limit.");
    if(length == -1)
        length = (int32_t) strlen(string);

    uint32_t OSCode = 0x1F; // 32종까지 표현
    #if DD_OS_WINDOWS
        OSCode &= 0x01;
    #elif DD_OS_LINUX
        OSCode &= 0x02;
    #else
        OSCode &= 0x00;
    #endif

    // CRC64처리
    uint64_t CrcTable[256];
    for(int i = 0; i < 256; ++i)
    {
        uint64_t crc = i;
        for(int j = 0; j < 8; ++j)
        {
            if(crc & 1)
                crc = (crc >> 1) ^ 0xC96C5795D7870F42;
            else crc >>= 1;
        }
        CrcTable[i] = crc;
    }
    uint64_t CrcCode = 0;
    utf8s_nn CrcFocus = string;
    for(int i = 0; i < length; ++i)
        CrcCode = CrcTable[(CrcCode ^ *(CrcFocus++)) & 0xFF] ^ (CrcCode >> 8);

    // 6자리 장치식별코드
    uint32_t DeviceCode[10];
    DeviceCode[0] = ((OSCode & 0x0000001F) << 1) | (CrcCode & 0x1);
    for(int i = 0; i < 9; ++i)
        DeviceCode[i + 1] = (CrcCode >> (1 + i * 7)) & 0x3F;

    // 장치식별ID화
    dString Result;
    for(int i = 0; i < 10; ++i)
    {
        const uint32_t CurCode = DeviceCode[i];
        if(CurCode < 26)
            Result += 'A' + CurCode;
        else if(CurCode < 26 + 26)
            Result += 'a' + (CurCode - 26);
        else if(CurCode < 26 + 26 + 10)
            Result += '0' + (CurCode - 26 - 26);
        // 어차피 CRC64과정에서 손실된 정보라 미관상 조금 더 손실시킴
        else if(CurCode == 10 + 26 + 26)
            Result += 'x';
        else Result += 'X';
    }
    return Result;
}

dLiteral dUnique::deviceId(dString* fp)
{
    DD_global_direct(dString, gDeviceID);
    DD_global_direct(dString, gFingerPrint);
    if(0 < gDeviceID.length())
    {
        if(fp) *fp = gFingerPrint;
        return gDeviceID;
    }

    #if DD_OS_WINDOWS
        // 유저이름
        CHAR UserName[MAX_PATH];
        DWORD UserNameLen = MAX_PATH;
        if(GetUserNameA(UserName, &UserNameLen))
            gFingerPrint.add(UserName, (int32_t) strlen(UserName));

        // 하드디스크시리얼
        DWORD VolSerial = 0;
        if(GetVolumeInformationA("C:/", NULL, NULL, &VolSerial, NULL, NULL, NULL, NULL))
        {
            gFingerPrint += "/vol:";
            gFingerPrint += dString::fromNumber(VolSerial);
        }
    #elif DD_OS_LINUX
        // 유저이름
        char UserName[_SC_LOGIN_NAME_MAX];
        size_t UserNameLen = _SC_LOGIN_NAME_MAX;
        if(!getlogin_r(UserName, UserNameLen))
            gFingerPrint.add(UserName, strlen(UserName));

        // 맥어드레스
        struct ifreq s;
        int fd = socket(PF_INET, SOCK_DGRAM, IPPROTO_IP);
        strcpy(s.ifr_name, "eth0");
        if(!ioctl(fd, SIOCGIFHWADDR, &s))
        {
            gFingerPrint += "/mac:";
            for(int i = 0; i < 6; ++i)
            {
                if(0 < i)
                    gFingerPrint += ".";
                gFingerPrint += String::fromNumber(s.ifr_addr.sa_data[i] & 0xFF);
            }
        }
    #endif

    // 결과 및 출력
    gDeviceID = fingerPrint(gFingerPrint.string(), gFingerPrint.length());
    printf("[daddy] deviceId: \"%.*s\" ---> %.*s\n",
        gFingerPrint.length(), gFingerPrint.string(), gDeviceID.length(), gDeviceID.string());
    if(fp) *fp = gFingerPrint;
    return gDeviceID;
}

dLiteral dUnique::instanceId(dString* fp)
{
    DD_global_direct(dString, gInstanceID);
    DD_global_direct(dString, gFingerPrint);
    if(0 < gInstanceID.length())
    {
        if(fp) *fp = gFingerPrint;
        return gInstanceID;
    }

    // 응용프로그램 패스
    static char Path[260] = {0};
    if(Path[0] == '\0')
    {
        #if DD_OS_WINDOWS
            HMODULE Module = GetModuleHandleA(NULL);
            GetModuleFileNameA(Module, Path, 260);
        #elif DD_OS_LINUX
            char Link[50];
            sprintf(Link, "/proc/%d/exe", getpid());
            readlink(Link, Path, 260);
        #endif
    }
    gFingerPrint.add(Path, (int32_t) strlen(Path));

    // 빈 인스턴스ID 찾기
    class InstanceFinder
    {
    public:
        InstanceFinder(utf8* path)
        {
            utf8* PathFocus = path;
            do
            {
                if(*PathFocus == '/' || *PathFocus == '\\')
                    *PathFocus = ':';
            }
            while(*(++PathFocus) != '\0');

            for(int i = 0; true; ++i)
            {
                sprintf(PathFocus, "<%d>", i);
                if(mInstanceSem.createOnly(path))
                {
                    mInstanceID = i;
                    break;
                }
            }
        }
        ~InstanceFinder() {}
    public:
        inline int id() const {return mInstanceID;}
    private:
        dSemaphore mInstanceSem;
        int mInstanceID;
    };

    DD_global_direct(InstanceFinder, gInstanceFinder, Path);

    // 빈 인스턴스ID
    gFingerPrint += "<";
    gFingerPrint += dString::fromNumber(gInstanceFinder.id());
    gFingerPrint += ">";

    // 결과 및 출력
    gInstanceID = fingerPrint(gFingerPrint.string(), gFingerPrint.length());
    printf("[daddy] instanceId: \"%.*s\" ---> %.*s\n",
        gFingerPrint.length(), gFingerPrint.string(), gInstanceID.length(), gInstanceID.string());
    if(fp) *fp = gFingerPrint;
    return gInstanceID;
}

} // namespace Daddy
