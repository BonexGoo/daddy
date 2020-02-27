/// @brief     Definition of base types.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_macro.hpp"
#include <cstdint>

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ Base type
namespace Daddy {

typedef unsigned char        dump;
typedef const unsigned char* dumps;
typedef char                 ansi;
typedef const char*          ansis;
typedef const char*          ansis_nn; // 종료문자(null)가 없을 수도 있는 네이티브 스트링
typedef char                 utf8;
typedef const char*          utf8s;
typedef const char*          utf8s_nn; // 종료문자(null)가 없을 수도 있는 네이티브 스트링
typedef wchar_t              ucode;
typedef const wchar_t*       ucodes;
typedef const wchar_t*       ucodes_nn; // 종료문자(null)가 없을 수도 있는 네이티브 스트링
typedef void*                addr;
#if DD_BUILD_X64
    typedef int64_t          addr_d;
    typedef uint64_t         addr_u;
#else
    typedef int32_t          addr_d;
    typedef uint32_t         addr_u;
#endif

} // namespace Daddy

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ Type utility - rvalue
namespace Daddy {

template<class TYPE> struct RValue__         {typedef TYPE _;};
template<class TYPE> struct RValue__<TYPE&>  {typedef TYPE _;};
template<class TYPE> struct RValue__<TYPE&&> {typedef TYPE _;};
template<typename TYPE>
inline typename RValue__<TYPE>::_&& DD_rvalue(TYPE&& param)
{return static_cast<typename RValue__<TYPE>::_&&>(param);}

} // namespace Daddy

////////////////////////////////////////////////////////////////////////////////
// ▶ Type utility - ptrtest
namespace Daddy {

template<typename TYPE> inline bool PtrTest__(TYPE&)  {return false;}
template<typename TYPE> inline bool PtrTest__(TYPE*&) {return true;}
template<typename TYPE>
inline bool DD_ptrtest()
{TYPE* _ = nullptr; TYPE& __ = *_; return PtrTest__(__);}

} // namespace Daddy
