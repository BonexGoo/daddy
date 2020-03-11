#pragma once
#include <service/boss_zay.hpp>
#include <view/cmd_view.hpp>
#include <view/webcmd_view.hpp>

class loggerData : public ZayObject
{
public:
    loggerData();
    ~loggerData();

public:
    id_server mCmdServer;
    CmdView mCmdView;

public:
    id_server mWebCmdServer;
    WebCmdView mWebCmdView;
};
