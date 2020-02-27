/// @brief     Definition of zoker class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_binary.hpp"
#include <map>
#include <string>

namespace Daddy {

/// @brief 프로토타입버퍼 조크 (ZOKE, Zen-type Objectification Knowledge Entity)
//
// ■ 토큰구조
// - key:             [utf8스트링:N]
// - group-nameable:  [타입:1][자식수량:1+ → L][점퍼규격:1 → N] + ([점퍼:N][점퍼:N]...L개)
// - group-indexable: [타입:1][자식수량:1+ → L][점퍼규격:1 → N] + ([점퍼:N][점퍼:N]...L개)
// - value-string:    [타입:1][사이즈:1+ → N][utf8스트링:N]
// - value-binary:    [타입:1][사이즈:1+ → N][바이너리덤프:N]
// - value-int8:      [타입:1][정수:1]
// - value-int16:     [타입:1][정수:2]
// - value-int32:     [타입:1][정수:4]
// - value-int64:     [타입:1][정수:8]
// - value-uint8:     [타입:1][부호없는 정수:1]
// - value-uint16:    [타입:1][부호없는 정수:2]
// - value-uint32:    [타입:1][부호없는 정수:4]
// - value-uint64:    [타입:1][부호없는 정수:8]
// - value-float32:   [타입:1][실수:4]
// - value-float64:   [타입:1][실수:8]
//
// ■ 토큰관계성
// - 시작토큰은       value/group만 OK
// - key:             하위로 key만 NO (value/group만 OK)
// - group-nameable:  하위로 key만 OK
// - group-indexable: 하위로 key만 NO (value/group만 OK)
// - value:           하위로 모두가 NO (종착지점)
//
// ■ 부연설명
// - value는 원본 그대로 (파싱비용 ZERO, 스트링은 null포함)
// - group은 점퍼라는 seek-table방식으로 하위접근 (nameable은 이진탐색)
// - "1+"는 가변길이 정수타입 (8비트중 7비트만 사용, 1비트는 연장플래그)

enum class ZokeType {Null,
    Nameable, Indexable, String, Binary,
    Int8, Int16, Int32, Int64,
    Uint8, Uint16, Uint32, Uint64,
    Float32, Float64, Max};

/// @brief 조크생성기
class dZoker
{
public: // 사용성
    /// @brief       자기 데이터와 자식 비우기
    void clear();

    /// @brief       네임방식 자식접근(보장형)
    /// @param key   자식명
    /// @return      자식객체(없으면 만들어서 제공)
    dZoker& operator()(const dLiteral& key);

    /// @brief       인덱스방식 자식접근(보장형)
    /// @param index 자식인덱스
    /// @return      자식객체(없으면 만들어서 제공)
    dZoker& operator[](uint32_t index);

    /// @brief       인덱스방식 자식추가
    /// @return      자식객체
    dZoker& atAdding();

    /// @brief       자신의 데이터 셋팅(String)
    /// @param value 스트링
    void setString(const dLiteral& value);

    /// @brief       자신의 데이터 셋팅(Binary)
    /// @param value 바이너리
    void setBinary(const dBinary& value);

    /// @brief       자신의 데이터 셋팅(int8_t)
    /// @param value 정수
    void setInt8(const int8_t value);

    /// @brief       자신의 데이터 셋팅(int16_t)
    /// @param value 정수
    void setInt16(const int16_t value);

    /// @brief       자신의 데이터 셋팅(int32_t)
    /// @param value 정수
    void setInt32(const int32_t value);

    /// @brief       자신의 데이터 셋팅(int64_t)
    /// @param value 정수
    void setInt64(const int64_t value);

    /// @brief       자신의 데이터 셋팅(uint8_t)
    /// @param value 부호없는 정수
    void setUint8(const uint8_t value);

    /// @brief       자신의 데이터 셋팅(uint16_t)
    /// @param value 부호없는 정수
    void setUint16(const uint16_t value);

    /// @brief       자신의 데이터 셋팅(uint32_t)
    /// @param value 부호없는 정수
    void setUint32(const uint32_t value);

    /// @brief       자신의 데이터 셋팅(uint64_t)
    /// @param value 부호없는 정수
    void setUint64(const uint64_t value);

    /// @brief       자신의 데이터 셋팅(float)
    /// @param value 실수
    void setFloat32(const float value);

    /// @brief       자신의 데이터 셋팅(double)
    /// @param value 실수
    void setFloat64(const double value);

