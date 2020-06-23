#include <boss.hpp>
#include <platform/boss_platform.hpp>
#include <service/boss_zay.hpp>

#include <resource.hpp>
#include <daddy.hpp>

h_window gTrayWindow;
DD_global("gSemaphore", dSemaphore, gSemaphore);

bool PlatformInit()
{
    dGlobal::load();
    if(!gSemaphore.createOnly("daddy-launcher"))
        return false;

    Platform::InitForGL();
    Platform::SetViewCreator(ZayView::Creator);
    Platform::SetWindowVisible(false);

    h_policy NewPolicy = Platform::CreatePolicy(250, 200);
    h_view NewView = Platform::CreateView("", 350, 300, NewPolicy, "launcherView");
    h_icon NewIcon = Platform::CreateIcon("icon/daddy.png");
    gTrayWindow = Platform::OpenTrayWindow(NewView, NewIcon);

    String AtlasInfoString = String::FromAsset("atlasinfo.json");
    Context AtlasInfo(ST_Json, SO_OnlyReference, AtlasInfoString, AtlasInfoString.Length());
    R::SetAtlasDir("image");
    R::AddAtlas("ui_atlaskey.png", "atlas.png", AtlasInfo);
    if(R::IsAtlasUpdated())
        R::RebuildAll();

    Platform::AddWindowProcedure(WE_Tick,
        [](payload data)->void
        {
            static uint64 LastUpdateCheckTime = Platform::Utility::CurrentTimeMsec();
            uint64 CurUpdateCheckTime = Platform::Utility::CurrentTimeMsec();
            if(LastUpdateCheckTime + 1000 < CurUpdateCheckTime)
            {
                LastUpdateCheckTime = CurUpdateCheckTime;
                if(R::IsAtlasUpdated())
                {
                    R::RebuildAll();
                    Platform::UpdateAllViews();
                }
            }
        });
    return true;
}

void PlatformQuit()
{
    Platform::CloseWindow(gTrayWindow);

    Context AtlasInfo;
    R::SaveAtlas(AtlasInfo);
    AtlasInfo.SaveJson().ToAsset("atlasinfo.json");
}

void PlatformFree()
{
    dGlobal::release();
}
