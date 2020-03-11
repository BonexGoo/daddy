#pragma once
#include <daddy.hpp>
#include <service/boss_zay.hpp>

enum class EntryType {Null, Server, Client};

class Connector
{
public:
    void Init(chars connectorid, EntryType type, chars protocol, sint32 pos);
    void Disable();
    void JoinToServer(chars connectorid) const;
    void ExitToServer() const;
    void MoveForServer(float addx, float addy) const;
    void SaveForClient(Context& saver) const;
    void InitAddress(const ip4address& ip4, const ip6address& ip6, uint16 port);
    void SaveAddress(dZoker& saver) const;
    bool OnRender(ZayPanel& panel) const;

public:
    static Connector* FindPool(chars connectorid);
    void SetPool(chars connectorid) const;
    void ClearPool(chars connectorid) const;

public: // 개발전용
    void SetFlush(uint32 amount, bool all);

DD_escaper_alone(Connector):
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    // 공통
    bool mEnabled;
    String mConnectorID;
    EntryType mType;
    String mProtocol;
    float mPosDistance;
    mutable float mPosDegree;
    float mPosDegreeTarget;
    // Server전용
    ip4address mIP4;
    ip6address mIP6;
    uint16 mPort;
    // Client전용
    mutable bool mConnected;
    mutable String mJoinedConnectorID;
    // 개발전용
    uint64 mFlushMsec;
    uint32 mFlushAmount;
    mutable float mFlushEffect;
};
typedef Map<Connector> Connectors;
