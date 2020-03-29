#pragma once
#include <service/boss_zay.hpp>
#include <view/cmd_view.hpp>
#include <view/webcmd_view.hpp>
#include <view/tree_view.hpp>

enum class ViewLayout {CmdOnly, TreeOnly, CmdAndTree, Count};

class PeerInfo
{
public:
    id_server mRefServer;
    sint32 mID;
    String mText;
};
typedef Array<PeerInfo> PeerInfos;

class loggerData : public ZayObject
{
public:
    loggerData();
    ~loggerData();

public:
    void UpdatePeer(id_server server, packettype type, sint32 id);

public:
    ViewLayout mLayout;
    PeerInfos mPeers;
    id_server mCmdServer;
    id_server mWebCmdServer;
    CmdView mCmdView;
    WebCmdView mWebCmdView;
    TreeView mTreeView;
};
