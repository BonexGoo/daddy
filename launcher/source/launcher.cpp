#include <boss.hpp>
#include "launcher.hpp"

#include <resource.hpp>
#include <format/boss_bmp.hpp>
#include <format/boss_png.hpp>
#include <daddy.hpp>

ZAY_DECLARE_VIEW_CLASS("launcherView", launcherData)

ZAY_VIEW_API OnCommand(CommandType type, chars topic, id_share in, id_cloned_share* out)
{
}

ZAY_VIEW_API OnNotify(NotifyType type, chars topic, id_share in, id_cloned_share* out)
{
}

ZAY_VIEW_API OnGesture(GestureType type, sint32 x, sint32 y)
{
}

static const sint32 gIconSize = 60;
static const sint32 gButtonWidth = 100;
static const sint32 gButtonHeight = 36;
static const sint32 gTitleHeight = 26;
static const sint32 gCommentHeight = 26;
static const sint32 gWidgetHeight = 100;
static const Color gWidgetColor[2] = {Color(96, 96, 96, 128), Color(0, 128, 255, 128)};

ZAY_VIEW_API OnRender(ZayPanel& panel)
{
    ZAY_RGB(panel, 255, 255, 255)
        panel.fill();

    ZAY_INNER(panel, 10)
    {
        const String DumAppsRemPath = Platform::File::RootForAssetsRem() + "../dumapps-rem/";
        const sint32 WidgetWidth = Math::Max(gIconSize + 300, panel.w());
        for(sint32 i = 0, iend = m->mDumApps.Count(); i < iend; ++i)
        {
            ZAY_XYWH(panel, 0, (gWidgetHeight + 10 + 1) * i, WidgetWidth, gWidgetHeight)
            {
                const bool IsInstalled = Platform::File::ExistForDir(DumAppsRemPath + m->mDumApps[i].mFileName);
                ZAY_COLOR(panel, gWidgetColor[IsInstalled])
                {
                    ZAY_RGBA(panel, 128, 128, 128, 64)
                        panel.fill();
                    ZAY_RGBA(panel, 128, 128, 128, 96)
                        panel.rect(1);
                }

                // 아이콘
                ZAY_XYWH(panel, 5, 5, gIconSize, gIconSize)
                    panel.stretch(m->mDumApps[i].mIcon, Image::Build::AsyncNotNull);

                // 정보란
                ZAY_LTRB(panel, 5 + gIconSize + 5, 5, panel.w() - 5 - gButtonWidth - 5, panel.h() - 5)
                {
                    ZAY_RGBA(panel, 255, 255, 255, 64)
                        panel.fill();
                    ZAY_RGBA(panel, 255, 255, 255, 32)
                        panel.rect(1);

                    // 타이틀
                    ZAY_XYWH(panel, 5, 0, panel.w() - 10, gTitleHeight)
                    ZAY_FONT(panel, 1.2, "Arial Black")
                    ZAY_RGB(panel, 0, 0, 0)
                    {
                        if(0 < m->mDumApps[i].mWorkCount)
                            panel.text(m->mDumApps[i].mFileName + String::Format(" (%d+)", m->mDumApps[i].mWorkCount),
                                UIFA_LeftTop, UIFE_Right);
                        else panel.text(m->mDumApps[i].mFileName, UIFA_LeftTop, UIFE_Right);
                    }

                    // 설명
                    ZAY_XYWH(panel, 5, gTitleHeight, panel.w() - 10, gCommentHeight)
                    ZAY_FONT(panel, 1, "Arial Black")
                    ZAY_RGB(panel, 96, 96, 96)
                        panel.text(m->mDumApps[i].mReadMe, UIFA_LeftTop, UIFE_Right);

                    // 실행버튼
                    static chars CycleType[2] = {"kill", "run"};
                    static chars CycleName[2] = {"KILL ALL", "RUN ONCE"};
                    for(sint32 j = 0, jend = m->mDumApps[i].mCycle.length(); j < jend; ++j)
                    {
                        const String UIButton = String::Format("%s-%d", CycleType[j], i);
                        ZAY_XYWH_UI(panel, panel.w() - (110 - 5) * (j + 1), panel.h() - (35 - 5), 100, 25,
                            (IsInstalled)? UIButton : String(),
                            ZAY_GESTURE_T(t, i, j)
                            {
                                if(t == GT_InReleased)
                                    m->ExecDumApp(i, CycleType[j]);
                            })
                        {
                            const bool Focused = (panel.state(UIButton) & (PS_Focused | PS_Dragging));
                            const bool PressMove = (panel.state(UIButton) & PS_Pressed)? 1 : 0;
                            ZAY_MOVE(panel, PressMove, PressMove)
                            {
                                ZAY_COLOR(panel, gWidgetColor[IsInstalled])
                                {
                                    ZAY_RGBA(panel, 192, 192, 192, (Focused)? 192 : 128)
                                        panel.fill();
                                    ZAY_RGBA(panel, 128, 128, 128, 160)
                                        panel.rect(1);
                                    ZAY_RGB(panel, 128, 128, 128)
                                    ZAY_FONT(panel, 1.0, "Arial Black")
                                        panel.text(panel.w() / 2, panel.h() / 2 - 1, CycleName[j]);
                                }
                            }
                        }
                    }
                }

                // 버튼란
                ZAY_LTRB(panel, panel.w() - 5 - gButtonWidth, 5, panel.w() - 5, panel.h() - 5)
                    m->OnRenderButton(panel, i, IsInstalled);
            }
        }
    }
}