    /// @brief       조크생성
    /// @return      생성된 조크
    dBinary build() const;

private:
    typedef std::map<std::string, dZoker> NameableMap;
    typedef std::map<int, dZoker> IndexableMap;
    void valid(ZokeType type);

DD_escaper_alone(dZoker): // 객체운영
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    ZokeType mType;
    union
    {
        uint64_t mWhole;
        NameableMap* mNameablePtr;
        IndexableMap* mIndexablePtr;
        dString* mStringPtr;
        dBinary* mBinaryPtr;
        int8_t mInt8;
        int16_t mInt16;
        int32_t mInt32;
        int64_t mInt64;
        uint8_t mUint8;
        uint16_t mUint16;
        uint32_t mUint32;
        uint64_t mUint64;
        float mFloat32;
        double mFloat64;
    } mValue;
};

/// @brief 조크해석기
class dZokeReader
{
public: // 사용성
    /// @brief       자신의 실존여부 확인
    /// @return      true-실존함, false-허위객체
    bool isValid() const;

    /// @brief       자식의 수량 확인
    /// @return      자식수량
    uint32_t length() const;

    /// @brief       네임방식 자식접근
    /// @param key   자식명
    /// @return      자식객체(없으면 허위객체 반환)
    const dZokeReader operator()(const dLiteral& key) const;

    /// @brief       인덱스방식 자식접근
    /// @param index 자식인덱스
    /// @return      자식객체(없으면 허위객체 반환)
    const dZokeReader operator[](uint32_t index) const;

    /// @brief       자신의 String데이터 반환
    /// @param def   디폴트 스트링
    /// @param size  필요시 String사이즈(null포함) 반환
    /// @return      자신의 String데이터
    utf8s getString(utf8s def = "", uint32_t* size = nullptr) const;

    /// @brief       자신의 Binary데이터 반환
    /// @param def   디폴트 바이너리덤프
    /// @param size  필요시 Binary사이즈 반환
    /// @return      자신의 Binary데이터
    dumps getBinary(dumps def = nullptr, uint32_t* size = nullptr) const;

    /// @brief       자신의 int8_t데이터 반환
    /// @param def   디폴트 정수
    /// @return      자신의 int8_t데이터
    int8_t getInt8(const int8_t def = 0) const;

    /// @brief       자신의 int16_t데이터 반환
    /// @param def   디폴트 정수
    /// @return      자신의 int16_t데이터
    int16_t getInt16(const int16_t def = 0) const;

    /// @brief       자신의 int32_t데이터 반환
    /// @param def   디폴트 정수
    /// @return      자신의 int32_t데이터
    int32_t getInt32(const int32_t def = 0) const;

    /// @brief       자신의 int64_t데이터 반환
    /// @param def   디폴트 정수
    /// @return      자신의 int64_t데이터
    int64_t getInt64(const int64_t def = 0) const;

    /// @brief       자신의 uint8_t데이터 반환
    /// @param def   디폴트 부호없는 정수
    /// @return      자신의 uint8_t데이터
    uint8_t getUint8(const uint8_t def = 0) const;

    /// @brief       자신의 uint16_t데이터 반환
    /// @param def   디폴트 부호없는 정수
    /// @return      자신의 uint16_t데이터
    uint16_t getUint16(const uint16_t def = 0) const;

    /// @brief       자신의 uint32_t데이터 반환
    /// @param def   디폴트 부호없는 정수
    /// @return      자신의 uint32_t데이터
    uint32_t getUint32(const uint32_t def = 0) const;

    /// @brief       자신의 uint64_t데이터 반환
    /// @param def   디폴트 부호없는 정수
    /// @return      자신의 uint64_t데이터
    uint64_t getUint64(const uint64_t def = 0) const;

    /// @brief       자신의 float데이터 반환
    /// @param def   디폴트 실수
    /// @return      자신의 float데이터
    float getFloat32(const float def = 0) const;

    /// @brief       자신의 double데이터 반환
    /// @param def   디폴트 실수
    /// @return      자신의 double데이터
    double getFloat64(const double def = 0) const;

private:
    static uint32_t readVar(dumps& buffer);
    static dumps jumpTo(dumps buffer, uint32_t index, uint32_t jumpersize);
    static const dZokeReader& blank();

DD_escaper_alone(dZokeReader): // 객체운영
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    dBinary mBinary;
    dumps mBuffer;

public:
    DD_passage_declare_alone(dZokeReader, const dBinary& binary);

private:
    DD_passage_declare_alone(dZokeReader, const dBinary& binary, dumps buffer);
};

} // namespace Daddy
