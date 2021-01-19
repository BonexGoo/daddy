#include <boss.hpp>
#include <daddy.hpp>
#include "node.hpp"

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ Node
void Node::SetPeerID(sint32 peerid)
{
    mPeerID = peerid;
}

void Node::SetNodeID(chars nodeid)
{
    mNodeID = nodeid;
    const Context LoadContext(ST_Json, SO_NeedCopy, String::FromAsset("node/" + mNodeID + ".json"));
    mPos.x = LoadContext("posx").GetFloat(0);
    mPos.y = LoadContext("posy").GetFloat(0);
}

void Node::SendToPeer(id_server server, const dZoker& zoker) const
{
    const dBinary NewZoke = zoker.build();
    uint32_t Length = NewZoke.length();
    Platform::Server::SendToPeer(server, mPeerID, &Length, 4);
    Platform::Server::SendToPeer(server, mPeerID, NewZoke.buffer(), Length);
}

Connector* Node::ConnectAdd(sint32 entryid, chars entrytype, chars protocol)
{
    if(entryid == -1) return nullptr;
    const String NewConnectorID = String::Format("%s-%d", (chars) mNodeID, entryid);

    if(!String::Compare(entrytype, "server"))
    {
        mConnectors[entryid].Init(NewConnectorID, EntryType::Server, protocol, entryid);
        return &mConnectors[entryid];
    }
    else if(!String::Compare(entrytype, "client"))
    {
        mConnectors[entryid].Init(NewConnectorID, EntryType::Client, protocol, entryid);
        const Context LoadContext(ST_Json, SO_NeedCopy, String::FromAsset("node/" + mNodeID + ".json"));
        if(LoadContext("client")(NewConnectorID).HasValue())
        {
            auto JoinedConnectorID = LoadContext("client")(NewConnectorID).GetText();
            mConnectors[entryid].JoinToServer(JoinedConnectorID);
        }
    }
    return nullptr;
}

void Node::ConnectSub(sint32 entryid)
{
    if(entryid == -1) return;
    if(auto OldConnector = mConnectors.Access(entryid))
        OldConnector->Disable();
}

void Node::MoveServerConnectors(float addx, float addy) const
{
    for(sint32 i = 0, iend = mConnectors.Count(); i < iend; ++i)
        mConnectors.AccessByOrder(i)->MoveForServer(addx, addy);
}

bool Node::OnRender(ZayPanel& panel)
{
    bool NeedUpdate = false;
    const String UIName = String::Format("Node%d", mPeerID);
    ZAY_XYRR_UI(panel, panel.w() / 2 + mPos.x, panel.h() / 2 + mPos.y, 15, 15, UIName,
        ZAY_GESTURE_VNTXY(v, n, t, x, y, this)
        {
            static Point OldPos;
            if(t == GT_Pressed)
                OldPos = Point(x, y);
            else if(t == GT_InDragging || t == GT_OutDragging)
            {
                const Point AddXY(x - OldPos.x, y - OldPos.y);
                mPos += AddXY;
                OldPos = Point(x, y);
                MoveServerConnectors(AddXY.x, AddXY.y);
                v->invalidate();
            }
            else if(t == GT_ToolTip)
                Platform::Popup::ShowToolTip("NodeID:" + mNodeID);
        })
    {
        for(sint32 i = 0, iend = mConnectors.Count(); i < iend; ++i)
            NeedUpdate |= mConnectors.AccessByOrder(i)->OnRender(panel);

        ZAY_INNER(panel, -4)
        ZAY_RGBA(panel, 0, 0, 0, 128)
            panel.circle();
        ZAY_RGB(panel, 255, 255, 0)
            panel.circle();
        ZAY_FONT(panel, 0.8)
        ZAY_RGB(panel, 0, 0, 0)
            panel.text(String::Format("P%d", mPeerID));

        if(0 < mToast.Length())
        {
            const sint32 Width = Platform::Graphics::GetStringWidth(mToast);
            const sint32 Height = Platform::Graphics::GetStringHeight();
            ZAY_XYRR_UI(panel, panel.w() / 2, -Height / 2, Width / 2 + 10, Height / 2 + 5, UIName + "_Toast",
                ZAY_GESTURE_T(t, this)
                {
                    if(t == GT_Pressed)
                        mToast.Empty();
                })
            {
                ZAY_RGBA(panel, 255, 255, 255, 192)
                    panel.fill();
                ZAY_RGB(panel, 0, 0, 128)
                    panel.rect(0.5);
                ZAY_RGB(panel, 0, 0, 128)
                    panel.text(mToast);
            }
        }
    }
    return NeedUpdate;
}

void Node::SetToast(chars text)
{
    mToast = text;
}

void Node::SetFlush(sint32 entryid, uint32 amount, bool all)
{
    if(entryid == -1) return;
    if(auto CurConnector = mConnectors.Access(entryid))
        CurConnector->SetFlush(amount, all);
}

const Node* Node::GetNodeFrom(const Map<Node>& nodes, chars connectorid, sint32* entryid)
{
    for(sint32 i = 0, iend = nodes.Count(); i < iend; ++i)
    {
        const Node* CurNode = nodes.AccessByOrder(i);
        if(!String::Compare(CurNode->mNodeID, connectorid, CurNode->mNodeID.Length()))
        {
            if(entryid)
            {
                chars EntryID = connectorid + CurNode->mNodeID.Length() + 1;
                *entryid = Parser::GetInt(EntryID);
            }
            return CurNode;
        }
    }
    return nullptr;
}

void Node::SendConnecting(id_server server, const Map<Node>& nodes, chars client_connectorid, chars server_connectorid)
{
    sint32 ClientEntryID = 0;
    const Node* Client = GetNodeFrom(nodes, client_connectorid, &ClientEntryID);
    const Connector* Server = Connector::FindPool(server_connectorid);

    dZoker NewZoker;
    NewZoker("type").setString("connected");
    NewZoker("id").setInt32(ClientEntryID);
    Server->SaveAddress(NewZoker("address"));
    Client->SendToPeer(server, NewZoker);
}

void Node::SendDisconnecting(id_server server, const Map<Node>& nodes, chars client_connectorid)
{
    sint32 ClientEntryID = 0;
    const Node* Client = GetNodeFrom(nodes, client_connectorid, &ClientEntryID);

    dZoker NewZoker;
    NewZoker("type").setString("disconnected");
    NewZoker("id").setInt32(ClientEntryID);
    Client->SendToPeer(server, NewZoker);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ Node::escaper
void Node::_init_(InitType type)
{
    if(type == InitType::Create)
        mPeerID = -1;
}

void Node::_quit_()
{
    if(0 < mNodeID.Length())
    {
        Context SaveContext;
        SaveContext.At("posx").Set(String::FromFloat(mPos.x));
        SaveContext.At("posy").Set(String::FromFloat(mPos.y));
        for(sint32 i = 0, iend = mConnectors.Count(); i < iend; ++i)
            mConnectors.AccessByOrder(i)->SaveForClient(SaveContext);
        SaveContext.SaveJson().ToAsset("node/" + mNodeID + ".json");
    }
}

void Node::_move_(_self_&& rhs)
{
    mPeerID = DD_rvalue(rhs.mPeerID);
    mNodeID = DD_rvalue(rhs.mNodeID);
    mConnectors = DD_rvalue(rhs.mConnectors);
    mPos = DD_rvalue(rhs.mPos);
    mToast = DD_rvalue(rhs.mToast);
}

void Node::_copy_(const _self_& rhs)
{
    BOSS_ASSERT("잘못된 시나리오입니다", false);
}
