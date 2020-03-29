#include <boss.hpp>
#include <daddy.hpp>
#include "logger.hpp"

#include <resource.hpp>

ZAY_DECLARE_VIEW_CLASS("loggerView", loggerData)

ZAY_VIEW_API OnCommand(CommandType type, chars topic, id_share in, id_cloned_share* out)
{
}

void loggerData::UpdatePeer(id_server server, packettype type, sint32 id)
{
    if(type == packettype_entrance)
    {
        ip4address IP = {};
        uint16 Port = 0;
        Platform::Server::GetPeerInfo(server, id, &IP, nullptr, &Port);
        auto& NewPeer = mPeers.AtAdding();
        NewPeer.mRefServer = server;
        NewPeer.mID = id;
        NewPeer.mText = String::Format("%u.%u.%u.%u:%u", IP.ip[0], IP.ip[1], IP.ip[2], IP.ip[3], Port);
    }
    else if(type == packettype_leaved || type == packettype_kicked)
    {
        for(sint32 i = 0, iend = mPeers.Count(); i < iend; ++i)
        {
            if(mPeers[i].mID == id)
            {
                mPeers.SubtractionSection(i);
                break;
            }
        }
    }
}

ZAY_VIEW_API OnNotify(NotifyType type, chars topic, id_share in, id_cloned_share* out)
{
    if(type == NT_SocketReceive)
    {
        while(Platform::Server::TryNextPacket(m->mCmdServer))
        {
            const packettype Type = Platform::Server::GetPacketType(m->mCmdServer);
            const sint32 PeerID = Platform::Server::GetPacketPeerID(m->mCmdServer);
            m->UpdatePeer(m->mCmdServer, Type, PeerID);
            m->mCmdView.OnPacket(Type, PeerID,
                Platform::Server::GetPacketBuffer(m->mCmdServer));
            m->invalidate(2);
        }
        while(Platform::Server::TryNextPacket(m->mWebCmdServer))
        {
            const packettype Type = Platform::Server::GetPacketType(m->mWebCmdServer);
            const sint32 PeerID = Platform::Server::GetPacketPeerID(m->mWebCmdServer);
            sint32 BufferSize = 0;
            bytes BufferData = Platform::Server::GetPacketBuffer(m->mWebCmdServer, &BufferSize);
            m->UpdatePeer(m->mWebCmdServer, Type, PeerID);
            m->mWebCmdView.OnPacket(Type, PeerID, BufferData, BufferSize);
            m->invalidate(2);
        }
    }
    else if(type == NT_Normal)
    {
        if(!String::Compare(topic, "SetValue"))
        {
            const Strings Texts(in);
            m->mTreeView.Update(Texts[0], Texts[1], false);
            m->invalidate(1);
        }
        else if(!String::Compare(topic, "AddValue"))
        {
            const Strings Texts(in);
            m->mTreeView.Update(Texts[0], Texts[1], true);
            m->invalidate(1);
        }
        else if(!String::Compare(topic, "KillValue"))
        {
            const String Text(in);
            m->mTreeView.Remove(Text);
            m->invalidate(1);
        }
        else
        {
            struct CommandPacket
            {
                uint32_t mPacketSize; // 12
                int32_t mPacketType; // 'VALD', 'CHCK'
                int32_t mKey;
                int32_t mCommand;
            };
            if(!String::Compare(topic, "SendValid"))
            {
                const sint32s Values(in);
                const CommandPacket NewPacket = {12, 'VALD', Values[1], Values[2]};
                Platform::Server::SendToPeer(m->mCmdServer, Values[0], &NewPacket, sizeof(CommandPacket));
            }
            else if(!String::Compare(topic, "SendCheck"))
            {
                const sint32s Values(in);
                const CommandPacket NewPacket = {12, 'CHCK', Values[1], Values[2]};
                Platform::Server::SendToPeer(m->mCmdServer, Values[0], &NewPacket, sizeof(CommandPacket));
            }
        }
    }
}

ZAY_VIEW_API OnGesture(GestureType type, sint32 x, sint32 y)
{
}

