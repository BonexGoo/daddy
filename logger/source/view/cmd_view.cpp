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
    mLogs[0].mText = "<<<server-on>>>";
    mLogs[0].mColor = Color(255, 0, 255);
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
        ZAY_RGB(panel, 0, 0, 0)
            panel.fill();

        for(sint32 i = mLogScrollSmooth / mLogHeight; i < mLogMax; ++i)
        {
            const sint32 CurFocus = (mLogFocus + mLogMax - 1 - i) % mLogMax;
            const auto& CurLog = mLogs[CurFocus];
            ZAY_XYWH(panel, 5, mLogHeight * i - mLogScrollSmooth, panel.w(), mLogHeight)
            {
                if(panel.visible() != VS_Visible)
                    break;
                ZAY_COLOR(panel, CurLog.mColor)
                    panel.text(CurLog.mText, UIFA_LeftMiddle, UIFE_Right);

                // Valid처리
                if(!CurLog.mText.Left(7).Compare("<valid:"))
                {
                    const sint32 EndPos = CurLog.mText.Find(0, ">");
                    if(EndPos != -1)
                    {
                        const sint32 ValidKey = Parser::GetInt(CurLog.mText.Middle(7, EndPos - 7));
                        sint32 UIPos = Platform::Graphics::GetStringWidth(CurLog.mText) + 5;
                        chars UITexts[3] = {"break", "continue", "ignore"};
                        ZAY_FONT(panel, 0.8)
                        for(sint32 j = 0; j < 3; ++j)
                        {
                            const String UIName = CurLog.mText.Left(EndPos + 1) + UITexts[j];
                            const sint32 TextWidth = Platform::Graphics::GetStringWidth(UITexts[j]);
                            ZAY_XYWH_UI(panel, UIPos, 3, TextWidth + 10, panel.h() - 3, UIName,
                                ZAY_GESTURE_T(t, this, CurFocus, EndPos, ValidKey, j)
                                {
                                    if(t == GT_InReleased)
                                    {
                                        auto& CurLog = mLogs[CurFocus];
                                        CurLog.mText = "<valid>" + CurLog.mText.Right(CurLog.mText.Length() - (EndPos + 1));
                                        sint32s Values;
                                        Values.AtAdding() = CurLog.mPeerID;
                                        Values.AtAdding() = ValidKey;
                                        Values.AtAdding() = j;
                                        Platform::BroadcastNotify("SendValid", Values);
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
                                        panel.text(UITexts[j]);
                                    panel.rect(1);
                                }
                            }
                            UIPos += TextWidth + 10 + 5;
                        }
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

        // 스크롤복원
        if(0 < mLogScrollSmooth)
        {
            ZAY_LTRB_UI(panel, panel.w() - 100 - 10, 10, panel.w() - 10, 10 + 26, "scroll-off",
                ZAY_GESTURE_T(t, this)
                {
                    if(t == GT_Pressed)
                    {
                        mLogScroll = 0;
                        mLogScrollSmooth = 0;
                    }
                })
            {
                ZAY_RGBA(panel, 192, 255, 255, (panel.state("scroll-off") & PS_Focused)? 255 : 192)
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
        auto& CurLog = mLogs[mLogFocus];
        CurLog.mPeerID = peerid;
        CurLog.mColor = Color(0, 255, 0);
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
                case dDetector::SetValueSS:
                    {
                        auto Name = dDetector::parseString(Payload);
                        auto Value = dDetector::parseString(Payload);
                        CurLog.mText = String::Format("[setvalue] %s, \"%s\"", Name, Value);
                    }
                    break;
                case dDetector::SetValueST:
                    {
                        auto Name = dDetector::parseString(Payload);
                        auto Value = dDetector::parseInt32(Payload);
                        CurLog.mText = String::Format("[setvalue] %s, %d", Name, Value);
                    }
                    break;
                case dDetector::AddValueST:
                    {
                        auto Name = dDetector::parseString(Payload);
                        auto Addition = dDetector::parseInt32(Payload);
                        if(0 <= Addition)
                            CurLog.mText = String::Format("[addvalue] %s, +%d", Name, Addition);
                        else CurLog.mText = String::Format("[addvalue] %s, %d", Name, Addition);
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
        mLogFocus = (mLogFocus + 1) % mLogMax;
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
        auto& CurLog = mLogs[mLogFocus];
        CurLog.mPeerID = 0;
        CurLog.mText = text;
        CurLog.mColor = color;
        mLogFocus = (mLogFocus + 1) % mLogMax;
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
