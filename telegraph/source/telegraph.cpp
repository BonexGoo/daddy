#include <boss.hpp>
#include <daddy.hpp>
#include "telegraph.hpp"

#include <resource.hpp>

ZAY_DECLARE_VIEW_CLASS("telegraphView", telegraphData)

ZAY_VIEW_API OnCommand(CommandType type, chars topic, id_share in, id_cloned_share* out)
{
}

ZAY_VIEW_API OnNotify(NotifyType type, chars topic, id_share in, id_cloned_share* out)
{
    if(type == NT_Normal)
    {
        if(!String::Compare(topic, "Connecting"))
        {
            const Strings Connectors(in);
            Node::SendConnecting(m->mServer, m->mNodes, Connectors[0], Connectors[1]);
        }
        else if(!String::Compare(topic, "Disconnecting"))
        {
            const String Connector(in);
            Node::SendDisconnecting(m->mServer, m->mNodes, Connector);
        }
    }
    else if(type == NT_SocketReceive)
    {
        while(Platform::Server::TryNextPacket(m->mServer))
        {
            const sint32 CurPeerID = Platform::Server::GetPacketPeerID(m->mServer);
            switch(Platform::Server::GetPacketType(m->mServer))
            {
            case packettype_entrance:
                m->mNodes[CurPeerID].SetPeerID(CurPeerID);
                break;
            case packettype_message:
                {
                    sint32 BufferSize = 0;
                    auto NewBuffer = (dumps) Platform::Server::GetPacketBuffer(m->mServer, &BufferSize);
                    const dZokeReader NewReader(dBinary::fromExternal(NewBuffer, (uint32_t) BufferSize));

                    if(!String::Compare(NewReader("type").getString(), "node"))
                        m->mNodes[CurPeerID].SetNodeID(NewReader("id").getString());
                    else if(!String::Compare(NewReader("type").getString(), "connect_add"))
                    {
                        if(auto ServerConnector = m->mNodes[CurPeerID].ConnectAdd(
                            NewReader("id").getInt32(-1),
                            NewReader("entry").getString(),
                            NewReader("protocol").getString()))
                        {
                            ip4address IP4;
                            ip6address IP6;
                            if(Platform::Server::GetPeerInfo(m->mServer, CurPeerID, &IP4, &IP6))
                                ServerConnector->InitAddress(IP4, IP6, NewReader("port").getUint16());
                        }
                    }
                    else if(!String::Compare(NewReader("type").getString(), "connect_sub"))
                    {
                        m->mNodes[CurPeerID].ConnectSub(
                            NewReader("id").getInt32(-1));
                    }
                    // 개발전용
                    else if(!String::Compare(NewReader("type").getString(), "toast"))
                        m->mNodes[CurPeerID].SetToast(NewReader("text").getString());
                    else if(!String::Compare(NewReader("type").getString(), "silk_flush"))
                        m->mNodes[CurPeerID].SetFlush(NewReader("slik").getInt32(),
                            NewReader("amount").getUint32(), NewReader("all").getUint8());
                }
                break;
            case packettype_leaved:
            case packettype_kicked:
                m->mNodes.Remove(CurPeerID);
                break;
            }
            m->invalidate(2);
        }
        if(m->mScheduler.OnSocketReceive())
            m->invalidate(2);
    }
}

ZAY_VIEW_API OnGesture(GestureType type, sint32 x, sint32 y)
{
}

ZAY_VIEW_API OnRender(ZayPanel& panel)
{
    ZAY_RGB(panel, 255, 255, 255)
        panel.fill();
    ZAY_RGBA(panel, 128, 128, 128, 32)
        panel.stretch(m->mWorldMap, Image::Build::AsyncNotNull, UISF_Outer);

    // 노드
    for(sint32 i = 0, iend = m->mNodes.Count(); i < iend; ++i)
        if(m->mNodes.AccessByOrder(i)->OnRender(panel))
            m->invalidate(2);

    // 스케줄러
    if(m->mScheduler.OnRender(panel))
        m->invalidate(2);
}

telegraphData::telegraphData()
{
    mServer = Platform::Server::Create(true);
    Platform::Server::Listen(mServer, 11019);
    mWorldMap.SetName("image/worldmap.png").Load();
}

telegraphData::~telegraphData()
{
    Platform::Server::Release(mServer);
}
