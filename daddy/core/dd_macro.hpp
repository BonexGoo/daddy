/// @brief     Investigate the build environment and utility.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

#pragma warning(disable:26495) // Always initialize member variables.
#pragma execution_character_set("utf-8")
#define _CRT_SECURE_NO_WARNINGS

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - debug
#if !defined(NDEBUG)
    #define DD_BUILD_DEBUG 1
    #pragma message("[daddy] build is debug")
#else
    #define DD_BUILD_DEBUG 0
    #pragma message("[daddy] build is release")
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - x64
#if defined(__x86_64__) || defined(__x86_64) || defined(__amd64__) || defined(__amd64) || \
    defined(__ppc64__) || defined(_WIN64) || defined(__LP64__) || defined(_LP64)
    #define DD_BUILD_X64 1
    #pragma message("[daddy] build is x64")
#else
    #define DD_BUILD_X64 0
    #pragma message("[daddy] build is x86")
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - arm
#if defined(arm) || defined(__arm__) || defined(ARM) || defined(_ARM_)
    #define DD_BUILD_ARM 1
    #pragma message("[daddy] build is arm")
#else
    #define DD_BUILD_ARM 0
    #pragma message("[daddy] build is intel")
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - windows
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
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - linux
#if defined(__linux__) && !defined(ANDROID) && !defined(__EMSCRIPTEN__)
    #define DD_OS_LINUX 1
    #pragma message("[daddy] os is linux")
#else
    #define DD_OS_LINUX 0
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - osx/ios
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
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - android
#if defined(ANDROID)
    #define DD_OS_ANDROID 1
    #pragma message("[daddy] os is android")
#else
    #define DD_OS_ANDROID 0
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ build environment check - wasm
#if defined(__EMSCRIPTEN__)
    #include <emscripten.h>
    #define DD_OS_WASM 1
    #pragma message("[daddy] os is wasm")
#else
    #define DD_OS_WASM 0
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ macro verification
#if (DD_OS_WINDOWS + DD_OS_LINUX + DD_OS_OSX + DD_OS_IOS + DD_OS_ANDROID + DD_OS_WASM != 1)
    #error [daddy] unknown os
#else
    #pragma message(":)")
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ coding utility
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
#define DD_num_to_ptr(NUM)             ((void*) (NUM))
#define DD_global                      static

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
#endif