launcherData::launcherData()
{
    String DumAppsPath = Platform::File::RootForAssetsRem() + "../dumapps/";
    Platform::File::Search(DumAppsPath + '*', [](chars itemname, payload data)->void
    {
        auto Self = (launcherData*) data;
        Self->AddDumApp(itemname);
    }, this, true);
}

launcherData::~launcherData()
{
}

void launcherData::OnRenderButton(ZayPanel& panel, sint32 i, bool installed)
{
    // 설치버튼
    const String UIButton = String::Format("button-%d", i);
    ZAY_LTRB_UI(panel, 0, 0, gButtonWidth, gButtonHeight, UIButton,
        ZAY_GESTURE_T(t, this, i, installed)
        {
            if(t == GT_InReleased)
            {
                if(installed)
                    RemoveDumApp(i);
                else InstallDumApp(i);
            }
        })
    {
        const bool Focused = (panel.state(UIButton) & (PS_Focused | PS_Dragging));
        const bool PressMove = (panel.state(UIButton) & PS_Pressed)? 1 : 0;
        ZAY_MOVE(panel, PressMove, PressMove)
        {
            ZAY_COLOR(panel, gWidgetColor[installed])
            {
                ZAY_RGBA(panel, 192, 192, 192, (Focused)? 192 : 128)
                    panel.fill();
                ZAY_RGBA(panel, 128, 128, 128, 160)
                    panel.rect(1);
            }

            ZAY_FONT(panel, 1.2, "Arial Black")
            {
                if(installed)
                {
                    ZAY_RGBA(panel, 224, 0, 0, 192)
                        panel.text(panel.w() / 2, panel.h() / 2 - 1, "REMOVE");
                }
                else ZAY_RGBA(panel, 0, 0, 224, 192)
                    panel.text(panel.w() / 2, panel.h() / 2 - 1, "INSTALL");
            }
        }
    }
}

buffer launcherData::PathToBuffer(chars path)
{
    buffer Result = nullptr;
    if(id_file_read File = Platform::File::OpenForRead(path))
    {
        auto FileSize = Platform::File::Size(File);
        Result = Buffer::Alloc(BOSS_DBG FileSize);
        Platform::File::Read(File, (uint08*) Result, Buffer::CountOf(Result));
        Platform::File::Close(File);
    }
    return Result;
}

void launcherData::AddDumApp(chars path)
{
    auto& NewDumApp = mDumApps.AtAdding();
    NewDumApp.mFilePath = path;
    NewDumApp.mFileName = String::FromWChars(Platform::File::GetShortName(WString::FromChars(NewDumApp.mFilePath)));
    NewDumApp.mWorkCount = 0;

    buffer NewZipBuffer = PathToBuffer(path);
    if(NewZipBuffer)
    {
        sint32 FileCount = 0;
        if(id_zip NewZip = AddOn::Zip::Create((bytes) NewZipBuffer, Buffer::CountOf(NewZipBuffer), &FileCount))
        {
            for(sint32 i = 0; i < FileCount; ++i)
            {
                bool IsDir = false;
                chars FilePath = AddOn::Zip::GetFileInfo(NewZip, i, &IsDir);
                if(IsDir) continue;

                if(!String::CompareNoCase(FilePath, "install/icon.png"))
                {
                    if(buffer NewPngBuffer = AddOn::Zip::ToFile(NewZip, i))
                    {
                        id_bitmap NewBmp = Png().ToBmp((bytes) NewPngBuffer, true);
                        id_bitmap OldBmp = NewDumApp.mIcon.ChangeBitmap(NewBmp);
                        Bmp::Remove(OldBmp);
                        Buffer::Free(NewPngBuffer);
                    }
                }
                else if(!String::CompareNoCase(FilePath, "install/readme.md"))
                {
                    if(buffer NewMdBuffer = AddOn::Zip::ToFile(NewZip, i))
                    {
                        NewDumApp.mReadMe = String(((chars) NewMdBuffer) + 3, Buffer::CountOf(NewMdBuffer) - 3);
                        Buffer::Free(NewMdBuffer);
                    }
                }
                else if(!String::CompareNoCase(FilePath, "install/cycle.yaml"))
                {
                    if(buffer NewMdBuffer = AddOn::Zip::ToFile(NewZip, i))
                    {
                        const String NewYaml(((chars) NewMdBuffer) + 3, Buffer::CountOf(NewMdBuffer) - 3);
                        NewDumApp.mCycle.loadYaml(dString((chars) NewYaml));
                        Buffer::Free(NewMdBuffer);
                    }
                }
            }
            AddOn::Zip::Release(NewZip);
        }
        Buffer::Free(NewZipBuffer);
    }
}

