#include <boss.hpp>
#include <daddy.hpp>
#include "cmd_view.hpp"

#include <resource.hpp>

struct PacketHeader
{
    uint16_t mFuncID;
    uint8_t mPayload[1];
};

CmdView::CmdView()
{
    mMutex = Mutex::Open();
    mLogs[0].mPeerID = 0;
    mLogs[0].mText = "<<<cmd starting>>>";
    mLogs[0].mColor = Color(255, 0, 255);
    mLogs[0].mCheck = false;
    mLogFocus = 1;
    mLogScroll = 0;
    mLogScrollSmooth = 0;
}

CmdView::~CmdView()
{
    Mutex::Close(mMutex);
}

bool CmdView::OnRender(ZayPanel& panel)
{
    bool UpdateOnce = false;
    Mutex::Lock(mMutex);
    {
        const sint32 IndexWidth = 50;
        ZAY_INNER_UI(panel, 0, "cmd-view-bg",
            ZAY_GESTURE_VNT(v, n, t, this)
            {
                if(t == GT_WheelDown)
                {
                    mLogScroll = mLogScroll + 50;
                    v->invalidate();
                }
                else if(t == GT_WheelUp)
                {
                    mLogScroll = Math::Max(0, mLogScroll - 50);
                    v->invalidate();
                }
            })
        {
            ZAY_XYWH(panel, 0, 0, IndexWidth, panel.h())
            ZAY_RGB(panel, 208, 216, 224)
            ZAY_RGB(panel, 80, 80, 80)
                panel.fill();
            ZAY_XYWH(panel, IndexWidth, 0, panel.w(), panel.h())
            ZAY_RGB(panel, 0, 0, 0)
                panel.fill();
        }

        const sint32 IndexTextWidth = Platform::Graphics::GetStringWidth("000000");
        for(sint32 i = mLogScrollSmooth / mLogHeight; i < mLogMax; ++i)
        {
            const sint32 CurFocus = mLogFocus + mLogMax - 1 - i;
            const auto& CurLog = mLogs[CurFocus % mLogMax];
            const String UIName = String::Format("log%d", CurFocus);

            // 인덱스
            if(mLogMax - 1 < CurFocus)
            ZAY_XYWH_UI(panel, 0, mLogHeight * i - mLogScrollSmooth, IndexWidth, mLogHeight, UIName,
                ZAY_GESTURE_T(t, this, CurFocus)
                {
                    if(t == GT_Pressed)
                    {
                        auto& CurLog = mLogs[CurFocus % mLogMax];
                        CurLog.mCheck ^= true;
                    }
                })
            {
                sint32 IndexNumber = CurFocus - (mLogMax - 1);
                if(IndexNumber & 1)
                ZAY_RGBA(panel, 0, 0, 0, 32)
                    panel.fill();
                const sint32 Color = (CurLog.mCheck)? 0 : 255;
                for(sint32 j = 0; j < 6; ++j)
                {
                    const char IndexText[2] = {'0' + (IndexNumber % 10), '\0'};
                    ZAY_RGBA(panel, 255, Color, Color, (0 < IndexNumber)? 255 : 128)
                        panel.text(panel.w() / 2 + IndexTextWidth * ((2 - j) * 2 + 1) / 12, panel.h() / 2, IndexText);
                    IndexNumber /= 10;
                }
            }

            // 로그
            ZAY_XYWH(panel, IndexWidth + 5, mLogHeight * i - mLogScrollSmooth, panel.w(), mLogHeight)
            {
                if(panel.visible() != VS_Visible)
                    break;
                ZAY_COLOR(panel, CurLog.mColor)
                    panel.text(CurLog.mText, UIFA_LeftMiddle, UIFE_Right);

                // 브레이커
                chars TagNames[2] = {"<valid:", "<check:"};
                chars UITexts[2][3] = {{"break", "continue", "ignore"}, {"ok", "cancel", "break"}};
                for(sint32 b = 0, bend = _countof(TagNames); b < bend; ++b)
                {
                    if(!CurLog.mText.Left(7).Compare(TagNames[b]))
                    {
                        const sint32 EndPos = CurLog.mText.Find(0, ">");
                        if(EndPos != -1)
                        {
                            const sint32 UniqueKey = Parser::GetInt(CurLog.mText.Middle(7, EndPos - 7));
                            sint32 UIPos = Platform::Graphics::GetStringWidth(CurLog.mText) + 5;
                            ZAY_FONT(panel, 0.8)
                            for(sint32 j = 0; j < 3; ++j)
                            {
                                const String UIName = CurLog.mText.Left(EndPos + 1) + UITexts[b][j];
                                const sint32 TextWidth = Platform::Graphics::GetStringWidth(UITexts[b][j]);
                                ZAY_XYWH_UI(panel, UIPos, 3, TextWidth + 10, panel.h() - 3, UIName,
                                    ZAY_GESTURE_T(t, this, CurFocus, EndPos, UniqueKey, b, j)
                                    {
                                        if(t == GT_InReleased)
                                        {
                                            chars TagNames[2] = {"<valid>", "<check>"};
                                            chars CallNames[2] = {"SendValid", "SendCheck"};
                                            auto& CurLog = mLogs[CurFocus % mLogMax];
                                            CurLog.mText = TagNames[b] + CurLog.mText.Right(CurLog.mText.Length() - (EndPos + 1));
                                            sint32s Values;
                                            Values.AtAdding() = CurLog.mPeerID;
                                            Values.AtAdding() = UniqueKey;
                                            Values.AtAdding() = j;
                                            Platform::BroadcastNotify(CallNames[b], Values);
                                        }
                                    })
                                {
                                    ZAY_MOVE(panel, 1, 1)
                                    ZAY_INNER(panel, -1)
                                    ZAY_RGBA(panel, 255, 255, 255, 160)
                                        panel.fill();
                                    const bool Focused = !!(panel.state(UIName) & PS_Focused);
                                    const sint32 DraggingValue = !!(panel.state(UIName) & PS_Dragging);
                                    ZAY_COLOR(panel, CurLog.mColor)
                                    ZAY_MOVE(panel, DraggingValue, DraggingValue)
                                    {
                                        ZAY_RGBA(panel, 128, 128, 128, (Focused)? 64 : 32)
                                            panel.fill();
                                        ZAY_RGB(panel, 128, 32, 32)
                                            panel.text(UITexts[b][j]);
                                        panel.rect(1);
                                    }
                                }
                                UIPos += TextWidth + 10 + 5;
                            }
                        }
                        break;
                    }
                }
            }
        }

        // 부드러운 스크롤
        if(mLogScrollSmooth != mLogScroll)
        {
            mLogScrollSmooth = mLogScrollSmooth * 0.9 + mLogScroll * 0.1;
            if(mLogScrollSmooth < mLogScroll) mLogScrollSmooth++;
            else if(mLogScrollSmooth > mLogScroll) mLogScrollSmooth--;
            UpdateOnce = true;
        }

        // 클리어
        if(0 < mLogFocus)
        {
            ZAY_XYWH_UI(panel, panel.w() - (100 + 10), panel.h() - 26 - 10, 100, 26, "clear-log",
                ZAY_GESTURE_T(t, this)
                {
                    if(t == GT_Pressed)
                    {
                        Mutex::Lock(mMutex);
                        {
                            for(sint32 i = 0; i < mLogMax; ++i)
                            {
                                mLogs[i].mPeerID = 0;
                                mLogs[i].mText.Empty();
                                mLogs[i].mColor = Color();
                                mLogs[i].mCheck = false;
                            }
                            mLogFocus = 0;
                            mLogScroll = 0;
                            mLogScrollSmooth = 0;
                        }
                        Mutex::Unlock(mMutex);
                    }
                })
            {
                ZAY_RGBA(panel, 255, 192, 192, (panel.state("clear-log") & PS_Focused)? 255 : 128)
                    panel.fill();
                ZAY_RGB(panel, 0, 0, 0)
                {
                    panel.text("Clear LOG");
                    ZAY_INNER(panel, 3)
                        panel.rect(1);
                }
            }
        }

        // 스크롤복원
        if(0 < mLogScrollSmooth)
        {
            ZAY_XYWH_UI(panel, panel.w() - ((0 < mLogFocus)? 200 + 20 : 100 + 10), panel.h() - 26 - 10, 100, 26, "scroll-off",
                ZAY_GESTURE_T(t, this)
                {
                    if(t == GT_Pressed)
                    {
                        Mutex::Lock(mMutex);
                        {
                            mLogScroll = 0;
                            mLogScrollSmooth = 0;
                        }
                        Mutex::Unlock(mMutex);
                    }
                })
            {
                ZAY_RGBA(panel, 192, 255, 255, (panel.state("scroll-off") & PS_Focused)? 255 : 128)
                    panel.fill();
                ZAY_RGB(panel, 0, 0, 0)
                {
                    panel.text("Scroll OFF");
                    ZAY_INNER(panel, 3)
                        panel.rect(1);
                }
            }
        }
    }
    Mutex::Unlock(mMutex);
    return UpdateOnce;
}

