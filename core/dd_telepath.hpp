/// @brief     RPC-framework.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_binary.hpp"
#include <functional>

#define DD_TELE_COMPONENT_VER "V10"
#define DD_TELE_ENTITY_VER    "V_" __DATE__ "_" __TIME__

namespace Daddy {

class TeleGateClientP;

/// @brief RPC 프레임워크
class dTelepath
{
public:
    typedef uint32_t TeleID;
    typedef int32_t SilkID;
    enum class SilkType {Server, Client};
    enum class ReceiveType {Connected, Reconnected, Message, Disconnected};
    typedef utf8s (*onMarkInCB)(int32_t type);
    typedef std::function<bool(TeleID tele, ReceiveType type, dBinary binary)> ReceiveCB;

public: // 노드통신
    /// @brief           실크추가
    /// @param type      실크타입(서버, 클라이언트)
    /// @param protocol  프로토콜명(같은 프로토콜명의 서/클만이 연결가능)
    /// @param cb        요청된 연결에 대한 이벤트트리거
    /// @return          발급된 SilkID(실제로 연결되면 ReceiveType::Connected로 cb호출)
    static SilkID addSilk(SilkType type, dLiteral protocol, ReceiveCB cb);

    /// @brief           실크제거
    /// @param silk      발급된 SilkID
    static void subSilk(SilkID silk);

    /// @brief           해당 실크로 연결된 상대의 수량확인
    /// @param silk      발급된 SilkID
    /// @return          연결상대의 수량(Server의 경우 0 ~ N, Client의 경우 0 ~ 1)
    static uint32_t numLinkedTelepath(SilkID silk);

    /// @brief           실크를 통해 특정 상대에게 바이너리전송
    /// @param silk      발급된 SilkID
    /// @param tele      연결상대에 할당된 TeleID(초기 ReceiveCB로 전달받음)
    /// @param binary    전송할 바이너리
    /// @return          true-성공, false-실패 및 현재 연결상대가 제거됨
    static bool send(SilkID silk, TeleID tele, const dBinary binary);

    /// @brief           실크를 통해 모든 상대에게 바이너리전송
    /// @param silk      발급된 SilkID
    /// @param binary    전송할 바이너리
    /// @return          true-성공, false-실패 및 해당 연결상대가 제거됨
    static bool sendAll(SilkID silk, const dBinary binary);

    /// @brief           게이트에 텍스트전송(개발전용)
    /// @param text      전송할 텍스트
    static void toast(dLiteral text);

public: // 어댑터전용
    /// @brief           클라이언트 생성
    /// @return          할당된 클라이언트
    static TeleGateClientP* createClient();

    /// @brief           클라이언트 반환
    /// @return          true-반환성공, false-반환없음
    static bool releaseClient();

    /// @brief           게이트 연결보장 및 각종 처리
    /// @param hostname  게이트서버의 도메인주소 또는 IP주소
    /// @param client    할당된 클라이언트
    /// @param cb        컴포넌트의 정보획득용 이벤트트리거
    static void gateCall(dLiteral hostname, TeleGateClientP* client, onMarkInCB cb);

    /// @brief           ReceiveCB호출보장 및 노드통신 각종 처리
    /// @param client    할당된 클라이언트
    static bool nextReceive(TeleGateClientP* client);
};

/// @brief 컴포넌트 모델
namespace dTeleApi
{
    enum class MarkInType {Null = 0x10000,
        ComponentVer, EntityVer, EntityName, EntityUuid, CreateClient, ReleaseClient, // TeleApi_v10
        Max};
    enum class PlugInType {Null = 0x20000,
        LogClient, // TeleApi_v10
        Max};
    enum class CycleType {Null = 0x30000,
        Create, Recreate, Tick, Destroy, // TeleApi_v10
        Max};

    namespace V10
    {
        typedef bool (*onPlugInCB)(int32_t type, utf8s hostname, uint16_t port);
        typedef bool (*onCycleCB)(int32_t type);
    }
}

/// @brief 어댑터 모델
class dTeleAdapter
{
public:
    dTeleAdapter() {}
    virtual ~dTeleAdapter() {}

public:
    virtual bool onCreate() = 0;
    virtual bool onDestroy() = 0;

public:
    virtual void sleep() = 0;
    virtual bool alived() const = 0;
};

} // namespace Daddy
