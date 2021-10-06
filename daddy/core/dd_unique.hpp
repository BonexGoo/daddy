/// @brief     Definition of unique-id utility.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_string.hpp"

namespace Daddy {

/// @brief 유니크한 정보관리
class dUnique
{
public: // 사용성
    /// @brief          장치ID
    /// @param fp       핑거프린트 얻기
    /// @return         장치ID 스트링
    static dLiteral deviceId(dString* fp = nullptr);

    /// @brief          인스턴스ID
    /// @param fp       핑거프린트 얻기
    /// @return         인스턴스ID 스트링
    static dLiteral instanceId(dString* fp = nullptr);

    /// @brief          유저네임
    /// @return         유저네임 스트링
    static dLiteral userName();

    /// @brief          응용프로그램의 경로
    /// @param dironly  실행파일명을 제외한 폴더경로(마지막 /포함)
    /// @return         경로 스트링
    static dLiteral programPath(bool dironly);

public: // 기능성
    /// @brief          해시값생성
    /// @param filepath 파일경로
    /// @return         해시값(CRC64)
    static uint64_t generateHash(dLiteral filepath);

    /// @brief          핑거프린트
    /// @param string   프린트할 네이티브 스트링
    /// @param length   스트링의 길이(-1이면 끝까지)
    /// @return         프린트된 스트링
    static dString fingerPrint(utf8s_nn string, int32_t length = -1);
};

} // namespace Daddy
