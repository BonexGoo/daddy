/*!
\mainpage daddy ServerEngine
\section information 목적
    - 컴포넌트식 네트워크 서버엔진
\section advanced 소개
    - dd_binary.hpp/dBinary: 바이너리의 스마트한 데이터관리
    - dd_detector.hpp/dDetector: logger랑 통신하는 로그클라이언트
    - dd_escaper.hpp/dEscaper: 기존 객체개념을 탈출한 새로운 객체모델
    - dd_global.hpp/dGlobal: 일괄적으로 On/Off가 가능한 글로벌인스턴스관리
    - dd_handle.hpp/dHandle: 사용자 객체의 스마트한 핸들관리
    - dd_markup.hpp/dMarkup: 구조적데이터관리(현재 yaml파서)
    - dd_platform.hpp/dSocket: 서버/클라이언트의 역할모델
    - dd_platform.hpp/dUtility: 유틸리티 기능제공(현재 프로세스관리)
    - dd_string.hpp/dLiteral: 상수를 보장하는 스트링객체
    - dd_string.hpp/dString: 복사하지 않고 스트링끼리 부분참조되는 스트링객체
    - dd_telepath.hpp/dTelepath: telegraph랑 통신하는 RPC클라이언트
    - dd_thread.hpp/dMutex: 뮤텍스객체
    - dd_thread.hpp/dSemaphore: 세마포어객체
    - dd_unique.hpp/dUnique: 자기 프로세스의 각종 정보제공
    - dd_zoker.hpp/dZoker: 메모리할당없는 구조적바이너리 생산객체
    - dd_zoker.hpp/dZokeReader: 메모리할당없는 구조적바이너리 사용객체
\section precautions 주의사항
    - 응용프로그램이 시작하는 시점에 dGlobal::load()를 호출
    - 응용프로그램이 종료되는 시점에 dGlobal::release()를 호출
\section developer 개발자
    - BonexGoo
\section contact 연락처
    - bonexgoo@gmail.com
    - +82-10-2030-0288
*/
#pragma once

#pragma warning(disable:26495) // Always initialize member variables.
#pragma execution_character_set("utf-8")
#define _CRT_SECURE_NO_WARNINGS

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - debug //bx200618-check:{ debug매크로 확인!
#if !defined(NDEBUG)
    #define DD_BUILD_DEBUG 1
    #pragma message("[daddy] build is debug")
#else
    #define DD_BUILD_DEBUG 0
    #pragma message("[daddy] build is release")
#endif //}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - x64 //bx200618-check:{ x64매크로 확인!
#if defined(__x86_64__) || defined(__x86_64) || defined(__amd64__) || defined(__amd64) || \
    defined(__ppc64__) || defined(_WIN64) || defined(__LP64__) || defined(_LP64)
    #define DD_BUILD_X64 1
    #pragma message("[daddy] build is x64")
#else
    #define DD_BUILD_X64 0
    #pragma message("[daddy] build is x86")
#endif //}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - arm //bx200618-check:{ arm매크로 확인!
#if defined(arm) || defined(__arm__) || defined(ARM) || defined(_ARM_)
    #define DD_BUILD_ARM 1
    #pragma message("[daddy] build is arm")
#else
    #define DD_BUILD_ARM 0
    #pragma message("[daddy] build is intel")
#endif //}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - windows //bx200618-check:{ windows매크로 확인!
#if defined(_WIN32) || defined(_WIN64)
    #define DD_OS_WINDOWS 1
    #pragma message("[daddy] os is windows")
    #if defined(__MINGW32__)
        #define DD_OS_WINDOWS_MINGW 1
        #pragma message("[daddy] compiler is mingw")
    #else
        #define DD_OS_WINDOWS_MINGW 0
    #endif
#else
    #define DD_OS_WINDOWS 0
    #define DD_OS_WINDOWS_MINGW 0
#endif //}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - linux //bx200618-check:{ linux매크로 확인!
#if defined(__linux__) && !defined(ANDROID) && !defined(__EMSCRIPTEN__)
    #define DD_OS_LINUX 1
    #pragma message("[daddy] os is linux")
