#include <boss.hpp>
#include <daddy.hpp>
#include "node.hpp"

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ Connector
void Connector::Init(chars connectorid, EntryType type, chars protocol, sint32 pos)
{
    mEnabled = true;
    mConnectorID = connectorid;
    mType = type;
    mProtocol = protocol;
    mPosDegreeTarget = (90 * 3 + 50 * pos) % 360;
    mConnected = false;
    mFlushMsec = 0;
    mFlushAmount = 0;
    // 풀등록
    SetPool(mConnectorID);
}

void Connector::Disable()
{
    mEnabled = false;
}

void Connector::JoinToServer(chars connectorid) const
{
    mJoinedConnectorID = connectorid;
}

void Connector::ExitToServer() const
{
    mJoinedConnectorID.Empty();
}

void Connector::MoveForServer(float addx, float addy) const
{
    if(mType == EntryType::Server && mEnabled)
    {
        const Context XY(ST_Json, SO_NeedCopy, Platform::Option::GetText(mConnectorID));
        Platform::Option::SetText(mConnectorID, String::Format("[%f, %f]", XY[0].GetFloat() + addx, XY[1].GetFloat() + addy));
    }
}

void Connector::SaveForClient(Context& saver) const
{
    if(mType == EntryType::Client && 0 < mJoinedConnectorID.Length())
        saver.At("client").At(mConnectorID).Set(mJoinedConnectorID);
}

void Connector::InitAddress(const ip4address& ip4, const ip6address& ip6, uint16 port)
{
    mIP4 = ip4;
    mIP6 = ip6;
    mPort = port;
}

void Connector::SaveAddress(dZoker& saver) const
{
    saver("ip4").setString(dString::print("%d.%d.%d.%d", mIP4.ip[0], mIP4.ip[1], mIP4.ip[2], mIP4.ip[3]));
    saver("ip6").setString(dString::print("%d.%d.%d.%d.%d.%d",
        mIP6.ip[10], mIP6.ip[11], mIP6.ip[12], mIP6.ip[13], mIP6.ip[14], mIP6.ip[15]));
    saver("port").setUint16(mPort);
}

static struct SelectInfo
{
    const Connector* mConnector;
    Point mPos;
} gSelectInfo;

