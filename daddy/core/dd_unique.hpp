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
    /// @brief          핑거프린트
    /// @param string   프린트할 네이티브 스트링
    /// @param length   스트링의 길이(-1이면 끝까지)
    /// @return         프린트된 스트링
    static dString fingerPrint(utf8s_nn string, int32_t length = -1);

    /// @brief          장치ID
    /// @param fp       핑거프린트 얻기
    static dLiteral deviceId(dString* fp = nullptr);

    /// @brief          인스턴스ID
    /// @param fp       핑거프린트 얻기
    static dLiteral instanceId(dString* fp = nullptr);
};

} // namespace Daddy
