/// @brief     Definition of thread utility.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_escaper.hpp"
#include "dd_string.hpp"

namespace Daddy {

/// @brief 뮤텍스
class dMutex
{
public: // 사용성
    /// @brief          동기화 신청
    /// @see            unlock
    void lock();

    /// @brief          동기화 해제
    /// @see            lock
    void unlock();

DD_escaper_alone(dMutex): // 객체운영
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    addr mData;
};

/// @brief 세마포어
class dSemaphore
{
public: // 사용성
    /// @brief          동기화 연결(Create 또는 Open)
    /// @see            createOnly
    void bind(utf8s name);

    /// @brief          동기화 연결(Create로만 시도)
    /// @return         true-성공, false-실패
    /// @see            bind
    bool createOnly(utf8s name);

    /// @brief          동기화 신청
    /// @see            unlock
    void lock();

    /// @brief          동기화 해제
    /// @see            lock
    void unlock();

DD_escaper_alone(dSemaphore): // 객체운영
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    addr mData;
    dString mName;
};

} // namespace Daddy
