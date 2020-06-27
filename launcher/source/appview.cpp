#include <boss.hpp>
#include "appview.hpp"

#include <resource.hpp>
#include <format/boss_bmp.hpp>
#include <format/boss_png.hpp>
#include <daddy.hpp>

AppView::AppView()
{
    String DumAppsPath = Platform::File::RootForAssetsRem() + "../dumapps/";
    Platform::File::Search(DumAppsPath + '*', [](chars itemname, payload data)->void
    {
        auto Self = (AppView*) data;
        Self->AddDumApp(itemname);
    }, this, true);

    mScrollPos = 0;
    mScrollTarget = 0;
}

AppView::~AppView()
{
}

bool AppView::Render(ZayPanel& panel)
{
    bool NeedUpdate = false;
    ZAY_INNER_UI(panel, 0, "appview",
        ZAY_GESTURE_VNTXY(v, n, t, x, y, this)
        {
            static bool HasDrag = false;
            static sint32 OldY = 0;
            if(t == GT_Pressed)
            {
                HasDrag = false;
                OldY = y;
            }
            else if(t == GT_InReleased || t == GT_OutReleased)
            {
                if(!HasDrag)
                    v->hide();
            }
            else if(t == GT_InDragging || t == GT_OutDragging)
            {
                HasDrag = true;
                mScrollTarget += (OldY - y) * 2;
                OldY = y;
                v->invalidate(2);
            }
            else if(t == GT_WheelDown || t == GT_WheelUp)
            {
                mScrollTarget += (t == GT_WheelDown)? 300 : -300;
                v->invalidate(2);
            }
        })
    ZAY_INNER(panel, 10)
    {
        const String DumAppsRemPath = Platform::File::RootForAssetsRem() + "../dumapps-rem/";
        const sint32 WidgetWidth = Math::Max(R::WidgetWidthMin, panel.w());
        const sint32 ScrollPos = sint32(mScrollPos + 0.5);
        const sint32 iBegin = Math::Clamp(ScrollPos / R::WidgetHeight, 0, mDumApps.Count() - 1);
        const sint32 iEnd = Math::Clamp((ScrollPos + panel.h() + R::WidgetHeight - 1) / R::WidgetHeight, 0, mDumApps.Count());
        for(sint32 i = iBegin; i < iEnd; ++i)
        {
            ZAY_XYWH_SCISSOR(panel, 0, R::WidgetHeight * i - ScrollPos, WidgetWidth, R::WidgetHeight - R::WidgetGap)
            ZAY_INNER(panel, 1)
            {
                const bool IsInstalled = Platform::File::ExistForDir(DumAppsRemPath + mDumApps[i].mFileName);
                ZAY_COLOR(panel, R::WidgetColor[IsInstalled])
                {
                    ZAY_RGBA(panel, 128, 128, 128, 64)
                        panel.fill();
                    ZAY_RGBA(panel, 128, 128, 128, 96)
                        panel.rect(1);
                }

                // 아이콘
                ZAY_XYWH(panel, 5, 5, R::IconSize, R::IconSize)
                    panel.stretch(mDumApps[i].mIcon, Image::Build::AsyncNotNull);

                // 정보란
                ZAY_LTRB(panel, 5 + R::IconSize + 5, 5, panel.w() - 5 - R::ButtonWidth - 5, panel.h() - 5)
                {
                    ZAY_RGBA(panel, 255, 255, 255, 64)
                        panel.fill();
                    ZAY_RGBA(panel, 255, 255, 255, 32)
                        panel.rect(1);

                    // 타이틀
                    ZAY_XYWH(panel, 5, 0, panel.w() - 10, R::TitleHeight)
                    ZAY_FONT(panel, 1.0, "Arial Black")
                    ZAY_RGB(panel, 0, 0, 0)
                    {
                        if(0 < mDumApps[i].mWorkCount)
                            panel.text(mDumApps[i].mFileName + String::Format(" (%d+)", mDumApps[i].mWorkCount),
                                UIFA_LeftBottom, UIFE_Right);
                        else panel.text(mDumApps[i].mFileName, UIFA_LeftBottom, UIFE_Right);
                    }

                    // 설명
                    ZAY_XYWH(panel, 5, R::TitleHeight, panel.w() - 10, R::CommentHeight)
                    ZAY_FONT(panel, 0.8, "Arial Black")
                    ZAY_RGB(panel, 96, 96, 96)
                        panel.text(mDumApps[i].mReadMe, UIFA_LeftTop, UIFE_Right);

                    // 실행버튼
                    static chars CycleType[2] = {"kill", "run"};
                    static chars CycleName[2] = {"KILL ALL", "RUN ONCE"};
                    for(sint32 j = 0, jend = mDumApps[i].mCycle.length(); j < jend; ++j)
                    {
                        const String UIButton = String::Format("appview-%s-%d", CycleType[j], i);
                        ZAY_XYWH_UI(panel, panel.w() - (R::SubButtonWidth + 5) * (j + 1), panel.h() - (R::SubButtonHeight + 5),
                            R::SubButtonWidth, R::SubButtonHeight, (IsInstalled)? UIButton : String(),
                            ZAY_GESTURE_T(t, this, i, j)
                            {
                                if(t == GT_InReleased)
                                    ExecDumApp(i, CycleType[j]);
                            })
                        {
                            const bool Focused = (panel.state(UIButton) & (PS_Focused | PS_Dragging));
                            const bool PressMove = (panel.state(UIButton) & PS_Pressed)? 1 : 0;
                            ZAY_MOVE(panel, PressMove, PressMove)
                            {
                                ZAY_COLOR(panel, R::WidgetColor[IsInstalled])
                                {
                                    ZAY_RGBA(panel, 192, 192, 192, (Focused)? 192 : 128)
                                        panel.fill();
                                    ZAY_RGBA(panel, 128, 128, 128, 160)
                                        panel.rect(1);
                                    ZAY_RGB(panel, 128, 128, 128)
                                    ZAY_FONT(panel, 0.8, "Arial Black")
                                        panel.text(panel.w() / 2, panel.h() / 2 - 1, CycleName[j]);
                                }
                            }
                        }
                    }
                }

                // 버튼란
                ZAY_LTRB(panel, panel.w() - 5 - R::ButtonWidth, 5, panel.w() - 5, panel.h() - 5)
                    RenderButton(panel, i, IsInstalled);
            }
        }

        // 스크롤한계처리
        auto CheckScrollMax = [this, &NeedUpdate](float value, sint32 height)->float
        {
            if(value < 0)
            {
                value = 0;
                NeedUpdate = true;
            }
            else if(0 < value)
            {
                const sint32 ScrollMax = R::WidgetHeight * mDumApps.Count() - height - R::WidgetGap;
                if(value > ScrollMax)
                {
                    value = ScrollMax;
                    NeedUpdate = true;
                }
            }
            return value;
        };
        mScrollPos = CheckScrollMax(mScrollPos, panel.h());
        mScrollTarget = CheckScrollMax(mScrollTarget, panel.h());
    }

    // 부드러운 마감선
    for(sint32 i = 0; i < 10; ++i)
    {
        ZAY_XYWH(panel, 0, i, panel.w(), 1)
        ZAY_RGBA(panel, 255, 255, 255, 255 * (10 - i) / 10)
            panel.fill();
        ZAY_XYWH(panel, 0, panel.h() - 1 - i, panel.w(), 1)
        ZAY_RGBA(panel, 255, 255, 255, 255 * (10 - i) / 10)
            panel.fill();
    }

    // 부드러운 스크롤이동
    if(mScrollPos != mScrollTarget)
    {
        if(Math::AbsF(mScrollPos - mScrollTarget) < 1)
            mScrollPos = mScrollTarget;
        else mScrollPos = mScrollPos * 0.9 + mScrollTarget * 0.1;
        NeedUpdate = true;
    }
    return NeedUpdate;
}

