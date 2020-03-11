#pragma once
#include <service/boss_zay.hpp>
#include "cmd_view.hpp"

class WebCmdView;

class Peer
{
public:
    Peer();
    ~Peer();

public:
    void Init(sint32 peerid);
    void AddHttp(WebCmdView* view, bytes buffer, sint32 length);

private:
    sint32 mPeerID;
    String mHttpDump;
};

class WebCmdView
{
public:
    WebCmdView();
    ~WebCmdView();

public:
    bool OnRender(ZayPanel& panel);
    void OnPacket(packettype type, sint32 peerid, bytes buffer, sint32 length);
    void SetRef(id_server server, CmdView* cmdview);

private:
    void OnHttpGET(sint32 peerid, chars url);
    void SendHttp(sint32 peerid, sint32 code, chars html, sint32 length);

private:
    id_server mRefServer;
    CmdView* mRefCmdView;
    id_mutex mMutex;
    Map<Peer> mPeerMap;
    sint32 mAniValue;
    friend class Peer;
};
