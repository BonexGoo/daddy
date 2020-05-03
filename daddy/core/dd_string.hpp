/// @brief     Definition of string class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_escaper.hpp"
#include <cstdio>

namespace Daddy {

class dString;
class StringAgentP;

/// @brief 상수전용 스트링객체
class dLiteral
{
public: // 사용성
    /// @brief          스트링 반환(null문자없음)
    /// @return         스트링의 주소
    inline utf8s_nn string() const {return mString;}

    /// @brief          스트링 길이반환
    /// @return         스트링의 길이
    inline uint32_t length() const {return mLength;}

    /// @brief          네이티브스트링 반환(null문자있음)
    /// @return         네이티브스트링의 주소
    utf8s buildNative() const;

public: // 객체운영
    /// @brief          생성자
    /// @param string   리터럴타입 스트링("abc")
    template<size_t length>
    constexpr dLiteral(const utf8(&string)[length])
        : mString(string), mLength(length - 1), mRefAgent(nullptr), mNative(nullptr) {}

    /// @brief          생성자(내부사용)
    /// @param agent    내부사용
    dLiteral(StringAgentP& agent);

    /// @brief          복사생성자
    /// @param rhs      우항
    dLiteral(const dLiteral& rhs);

    /// @brief          소멸자
    ~dLiteral();

    /// @brief          이동불가
    dLiteral& operator=(dLiteral&&) = delete;

    /// @brief          복사불가
    dLiteral& operator=(const dLiteral&) = delete;

private:
    utf8s_nn const mString;
    const uint32_t mLength;
    StringAgentP* const mRefAgent;
    mutable utf8* mNative;
    friend class dString;
};

/// @brief 스트링객체
class dString
{
public: // 사용성
    /// @brief          비우기
    void clear();

    /// @brief          스트링 반환(null문자없음)
    /// @return         네이티브 스트링의 주소
    utf8s_nn string() const;

    /// @brief          스트링 길이반환
    /// @return         스트링의 길이
    uint32_t length() const;

    /// @brief          스트링 부분복제
    /// @param index    시작위치
    /// @param length   길이(-1이면 끝까지)
    /// @return         복제된 스트링
    dString clone(int32_t index, int32_t length = -1) const;

    /// @brief          스트링 교체
    /// @param string   교체할 스트링
    /// @return         교체된 자기 객체
    dString& reset(const dLiteral& string);

    /// @brief          스트링 교체(네이티브식)
    /// @param string   교체할 네이티브 스트링
    /// @param length   스트링의 길이(-1이면 끝까지)
    /// @return         교체된 자기 객체
    dString& reset(utf8s_nn string, int32_t length = -1);

    /// @brief          스트링 연결
    /// @param string   뒤에 연결할 스트링
    /// @return         연결되어 확장된 자기 객체
    dString& add(const dLiteral& string);

    /// @brief          스트링 연결(네이티브식)
    /// @param string   뒤에 연결할 네이티브 스트링
    /// @param length   스트링의 길이(-1이면 끝까지)
    /// @return         연결되어 확장된 자기 객체
    dString& add(utf8s_nn string, int32_t length = -1);

    /// @brief          코드 연결(네이티브식)
    /// @param code     뒤에 연결할 네이티브 코드
    /// @return         연결되어 확장된 자기 객체
    dString& add(utf8 code);

    /// @brief          공백트림
    /// @return         앞뒤의 공백들이 제거된 새로운 스트링
    dString trimSpace() const;

    /// @brief          따옴표트림("", '')
    /// @return         앞뒤의 따옴표들이 제거된 새로운 스트링
    dString trimQuote() const;

public: // 연산자
    /// @brief          Literal변환
    /// @return         새로운 Literal를 구성
    operator dLiteral() const;

    /// @brief          한 글자 반환
    /// @param index    지정된 위치
    /// @return         지정된 한 글자
    utf8 operator[](int32_t index) const;

    /// @brief          동일스트링 여부
    /// @param rhs      우항
    /// @return         true-동일, false-다름
    bool operator==(const dString& rhs) const;

    /// @brief          다른스트링 여부
    /// @param rhs      우항
    /// @return         true-다름, false-동일
    bool operator!=(const dString& rhs) const;

    /// @brief          스트링 교체
    /// @param rhs      교체할 우항
    /// @return         교체된 자기 객체
    dString& operator=(const dLiteral& rhs);

    /// @brief          스트링 확장
    /// @param rhs      뒤에 연결할 우항
    /// @return         연결되어 확장된 자기 객체
    dString& operator+=(const dLiteral& rhs);

    /// @brief          코드 확장
    /// @param rhs      뒤에 연결할 우항
    /// @return         연결되어 확장된 자기 객체
    dString& operator+=(utf8 rhs);

    /// @brief          스트링 연결
    /// @param rhs      뒤에 연결할 우항
    /// @return         연결된 새로운 객체
    dString operator+(const dLiteral& rhs) const;

    /// @brief          스트링 연결
    /// @param rhs      뒤에 연결할 우항
    /// @return         연결된 새로운 객체
    dString operator+(utf8s rhs) const;

    /// @brief          코드 연결
    /// @param rhs      뒤에 연결할 우항
    /// @return         연결된 새로운 객체
    dString operator+(utf8 rhs) const;

    /// @brief          스트링 역연결
    /// @param lhs      앞에 연결할 좌항
    /// @param rhs      뒤에 연결할 우항
    /// @return         연결된 새로운 객체
    friend dString operator+(utf8s lhs, const dLiteral& rhs);

    /// @brief          코드 역연결
    /// @param lhs      앞에 연결할 좌항
    /// @param rhs      뒤에 연결할 우항
    /// @return         연결된 새로운 객체
    friend dString operator+(utf8 lhs, const dLiteral& rhs);

public: // 입출력
    /// @brief          sprintf식 스트링 제작
    /// @param format   포맷스트링
    /// @param ...      가변인자
    /// @return         새로운 객체
    static dString print(utf8s format, ...);

    /// @brief          파일에서 스트링 가져오기
    /// @param path     파일경로
    /// @return         새로운 객체
    static dString fromFile(const dLiteral& path);

    /// @brief          정수값으로 스트링 제작
    /// @param value    정수값
    /// @return         새로운 객체
    static dString fromNumber(int64_t value);

    /// @brief          실수값으로 스트링 제작
    /// @param value    실수값
    /// @return         새로운 객체
    static dString fromDouble(double value);

    /// @brief          파일로 스트링 내보내기
    /// @param path     파일경로
    /// @return         true-성공, false-실패
    bool toFile(const dLiteral& path) const;

    /// @brief          정수값으로 변환
    /// @return         정수값
    int64_t toNumber() const;

    /// @brief          실수값으로 변환
    /// @return         실수값
    double toDouble() const;

public: // 디버깅
    /// @brief          현재 스트링 정보출력
    void debugPrint() const;

    /// @brief          모든 스트링 정보출력
    static void debugPrintAll();

private:
    static const dString& blank();

DD_escaper_alone(dString): // 객체운영
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    StringAgentP* mRefAgent;

public:
    DD_passage_declare_alone(dString, const dLiteral& string); // reference only
    DD_passage_declare_alone(dString, utf8s_nn string, int32_t length = -1); // copy only, length is -1 possible.

private:
    DD_passage_declare_alone(dString, StringAgentP* agent); // clone only
    DD_passage_declare_alone(dString, ptr_u buffer, int32_t length); // move only, length is -1 possible.
    DD_passage_declare_alone(dString, const dString& string, int32_t index, int32_t length); // length is -1 possible.
};

} // namespace Daddy
