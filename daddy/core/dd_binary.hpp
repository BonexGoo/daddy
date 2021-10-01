/// @brief     Definition of binary class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_string.hpp"

namespace Daddy {

class BinaryAgentP;

/// @brief 바이너리객체
class dBinary
{
public: // 사용성
    /// @brief          비우기
    void clear();

    /// @brief          바이너리 버퍼반환
    /// @return         바이너리의 버퍼
    dumps buffer() const;

    /// @brief          바이너리 길이반환
    /// @return         바이너리의 길이
    uint32_t length() const;

    /// @brief          바이너리 연결(네이티브식)
    /// @param buffer   뒤에 연결할 네이티브 바이너리
    /// @param length   뒤에 연결할 바이너리의 길이
    /// @return         연결되어 확장된 자기 객체
    dBinary& add(dumps buffer, uint32_t length);

public: // 연산자
    /// @brief          한 글자 반환
    /// @param index    지정된 위치
    /// @return         지정된 한 글자
    dump operator[](int32_t index) const;

    /// @brief          바이너리 연결
    /// @param rhs      뒤에 연결할 우항
    /// @return         연결되어 확장된 자기 객체
    dBinary& operator+=(const dBinary& rhs);

public: // 입출력
    /// @brief          내부에서 바이너리 가져오기(소유권 넘어오고 사용후 자동삭제)
    /// @param buffer   내부버퍼
    /// @param length   내부버퍼의 길이
    /// @return         새로운 객체
    static dBinary fromInternal(dump* buffer, uint32_t length);

    /// @brief          외부에서 바이너리 가져오기(사용후 삭제하지 않음)
    /// @param buffer   외부버퍼
    /// @param length   외부버퍼의 길이
    /// @return         새로운 객체
    static dBinary fromExternal(dumps buffer, uint32_t length);

    /// @brief          파일에서 바이너리 가져오기
    /// @param path     파일경로
    /// @return         새로운 객체
    static dBinary fromFile(const dLiteral& filepath);

    /// @brief          파일로 바이너리 내보내기
    /// @param path     파일경로
    /// @param autodir  폴더가 없을 경우 자동생성
    /// @return         true-성공, false-실패
    bool toFile(const dLiteral& filepath, bool autodir = false) const;

private:
    static const dBinary& blank();

DD_escaper_alone(dBinary): // 객체사이클
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    BinaryAgentP* mRefAgent;

private:
    DD_passage_declare_alone(dBinary, dump* buffer, uint32_t length); // move only
};

} // namespace Daddy