#else
    #define DD_OS_LINUX 0
#endif //}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - osx/ios //bx200618-check:{ osx/ios매크로 확인!
#if defined(__APPLE__)
    #include <TargetConditionals.h>
    #if TARGET_OS_MAC && !TARGET_OS_IPHONE
        #define DD_OS_OSX 1
        #pragma message("[daddy] os is macx")
    #else
        #define DD_OS_OSX 0
    #endif
    #if TARGET_OS_MAC && TARGET_OS_IPHONE
        #define DD_OS_IOS 1
        #pragma message("[daddy] os is ios")
    #else
        #define DD_OS_IOS 0
    #endif
#else
    #define DD_OS_OSX 0
    #define DD_OS_IOS 0
#endif //}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - android //bx200618-check:{ android매크로 확인!
#if defined(ANDROID)
    #define DD_OS_ANDROID 1
    #pragma message("[daddy] os is android")
#else
    #define DD_OS_ANDROID 0
#endif //}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - wasm //bx200618-check:{ wasm매크로 확인!
#if defined(__EMSCRIPTEN__)
    #include <emscripten.h>
    #define DD_OS_WASM 1
    #pragma message("[daddy] os is wasm")
#else
    #define DD_OS_WASM 0
#endif //}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ macro verification
#if (DD_OS_WINDOWS + DD_OS_LINUX + DD_OS_OSX + DD_OS_IOS + DD_OS_ANDROID + DD_OS_WASM != 1)
    #error [daddy] unknown os
#else
    #pragma message(":)")
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ coding utility //bx200618-check:{ 유틸리티매크로 확인!
#ifdef DD_ENABLE_TRACE
    #define DD_assert(QUERY, CAUSE)    do{if(!(QUERY)) DD_crash();} while(false)
    #pragma message("[daddy] trace-system ENABLED")
#else
    #define DD_assert(QUERY, CAUSE)    DD_nothing
    #pragma message("[daddy] trace-system disabled")
#endif

#define DD_hook(VALUE)                 for(auto &h__ = (VALUE), *f__ = &h__; f__; f__ = nullptr)
#define DD_fish                        (*f__)
#define DD_nothing                     do{} while(false)
#define DD_string_pair(STR)            (STR), (_countof(STR) - 1)
#define DD_num_to_ptr(NUM)             ((void*) (NUM))
#if DD_BUILD_X64
    #define DD_ptr_to_num(PTR)         (*((const uint64_t*) &(PTR)))
#else
    #define DD_ptr_to_num(PTR)         (*((const uint32_t*) &(PTR)))
#endif

#if defined(__GNUC__) || defined(__ARMCC_VERSION)
    #define DD_const8d(NUM)            (NUM##LL)
    #define DD_const8u(NUM)            (NUM##ULL)
    #define DD_epoch_to_window(UTC)    (((uint64_t) (UTC)) +  11644473600000ULL)
    #define DD_window_to_epoch(MS)     (((uint64_t) (MS))  -  11644473600000ULL)
    #define DD_epoch_to_julian(UTC)    (((uint64_t) (UTC)) + 210866803200000ULL)
    #define DD_julian_to_epoch(JUL)    (((uint64_t) (JUL)) - 210866803200000ULL)
#else
    #define DD_const8d(NUM)            (NUM##i64)
    #define DD_const8u(NUM)            (NUM##ui64)
    #define DD_epoch_to_window(UTC)    (((uint64_t) (UTC)) +  11644473600000ui64)
    #define DD_window_to_epoch(MS)     (((uint64_t) (MS))  -  11644473600000ui64)
    #define DD_epoch_to_julian(UTC)    (((uint64_t) (UTC)) + 210866803200000ui64)
    #define DD_julian_to_epoch(JUL)    (((uint64_t) (JUL)) - 210866803200000ui64)
#endif

#if DD_OS_WINDOWS
    #define DD_dllexport               extern "C" __declspec(dllexport)
#else
    #define DD_dllexport               extern "C" __attribute__((visibility("default")))
#endif //}