void CmdView::OnPacket(packettype type, sint32 peerid, bytes buffer)
{
    Mutex::Lock(mMutex);
    {
        auto& CurLog = mLogs[mLogFocus % mLogMax];
        CurLog.mPeerID = peerid;
        CurLog.mColor = Color(0, 255, 0);
        CurLog.mCheck = false;
        switch(type)
        {
        case packettype_entrance:
            CurLog.mText = String::Format("<<<entrance>>> peer_%d", peerid);
            CurLog.mColor = Color(255, 0, 255);
            break;
        case packettype_message:
            {
                auto Header = (const PacketHeader*) buffer;
                auto Payload = (addr) Header->mPayload;
                switch(Header->mFuncID)
                {
                case dDetector::StampST:
                    {
                        auto Name = dDetector::parseString(Payload);
                        auto TimeNS = dDetector::parseInt64(Payload);
                        CurLog.mText = String::Format("[stamp] %s, %I64d", Name, TimeNS);
                    }
                    break;
                case dDetector::ScopeBeginST:
                    {
                        auto Name = dDetector::parseString(Payload);
                        auto TimeNS = dDetector::parseInt64(Payload);
                        CurLog.mText = String::Format("[scope-begin] %s, %I64d", Name, TimeNS);
                    }
                    break;
                case dDetector::ScopeEndST:
                    {
                        auto Name = dDetector::parseString(Payload);
                        auto TimeNS = dDetector::parseInt64(Payload);
                        CurLog.mText = String::Format("[scope-end] %s, %I64d", Name, TimeNS);
                    }
                    break;
                case dDetector::TraceST:
                    {
                        auto Text = dDetector::parseString(Payload);
                        auto Level = dDetector::parseInt32(Payload);
                        switch((dDetector::Level) Level)
                        {
                        case dDetector::InfoLevel:
                            CurLog.mText = String::Format("<info> %s", Text);
                            CurLog.mColor = Color(255, 255, 0);
                            break;
                        case dDetector::WarnLevel:
                            CurLog.mText = String::Format("<warn> %s", Text);
                            CurLog.mColor = Color(255, 128, 0);
                            break;
                        case dDetector::ErrorLevel:
                            CurLog.mText = String::Format("<error> %s", Text);
                            CurLog.mColor = Color(255, 0, 0);
                            break;
                        }
                    }
                    break;
                case dDetector::ValidST:
                    {
                        auto Text = dDetector::parseString(Payload);
                        auto ValidKey = dDetector::parseInt32(Payload);
                        CurLog.mText = String::Format("<valid:%d> %s", ValidKey, Text);
                        CurLog.mColor = Color(0, 255, 255);
                    }
                    break;
                case dDetector::CheckST:
                    {
                        auto Text = dDetector::parseString(Payload);
                        auto CheckKey = dDetector::parseInt32(Payload);
                        CurLog.mText = String::Format("<check:%d> %s", CheckKey, Text);
                        CurLog.mColor = Color(0, 128, 255);
                    }
                    break;
                case dDetector::SetValueSS:
                    {
                        auto Name = dDetector::parseString(Payload);
                        auto Value = dDetector::parseString(Payload);
                        CurLog.mText = String::Format("[setvalue] %s, \"%s\"", Name, Value);
                        Strings Payloads;
                        Payloads.AtAdding() = Name;
                        Payloads.AtAdding() = Value;
                        Platform::BroadcastNotify("SetValue", Payloads);
                    }
                    break;
                case dDetector::SetValueST:
                    {
                        auto Name = dDetector::parseString(Payload);
                        auto Value = dDetector::parseInt32(Payload);
                        CurLog.mText = String::Format("[setvalue] %s, %d", Name, Value);
                        Strings Payloads;
                        Payloads.AtAdding() = Name;
                        Payloads.AtAdding() = String::FromInteger(Value);
                        Platform::BroadcastNotify("SetValue", Payloads);
                    }
                    break;
                case dDetector::AddValueST:
                    {
                        auto Name = dDetector::parseString(Payload);
                        auto Addition = dDetector::parseInt32(Payload);
                        if(0 <= Addition)
                            CurLog.mText = String::Format("[addvalue] %s, +%d", Name, Addition);
                        else CurLog.mText = String::Format("[addvalue] %s, %d", Name, Addition);
                        Strings Payloads;
                        Payloads.AtAdding() = Name;
                        Payloads.AtAdding() = String::FromInteger(Addition);
                        Platform::BroadcastNotify("AddValue", Payloads);
                    }
                    break;
                case dDetector::KillValueS:
                    {
                        auto Name = dDetector::parseString(Payload);
                        CurLog.mText = String::Format("[killvalue] %s", Name);
                        String Payload = Name;
                        Platform::BroadcastNotify("KillValue", Payload);
                    }
                    break;
                }
            }
            break;
        case packettype_leaved:
            CurLog.mText = String::Format("<<<leaved>>> peer_%d", peerid);
            CurLog.mColor = Color(255, 0, 255);
            break;
        case packettype_kicked:
            CurLog.mText = String::Format("<<<kicked>>> peer_%d", peerid);
            CurLog.mColor = Color(255, 0, 255);
            break;
        default: break;
        }
        mLogFocus++;
        if(0 < mLogScroll)
        {
            mLogScroll += mLogHeight;
            mLogScrollSmooth += mLogHeight;
        }
    }
    Mutex::Unlock(mMutex);
}

void CmdView::AddLog(chars text, const Color color)
{
    Mutex::Lock(mMutex);
    {
        auto& CurLog = mLogs[mLogFocus % mLogMax];
        CurLog.mPeerID = 0;
        CurLog.mText = text;
        CurLog.mColor = color;
        CurLog.mCheck = false;
        mLogFocus++;
        if(0 < mLogScroll)
        {
            mLogScroll += mLogHeight;
            mLogScrollSmooth += mLogHeight;
        }
    }
    Mutex::Unlock(mMutex);
}

CmdView::Log* CmdView::GetLastLog(sint32 pos)
{
    const sint32 CurFocus = mLogFocus + mLogMax - 1 - pos;
    if(0 <= CurFocus)
        return &mLogs[CurFocus % mLogMax];
    return nullptr;
}
