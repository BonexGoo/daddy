#pragma once
#include <daddy.hpp>
#include <service/boss_zay.hpp>

// Dependencies
#include <connector.hpp>

class Node
{
public:
    void SetPeerID(sint32 peerid);
    void SetNodeID(chars nodeid);
    void SendToPeer(id_server server, const dZoker& zoker) const;
    Connector* ConnectAdd(sint32 entryid, chars entrytype, chars protocol);
    void ConnectSub(sint32 entryid);
    void MoveServerConnectors(float addx, float addy) const;
    bool OnRender(ZayPanel& panel);

public: // 개발전용
    void SetToast(chars text);
    void SetFlush(sint32 entryid, uint32 amount, bool all);

public:
    static const Node* GetNodeFrom(const Map<Node>& nodes, chars connectorid, sint32* entryid = nullptr);
    static void SendConnecting(id_server server, const Map<Node>& nodes, chars client_connectorid, chars server_connectorid);
    static void SendDisconnecting(id_server server, const Map<Node>& nodes, chars client_connectorid);

public:
    inline sint32 peerid() const {return mPeerID;}

DD_escaper_alone(Node):
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    sint32 mPeerID;
    String mNodeID;
    Connectors mConnectors;
    mutable Point mPos;
    String mToast;
};
typedef Map<Node> Nodes;