bool Connector::OnRender(ZayPanel& panel) const
{
    // 접속상태 업데이트
    const String JoinedXY = (0 < mJoinedConnectorID.Length())? Platform::Option::GetText(mJoinedConnectorID) : "";
    const bool NewConnected = (mEnabled && 0 < JoinedXY.Length());
    if(mConnected != NewConnected)
    {
        mConnected = NewConnected;
        if(mConnected)
        {
            Strings Connectors;
            Connectors.AtAdding() = mConnectorID;
            Connectors.AtAdding() = mJoinedConnectorID;
            Platform::BroadcastNotify("Connecting", Connectors);
        }
        else Platform::BroadcastNotify("Disconnecting", mConnectorID);
    }
    if(!mEnabled) return false;

    // 플래시 애니메이션
    sint32 FlushValue = 0;
    const uint64 CurMsec = Platform::Utility::CurrentTimeMsec();
    if(CurMsec < mFlushMsec + 500)
        FlushValue = 100 - 100 * (CurMsec - mFlushMsec) / 500;
    mFlushEffect = (FlushValue == 0)? 0 : Math::Mod(mFlushEffect + 0.025, 0.5);

    if(mConnected) // 연결된 클라이언트
    {
        const bool IsFocused = !!(panel.state(mConnectorID) & PS_Focused);

        const Point Begin(panel.w() / 2, panel.h() / 2);
        const Context XY(ST_Json, SO_NeedCopy, JoinedXY);
        Point End = Point(XY[0].GetFloat(), XY[1].GetFloat()) - panel.toview(0, 0);
        const float Degree = Math::ToDegree(Math::Atan(End.x - Begin.x, End.y - Begin.y));

        // 지름만큼 거리축소
        const float Distance = Math::Distance(Begin.x, Begin.y, End.x, End.y);
        if(14 < Distance)
        {
            End.x = Begin.x + (End.x - Begin.x) * (Distance - 14) / Distance;
            End.y = Begin.y + (End.y - Begin.y) * (Distance - 14) / Distance;
        }

        ZAY_RGBA(panel, 0, 0, 0, 64)
        ZAY_RGBA(panel, 128 + FlushValue, 128, 128, 128)
            panel.line(Begin, End, 4 + 2 * mFlushEffect);

        ZAY_XYRR_UI(panel, End.x, End.y, 7, 7, mConnectorID,
            ZAY_GESTURE_T(t, this)
            {
                if(t == GT_Pressed)
                    ExitToServer();
                else if(t == GT_ToolTip)
                    Platform::Popup::ShowToolTip("Exit");
            })
        {
            const float XR = panel.w() / 2 * (1 + mFlushEffect / 2);
            const float YR = panel.h() / 2 * (1 + mFlushEffect / 2);
            Points Edges;
            Edges.AtAdding() = Point(XR, 0);
            Edges.AtAdding() = Point(-XR, YR);
            Edges.AtAdding() = Point(-XR, -YR);
            for(sint32 i = 0; i < 3; ++i)
            {
                const Point CurEdge = Edges[i];
                Edges.At(i).x = CurEdge.x * Math::Cos(Math::ToRadian(Degree)) + CurEdge.y * Math::Sin(Math::ToRadian(Degree));
                Edges.At(i).y = CurEdge.x * Math::Sin(Math::ToRadian(Degree)) - CurEdge.y * Math::Cos(Math::ToRadian(Degree));
            }
            ZAY_RGB_IF(panel, 0, 0, 0, !IsFocused)
            ZAY_RGB_IF(panel, 160, 0, 0, IsFocused)
            ZAY_RGBA(panel, 128 + FlushValue, 128, 128, 128)
            ZAY_MOVE(panel, panel.w() / 2, panel.h() / 2)
                panel.polygon(Edges);
        }
    }
    else
    {
        const bool IsSelected = (gSelectInfo.mConnector == this);
        const bool IsGrayServer = (mType == EntryType::Server && gSelectInfo.mConnector && !!gSelectInfo.mConnector->mProtocol.Compare(mProtocol));
        const bool IsBoldClient = (IsSelected || (mType == EntryType::Client && !gSelectInfo.mConnector && (panel.state(mConnectorID) & PS_Focused)));

        const float PosX = mPosDistance * Math::Cos(Math::ToRadian(mPosDegree));
        const float PosY = mPosDistance * Math::Sin(Math::ToRadian(mPosDegree));
        const Point Begin(panel.w() / 2, panel.h() / 2);
        const Point End(Begin.x + PosX, Begin.y + PosY);
        Point EndAdd;
        float Degree = mPosDegree;
        if(IsSelected)
        {
            EndAdd = (gSelectInfo.mPos - panel.toview(0, 0)) - End;
            Degree = Math::ToDegree(Math::Atan(End.x + EndAdd.x - Begin.x, End.y + EndAdd.y - Begin.y));
        }

        ZAY_RGBA_IF(panel, 0, 0, 160, 64, mType == EntryType::Server && !IsGrayServer)
        ZAY_RGBA_IF(panel, 160, 160, 160, 64, mType == EntryType::Server && IsGrayServer)
        ZAY_RGBA_IF(panel, 0, 130, 0, 64, mType == EntryType::Client && !IsBoldClient)
        ZAY_RGBA_IF(panel, 0, 190, 0, 128, mType == EntryType::Client && IsBoldClient)
        ZAY_RGBA(panel, 128 + FlushValue, 128, 128, 128)
            panel.line(Begin, End + EndAdd, 4 + 2 * mFlushEffect);

        ZAY_XYRR_UI(panel, End.x, End.y, 7, 7, mConnectorID,
            ZAY_GESTURE_VNTXY(v, n, t, x, y, this)
            {
                if(t == GT_Pressed)
                {
                    if(mType == EntryType::Client)
                    {
                        gSelectInfo.mConnector = this;
                        gSelectInfo.mPos.x = x;
                        gSelectInfo.mPos.y = y;
                    }
                }
                else if(t == GT_InDragging || t == GT_OutDragging)
                {
                    if(gSelectInfo.mConnector == this)
                    {
                        gSelectInfo.mPos.x = x;
                        gSelectInfo.mPos.y = y;
                        v->invalidate(2);
                    }
                }
                else if(t == GT_InReleased || t == GT_OutReleased)
                {
                    if(gSelectInfo.mConnector == this)
                        gSelectInfo.mConnector = nullptr;
                }
                else if(t == GT_Dropped)
                {
                    if(mType == EntryType::Server && gSelectInfo.mConnector && !gSelectInfo.mConnector->mProtocol.Compare(mProtocol))
                        gSelectInfo.mConnector->JoinToServer(n);
                }
                else if(t == GT_ToolTip)
                    Platform::Popup::ShowToolTip("Protocol:" + mProtocol);
            })
        {
            if(mType == EntryType::Server)
            {
                ZAY_RGB_IF(panel, 0, 0, 160, !IsGrayServer)
                ZAY_RGB_IF(panel, 160, 160, 160, IsGrayServer)
                ZAY_RGBA(panel, 128 + FlushValue, 128, 128, 128)
                ZAY_INNER(panel, (!IsGrayServer && (panel.state(mConnectorID) & PS_Dropping))? -2 : 0)
                ZAY_INNER(panel, panel.w() / 2 * (-mFlushEffect / 2))
                    panel.circle();

                const Point JoinPos = panel.toview(panel.w() / 2, panel.h() / 2);
                Platform::Option::SetText(mConnectorID, String::Format("[%f, %f]", JoinPos.x, JoinPos.y));
            }
            else if(mType == EntryType::Client)
            {
                const float XR = panel.w() / 2 * (1 + mFlushEffect / 2) + ((IsBoldClient)? 2 : 0);
                const float YR = panel.h() / 2 * (1 + mFlushEffect / 2) + ((IsBoldClient)? 2 : 0);
                Points Edges;
                Edges.AtAdding() = Point(XR, 0);
                Edges.AtAdding() = Point(-XR, YR);
                Edges.AtAdding() = Point(-XR, -YR);
                for(sint32 i = 0; i < 3; ++i)
                {
                    const Point CurEdge = Edges[i];
                    Edges.At(i).x = EndAdd.x + CurEdge.x * Math::Cos(Math::ToRadian(Degree)) + CurEdge.y * Math::Sin(Math::ToRadian(Degree));
                    Edges.At(i).y = EndAdd.y + CurEdge.x * Math::Sin(Math::ToRadian(Degree)) - CurEdge.y * Math::Cos(Math::ToRadian(Degree));
                }
                ZAY_RGB_IF(panel, 0, 130, 0, !IsBoldClient)
                ZAY_RGB_IF(panel, 0, 190, 0, IsBoldClient)
                ZAY_RGBA(panel, 128 + FlushValue, 128, 128, 128)
                ZAY_MOVE(panel, panel.w() / 2, panel.h() / 2)
                    panel.polygon(Edges);
            }
        }
    }

    // 각도애니메이션
    if(mPosDegree != mPosDegreeTarget)
    {
        if(mPosDegree < mPosDegreeTarget)
        {
            const float ReverseTarget = mPosDegreeTarget - 360;
            if(mPosDegree - ReverseTarget < mPosDegreeTarget - mPosDegree) // 역타겟진행
            {
                if(mPosDegree - ReverseTarget < 0.1) // 근접처리
                    mPosDegree = ReverseTarget;
                else mPosDegree = mPosDegree * 0.9 + ReverseTarget * 0.1;
                mPosDegree = Math::Mod(mPosDegree + 360, 360);
            }
            else
            {
                if(mPosDegreeTarget - mPosDegree < 0.1) // 근접처리
                    mPosDegree = mPosDegreeTarget;
                else mPosDegree = mPosDegree * 0.9 + mPosDegreeTarget * 0.1;
            }
        }
        else
        {
            const float ReverseTarget = mPosDegreeTarget + 360;
            if(ReverseTarget - mPosDegree < mPosDegree - mPosDegreeTarget) // 역타겟진행
            {
                if(ReverseTarget - mPosDegree < 0.1) // 근접처리
                    mPosDegree = ReverseTarget;
                else mPosDegree = mPosDegree * 0.9 + ReverseTarget * 0.1;
                mPosDegree = Math::Mod(mPosDegree, 360);
            }
            else
            {
                if(mPosDegree - mPosDegreeTarget < 0.1) // 근접처리
                    mPosDegree = mPosDegreeTarget;
                else mPosDegree = mPosDegree * 0.9 + mPosDegreeTarget * 0.1;
            }
        }
        return true;
    }
    return (0 < FlushValue);
}

