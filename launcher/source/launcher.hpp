#pragma once
#include <service/boss_zay.hpp>
#include <daddy.hpp>

class DumApp
{
public:
    String mFilePath;
    String mFileName;
    sint32 mWorkCount;
    Image mIcon;
    String mReadMe;
    dMarkup mCycle;
};
typedef Array<DumApp> DumApps;

class launcherData : public ZayObject
{
public:
    launcherData();
    ~launcherData();

public:
    void OnRenderButton(ZayPanel& panel, sint32 i, bool installed);

public:
    void AddDumApp(chars path);
    void InstallDumApp(sint32 i);
    void RemoveDumApp(sint32 i);
    void ExecDumApp(sint32 i, chars act);
    buffer PathToBuffer(chars path);

public:
    DumApps mDumApps;
};