void launcherData::InstallDumApp(sint32 i)
{
    const String DumAppsRemPath = Platform::File::RootForAssetsRem() + "../dumapps-rem/";
    auto& CurDumApp = mDumApps[i];

    buffer NewZipBuffer = PathToBuffer(CurDumApp.mFilePath);
    if(NewZipBuffer)
    {
        sint32 FileCount = 0;
        if(id_zip NewZip = AddOn::Zip::Create((bytes) NewZipBuffer, Buffer::CountOf(NewZipBuffer), &FileCount))
        {
            for(sint32 i = 0; i < FileCount; ++i)
            {
                bool IsDir = false;
                chars FilePath = AddOn::Zip::GetFileInfo(NewZip, i, &IsDir);
                if(IsDir || !String::CompareNoCase(FilePath, "install/", 8))
                    continue;

                if(buffer NewFileBuffer = AddOn::Zip::ToFile(NewZip, i))
                {
                    id_file NewFile = Platform::File::OpenForWrite(DumAppsRemPath + CurDumApp.mFileName + '/' + FilePath, true);
                    Platform::File::Write(NewFile, (bytes) NewFileBuffer, Buffer::CountOf(NewFileBuffer));
                    Platform::File::Close(NewFile);
                    Buffer::Free(NewFileBuffer);
                }
            }
            AddOn::Zip::Release(NewZip);
        }
        Buffer::Free(NewZipBuffer);
    }
}

static void _RemoveSApp(chars dirpath)
{
    Platform::File::Search(dirpath, [](chars itemname, payload data)->void
    {
        if(Platform::File::ExistForDir(itemname))
            _RemoveSApp(itemname);
        else Platform::File::Remove(WString::FromChars(itemname));
    }, nullptr, true);
    Platform::File::RemoveDir(WString::FromChars(dirpath));
}

void launcherData::RemoveDumApp(sint32 i)
{
    ExecDumApp(i, "kill");
    const String DumAppsRemPath = Platform::File::RootForAssetsRem() + "../dumapps-rem/";
    _RemoveSApp(DumAppsRemPath + mDumApps[i].mFileName);
}

void launcherData::ExecDumApp(sint32 i, chars act)
{
    DD_hook(mDumApps[i].mCycle(dString(act)))
    for(sint32 j = 0, jend = DD_fish.length(); j < jend; ++j)
    {
        auto ExecName = DD_fish[j]("exec").get();
        if(0 < ExecName.length())
        {
            if(!String::Compare(act, "kill"))
                dUtility::killProcessAll(ExecName);
            else
            {
                #if DD_OS_WINDOWS
                    #define BIN_PATH "/bin_windows/"
                #elif DD_OS_LINUX
                    #define BIN_PATH "/bin_ubuntu/"
                #endif

                const String DumAppsRemPath = Platform::File::RootForAssetsRem() + "../dumapps-rem/";
                dString BinPath((chars) (mDumApps[i].mFileName + BIN_PATH));
                dString WorkPath((chars) (mDumApps[i].mFileName + String::Format("/work_%d/", mDumApps[i].mWorkCount)));
                auto RunType = DD_fish[j]("option").get();
                auto ArgsName = DD_fish[j]("args").get();
                if(0 < ArgsName.length())
                    dUtility::runProcess(DumAppsRemPath + BinPath + ExecName,
                        DumAppsRemPath + BinPath + ArgsName, RunType, DumAppsRemPath + WorkPath);
                else dUtility::runProcess(DumAppsRemPath + BinPath + ExecName, "", RunType, DumAppsRemPath + WorkPath);
            }
        }
    }

    if(!String::Compare(act, "kill"))
        mDumApps.At(i).mWorkCount = 0;
    else mDumApps.At(i).mWorkCount++;
}