static Map<Connector*> gRefPool;
Connector* Connector::FindPool(chars connectorid)
{
    if(auto CurPool = gRefPool.Access(connectorid))
        return *CurPool;
    return nullptr;
}

void Connector::SetPool(chars connectorid) const
{
    gRefPool(connectorid) = (Connector*) this;
}

void Connector::ClearPool(chars connectorid) const
{
    gRefPool.Remove(connectorid);
}

void Connector::SetFlush(uint32 amount, bool all)
{
    mFlushMsec = Platform::Utility::CurrentTimeMsec();
    mFlushAmount = amount;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ Connector::escaper
void Connector::_init_(InitType type)
{
    if(type == InitType::Create)
    {
        mEnabled = true;
        mType = EntryType::Null;
        mPosDistance = 50;
        mPosDegree = 90 * 3;
        mPosDegreeTarget = 90 * 3;
        mIP4 = {0};
        mIP6 = {0};
        mPort = 0;
        mConnected = false;
        mFlushMsec = 0;
        mFlushAmount = 0;
        mFlushEffect = 0;
    }
}

void Connector::_quit_()
{
    if(mType == EntryType::Server)
        Platform::Option::SetText(mConnectorID, "");
    // 풀삭제
    ClearPool(mConnectorID);
}

void Connector::_move_(_self_&& rhs)
{
    mEnabled = DD_rvalue(rhs.mEnabled);
    mConnectorID = DD_rvalue(rhs.mConnectorID);
    mType = DD_rvalue(rhs.mType);
    mProtocol = DD_rvalue(rhs.mProtocol);
    mPosDistance = DD_rvalue(rhs.mPosDistance);
    mPosDegree = DD_rvalue(rhs.mPosDegree);
    mPosDegreeTarget = DD_rvalue(rhs.mPosDegreeTarget);
    mIP4 = DD_rvalue(rhs.mIP4);
    mIP6 = DD_rvalue(rhs.mIP6);
    mPort = DD_rvalue(rhs.mPort);
    mConnected = DD_rvalue(rhs.mConnected);
    mFlushMsec = DD_rvalue(rhs.mFlushMsec);
    mFlushAmount = DD_rvalue(rhs.mFlushAmount);
    mFlushEffect = DD_rvalue(rhs.mFlushEffect);
    // 풀등록
    SetPool(mConnectorID);
}

void Connector::_copy_(const _self_& rhs)
{
    BOSS_ASSERT("잘못된 시나리오입니다", false);
}
