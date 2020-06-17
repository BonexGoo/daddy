#pragma once
#include <service/boss_zay.hpp>
#include <daddy.hpp>

class SApp
{
public:
    String mFilePath;
    String mFileName;
    sint32 mWorkCount;
    Image mIcon;
    String mReadMe;
    dMarkup mCycle;
};
typedef Array<SApp> SApps;

class launcherData : public ZayObject
{
public:
    launcherData();
    ~launcherData();

public:
    void OnRenderButton(ZayPanel& panel, sint32 i, bool installed);

public:
    void AddSApp(chars path);
    void InstallSApp(sint32 i);
    void RemoveSApp(sint32 i);
    void ExecSApp(sint32 i, chars act);
    buffer PathToBuffer(chars path);

public:
    SApps mSApps;
};
