#include <boss.hpp>
#include <daddy.hpp>
#include "logger.hpp"

#include <resource.hpp>

ZAY_DECLARE_VIEW_CLASS("loggerView", loggerData)

ZAY_VIEW_API OnCommand(CommandType type, chars topic, id_share in, id_cloned_share* out)
{
}

ZAY_VIEW_API OnNotify(NotifyType type, chars topic, id_share in, id_cloned_share* out)
{
    if(type == NT_SocketReceive)
    {
        while(Platform::Server::TryNextPacket(m->mCmdServer))
        {
            m->mCmdView.OnPacket(
                Platform::Server::GetPacketType(m->mCmdServer),
                Platform::Server::GetPacketPeerID(m->mCmdServer),
                Platform::Server::GetPacketBuffer(m->mCmdServer));
            m->invalidate(2);
        }

        while(Platform::Server::TryNextPacket(m->mWebCmdServer))
        {
            sint32 BufferSize = 0;
            bytes BufferData = Platform::Server::GetPacketBuffer(m->mWebCmdServer, &BufferSize);
            m->mWebCmdView.OnPacket(
                Platform::Server::GetPacketType(m->mWebCmdServer),
                Platform::Server::GetPacketPeerID(m->mWebCmdServer),
                BufferData, BufferSize);
            m->invalidate(2);
        }
    }
    else if(type == NT_Normal)
    {
        struct PacketValid
        {
            uint32_t mPacketSize; // 12
            int32_t mPacketType; // 'VALD'
            int32_t mKey;
            int32_t mCommand;
        };

        if(!String::Compare(topic, "SendValid"))
        {
            const sint32s Values(in);
            const PacketValid NewPacket = {12, 'VALD', Values[1], Values[2]};
            Platform::Server::SendToPeer(m->mCmdServer, Values[0], &NewPacket, sizeof(PacketValid));
        }
    }
}

ZAY_VIEW_API OnGesture(GestureType type, sint32 x, sint32 y)
{
}

ZAY_VIEW_API OnRender(ZayPanel& panel)
{
    if(m->mCmdView.OnRender(panel))
        m->invalidate(2);
    if(m->mWebCmdView.OnRender(panel))
        m->invalidate(2);
}

loggerData::loggerData()
{
    mCmdServer = Platform::Server::Create(true);
    Platform::Server::Listen(mCmdServer, 7070);

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