ZAY_VIEW_API OnRender(ZayPanel& panel)
{
    const sint32 ToolBarHeight = 30;
    const sint32 ToolBarInner = 2;
    const sint32 LayoutWidth = 40 * (sint32) ViewLayout::Count + ToolBarInner * 2;
    chars LayoutNames[(sint32) ViewLayout::Count] = {"Cmd", "Dom", "C/D"};

    // 툴바
    ZAY_LTRB(panel, 0, 0, panel.w(), ToolBarHeight)
    {
        // 배경
        ZAY_RGB(panel, 255, 255, 255)
            panel.fill();

        // 접속자
        ZAY_LTRB_SCISSOR(panel, 5, 0, panel.w() - LayoutWidth - 5, panel.h())
        for(sint32 i = 0, iend = m->mPeers.Count(), pos = 1; i < iend; ++i)
        {
            auto& CurPeer = m->mPeers[i];
            const sint32 TextBoxWidth = 10 + Platform::Graphics::GetStringWidth(CurPeer.mText);
            ZAY_XYWH_UI(panel, pos, 7, TextBoxWidth, panel.h() - 13, CurPeer.mText,
                ZAY_GESTURE_T(t, i)
                {
                    if(t == GT_Pressed)
                        Platform::Server::KickPeer(m->mPeers[i].mRefServer, m->mPeers[i].mID);
                })
            {
                const bool Focused = !!(panel.state(CurPeer.mText) & PS_Focused);
                ZAY_RGBA(panel, 0, 0, 0, (Focused)? 255 : 192)
                    panel.fill();
                ZAY_RGB(panel, 0, 0, 0)
                    panel.rect(1);
                // 접속정보
                if(CurPeer.mRefServer == m->mWebCmdServer)
                {
                    ZAY_RGB(panel, (Focused)? 255 : 192, 0, (Focused)? 255 : 192)
                        panel.text(CurPeer.mText);
                }
                else
                {
                    ZAY_RGB(panel, 0, (Focused)? 255 : 192, (Focused)? 255 : 192)
                        panel.text(CurPeer.mText);
                }
            }
            pos += TextBoxWidth + 7;
        }

        // 레이아웃버튼
        ZAY_LTRB(panel, panel.w() - LayoutWidth, 0, panel.w(), panel.h())
        {
            ZAY_RGBA(panel, 0, 0, 0, 128)
                panel.fill();
            ZAY_INNER(panel, ToolBarInner)
            for(sint32 i = 0, iend = 3; i < iend; ++i)
            {
                const String UIButton = String::Format("layout%d", i);
                ZAY_LTRB_UI(panel, panel.w() * i / iend, 0, panel.w() * (i + 1) / iend, panel.h(), UIButton,
                    ZAY_GESTURE_T(t, i)
                    {
                        if(t == GT_InReleased)
                            m->mLayout = (ViewLayout) i;
                    })
                ZAY_INNER(panel, ToolBarInner)
                {
                    const bool Selected = (m->mLayout == (ViewLayout) i);
                    const bool Focused = !!(panel.state(UIButton) & PS_Focused);
                    const bool Dragging = !!(panel.state(UIButton) & PS_Dragging);
                    ZAY_RGB_IF(panel, 255, 255, 255, !Selected && !Focused)
                    ZAY_RGB_IF(panel, 192, 240, 255, !Selected && Focused)
                    ZAY_RGB_IF(panel, 128, 224, 255, Selected)
                        panel.fill();
                    ZAY_RGBA(panel, 0, 0, 0, (Dragging)? 255 : 192)
                        panel.text(LayoutNames[i]);
                    ZAY_RGBA(panel, 0, 0, 0, (Dragging)? 255 : 64)
                        panel.rect(1);
                }
            }
        }

        // 외곽선
        ZAY_RGBA(panel, 0, 0, 0, 16)
        ZAY_XYWH(panel, 0, 0, panel.w(), 1)
            panel.fill();
    }

    // 뷰
    ZAY_LTRB(panel, 0, ToolBarHeight, panel.w(), panel.h())
    {
        switch(m->mLayout)
        {
        case ViewLayout::CmdOnly:
            ZAY_INNER_SCISSOR(panel, 0)
            {
                if(m->mCmdView.OnRender(panel))
                    m->invalidate(2);
                if(m->mWebCmdView.OnRender(panel))
                    m->invalidate(2);
            }
            break;
        case ViewLayout::TreeOnly:
            ZAY_INNER_SCISSOR(panel, 0)
            {
                if(m->mTreeView.OnRender(panel))
                    m->invalidate(2);
            }
            break;
        case ViewLayout::CmdAndTree:
            ZAY_LTRB_SCISSOR(panel, 0, 0, panel.w() / 2, panel.h())
            {
                if(m->mTreeView.OnRender(panel))
                    m->invalidate(2);
            }
            ZAY_LTRB_SCISSOR(panel, panel.w() / 2, 0, panel.w(), panel.h())
            {
                if(m->mCmdView.OnRender(panel))
                    m->invalidate(2);
                if(m->mWebCmdView.OnRender(panel))
                    m->invalidate(2);
            }
            break;
        }
    }
}

loggerData::loggerData()
{
    mLayout = ViewLayout::CmdAndTree;
    // 로그서버
    mCmdServer = Platform::Server::Create(true);
    Platform::Server::Listen(mCmdServer, 7070);
    // 웹서버
    mWebCmdServer = Platform::Server::Create(false);    
    Platform::Server::Listen(mWebCmdServer, 10950);
    mWebCmdView.SetRef(mWebCmdServer, &mCmdView);
}

loggerData::~loggerData()
{
    mWebCmdView.SetRef(nullptr, nullptr);
    Platform::Server::Release(mCmdServer);
    Platform::Server::Release(mWebCmdServer);
}
