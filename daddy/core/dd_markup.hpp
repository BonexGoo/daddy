/// @brief     Definition of markup class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_binary.hpp"
#include "dd_string.hpp"
#include <unordered_map>

namespace Daddy {

/// @brief 스크립트식 설정관리
class dMarkup
{
public: // 입출력
    /// @brief          yaml스트링 불러오기
    /// @param yaml     yaml스트링
    /// @see            saveYaml
    void loadYaml(const dString& yaml);

    /// @brief          yaml스트링 저장하기
    /// @return         yaml스트링
    /// @see            loadYaml
    dString saveYaml() const;

public: // 자기 사용성
    /// @brief          자신의 데이터와 자식 비우기
    void clear();

    /// @brief          자신의 실존여부 확인
    /// @return         true-실존함, false-허위객체
    bool isValid() const;

    /// @brief          자신의 데이터 반환
    /// @return         스트링
    /// @see            set
    const dString& get() const;

    /// @brief          자신의 데이터 반환(디폴트처리)
    /// @param def      디폴트 스트링
    /// @return         허위객체일 경우 def가 반환
    /// @see            set
    const dString get(const dLiteral& def) const;

    /// @brief          자신의 데이터 셋팅
    /// @param value    스트링
    /// @see            get
    void set(const dString& value);

public: // 하위 사용성
    /// @brief          자식수량 반환
    /// @return         자식수량
    uint32_t length() const;

    /// @brief          네임방식 자식접근(보장형)
    /// @param key      자식명
    /// @return         자식객체(없으면 만들어서 제공)
    dMarkup& at(const dLiteral& key);

    /// @brief          인덱스방식 자식접근(보장형)
    /// @param index    자식인덱스
    /// @return         자식객체(없으면 만들어서 제공)
    dMarkup& at(uint32_t index);

    /// @brief          인덱스방식 자식추가
    /// @return         자식객체
    dMarkup& atAdding();

    /// @brief          네임방식 자식접근
    /// @param key      자식명
    /// @return         자식객체(없으면 허위객체 반환)
    const dMarkup& operator()(const dLiteral& key) const;

    /// @brief          인덱스방식 자식접근
    /// @param index    자식인덱스
    /// @return         자식객체(없으면 허위객체 반환)
    const dMarkup& operator[](uint32_t index) const;

    /// @brief          자식병합
    /// @param rhs      복사할 대상객체
    /// @return         자기객체
    dMarkup& operator+=(const dMarkup& rhs);

public: // 디버깅
    /// @brief          디버그용 정보출력
    /// @param space    처음 띄어 쓸 공백수(없어도 무방)
    void debugPrint(uint32_t space = 0) const;

private:
    static const dMarkup& blank();
    void saveYamlCore(dBinary& collector, uint32_t space, uint32_t indent) const;

DD_escaper_alone(dMarkup): // 객체사이클
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    dString mValue;
    typedef std::unordered_map<std::string, dMarkup> NameableMap;
    typedef std::unordered_map<int, dMarkup> IndexableMap;
    NameableMap* mNameable;
    IndexableMap* mIndexable;
    static const uint32_t mSpaceSize {2}; // 2 <= mSpaceSize

public:
    DD_passage_declare_alone(dMarkup, const dString& yaml);
};

} // namespace Daddy
