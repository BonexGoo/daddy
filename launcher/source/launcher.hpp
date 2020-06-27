#pragma once
#include <service/boss_zay.hpp>
#include "appview.hpp"

class launcherData : public ZayObject
{
public:
    launcherData();
    ~launcherData();

public:
    AppView mAppView;
};