void AppView::RenderButton(ZayPanel& panel, sint32 i, bool installed)
{
    // 설치버튼
    const String UIButton = String::Format("appview-button-%d", i);
    ZAY_LTRB_UI(panel, 0, 0, R::ButtonWidth, R::ButtonHeight, UIButton,
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
            ZAY_COLOR(panel, R::WidgetColor[installed])
            {
                ZAY_RGBA(panel, 192, 192, 192, (Focused)? 192 : 128)
                    panel.fill();
                ZAY_RGBA(panel, 128, 128, 128, 160)
                    panel.rect(1);
            }

            ZAY_FONT(panel, 0.8, "Arial Black")
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

buffer AppView::PathToBuffer(chars path)
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

void AppView::AddDumApp(chars path)
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

void AppView::InstallDumApp(sint32 i)
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

void AppView::RemoveDumApp(sint32 i)
{
    ExecDumApp(i, "kill");
    const String DumAppsRemPath = Platform::File::RootForAssetsRem() + "../dumapps-rem/";
    _RemoveSApp(DumAppsRemPath + mDumApps[i].mFileName);
}

void AppView::ExecDumApp(sint32 i, chars act)
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
                    #define BIN_PATH "/bin_windows"
                #elif DD_OS_LINUX
                    #define BIN_PATH "/bin_ubuntu"
                #endif

                const String DumAppsRemPath = Platform::File::RootForAssetsRem() + "../dumapps-rem/";
                dString BinPath((chars) (DumAppsRemPath + mDumApps[i].mFileName + BIN_PATH));
                auto RunType = DD_fish[j]("option").get();
                auto ArgsName = DD_fish[j]("args").get();
                dUtility::runProcess(BinPath + "/" + ExecName, ArgsName, RunType, BinPath);
            }
        }
    }

    if(!String::Compare(act, "kill"))
        mDumApps.At(i).mWorkCount = 0;
    else mDumApps.At(i).mWorkCount++;
}
