/// @brief     Definition of global utility.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_type.hpp"
#include <functional>

namespace Daddy {

#define DD_global(NAME, TYPE, VAR, ...) \
    typedef TYPE _t_##VAR; \
    static uint8_t _g_##VAR[sizeof(_t_##VAR)]; \
    static _t_##VAR& VAR = *(_t_##VAR*) Daddy::dGlobal::loadAttach(NAME, _g_##VAR, \
    [](void* _)->void {new(_) _t_##VAR(__VA_ARGS__);}, \
    [](void* _)->void {((_t_##VAR*) _)->~_t_##VAR();})

#define DD_global_direct(TYPE, VAR, ...) \
    typedef TYPE _t_##VAR; \
    static uint8_t _g_##VAR[sizeof(_t_##VAR)]; \
    static _t_##VAR& VAR = *(_t_##VAR*) Daddy::dGlobal::loadDirect(_g_##VAR, \
    [](void* _)->void {new(_) _t_##VAR(__VA_ARGS__);}, \
    [](void* _)->void {((_t_##VAR*) _)->~_t_##VAR();})

#define DD_global_direct_ptr(TYPE, VAR, PTR) \
    typedef TYPE _t_##VAR; \
    static uint8_t _g_##VAR[sizeof(_t_##VAR)]; \
    static _t_##VAR& VAR = *(_t_##VAR*) Daddy::dGlobal::loadDirect(_g_##VAR, \
    [](void* _)->void {*((void**) _) = (void*) PTR;}, \
    [](void* _)->void {*((void**) _) = nullptr;})

/// @brief 글로벌
class dGlobal
{
public:
    typedef std::function<void(void*)> Constructor;
    typedef std::function<void(void*)> Destructor;

public: // 사용성(매크로권장)
    /// @brief           글로벌 인스턴스의 등록
    /// @param name      인스턴스의 명칭
    /// @param ptr       load 및 release를 수행할 메모리공간
    /// @param ccb       인스턴스를 생성시키는 콜백함수
    /// @param dcb       인스턴스를 소멸시키는 콜백함수
    /// @return          리턴값 전달(ptr를 그대로 전달, static시점만 이용)
    static void* loadAttach(utf8s name, void* ptr, Constructor ccb, Destructor dcb);

    /// @brief           글로벌 인스턴스의 등록 및 즉시 로딩
    /// @param ptr       load 및 release를 수행할 메모리공간
    /// @param ccb       인스턴스를 생성시키는 콜백함수
    /// @param dcb       인스턴스를 소멸시키는 콜백함수
    /// @return          리턴값 전달(ptr를 그대로 전달, static시점만 이용)
    static void* loadDirect(void* ptr, Constructor ccb, Destructor dcb);

public: // 사용성
    /// @brief           글로벌 인스턴스끼리의 종속관계 정의
    /// @param nameFirst 로딩이 선행되어야 할 인스턴스
    /// @param nameLater 로딩이 후행되어야 할 인스턴스
    static void setDependency(utf8s nameFirst, utf8s nameLater);

    /// @brief           등록된 인스턴스중 로딩이 필요한 것을 종속관계에 맞게 일괄로딩
    static void load();

    /// @brief           일괄로딩된 인스턴스를 모두 역순으로 해제
    static void release();
};

} // namespace Daddy
