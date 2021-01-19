#include <boss.hpp>
#include <daddy.hpp>
#include "scheduler.hpp"

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ Scheduler
void Scheduler::MoveServerConnectors(float addx, float addy) const
{
    mConnector.MoveForServer(addx, addy);
}

bool Scheduler::OnRender(ZayPanel& panel)
{
    bool NeedUpdate = false;
    const Color BGColor(192 - 192 * mButtonPos, 192 + 63 * mButtonPos, 192 + 63 * mButtonPos);

    ZAY_XYRR_UI(panel, panel.w() / 2 + mPos.x, panel.h() / 2 + mPos.y, 60, 25, "Scheduler",
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
                Platform::Popup::ShowToolTip("Scheduler");
        })
    {
        NeedUpdate |= mConnector.OnRender(panel);

        // 애니메이션 효과
        ZAY_INNER(panel, -2)
        {
            for(sint32 i = 0; i < mAniValue; ++i)
            {
                ZAY_INNER(panel, -i)
                ZAY_RGBA(panel, 0, 255, 255, 200 * (mAniValue - i) / (mAniValue + 1))
                    panel.rect(1);
            }
            ZAY_RGB(panel, 0, 0, 0)
                panel.fill();
            if(0 < mAniValue)
            {
                mAniValue--;
                NeedUpdate = true;
            }
        }
        ZAY_COLOR(panel, BGColor)
            panel.fill();

        // 타이틀
        ZAY_LTRB(panel, 5, 0, panel.w() - 5, panel.h() - 30 + 5)
        {
            ZAY_RGB(panel, 0, 0, 0)
            {
                if(auto PeerCount = mHttpPeers->Count())
                    panel.text(String::Format("SCHEDULER(%d)", PeerCount), UIFA_LeftMiddle);
                else panel.text("SCHEDULER", UIFA_LeftMiddle);
            }
        }

        // 온오프바
        ZAY_LTRB(panel, 0, panel.h() - 30, panel.w(), panel.h())
        ZAY_INNER(panel, 5)
        {
            panel.fill();
            // 슬라이딩버튼
            ZAY_LTRB(panel, 0, 0, panel.w() - 40, panel.h())
            {
                ZAY_XYWH_UI(panel, panel.w() * mButtonPos, 0, 40, panel.h(), "Scheduler_Button",
                    ZAY_GESTURE_T(t, this)
                    {
                        if(t == GT_Pressed)
                            mEnabled ^= true;
                    })
                ZAY_INNER(panel, 2)
                {
                    ZAY_INNER(panel, -1)
                    ZAY_RGB(panel, 0, 0, 0)
                        panel.fill();
                    ZAY_COLOR(panel, BGColor)
                    ZAY_RGB_IF(panel, 224, 224, 224, panel.state("Scheduler_Button") & PS_Focused)
                        panel.fill();
                }
            }
            // 외곽선
            ZAY_INNER(panel, 1)
            ZAY_RGBA(panel, 0, 0, 0, 128)
                panel.rect(1);
        }

        if(0 < mToast.Length())
        {
            const sint32 Width = Platform::Graphics::GetStringWidth(mToast);
            const sint32 Height = Platform::Graphics::GetStringHeight();
            ZAY_XYRR_UI(panel, panel.w() / 2, -Height / 2, Width / 2 + 10, Height / 2 + 5, "Scheduler_Toast",
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

    if(mEnabled && mButtonPos < 1.0f)
    {
        mButtonPos = Math::MinF((mButtonPos * 0.9f + 1 * 0.1f) + 0.01f, 1.0f);
        NeedUpdate = true;
    }
    else if(!mEnabled && 0.0f < mButtonPos)
    {
        mButtonPos = Math::MaxF(0.0f, (mButtonPos * 0.9f + 0 * 0.1f) - 0.01f);
        NeedUpdate = true;
    }
    return NeedUpdate;
}

bool Scheduler::OnTick()
{
    bool NeedUpdate = false;
    for(sint32 i = 0, iend = mJobs->Count(); i < iend; ++i)
    {
        if(auto CurJob = mJobs->AccessByOrder(i))
        if(CurJob->UpdateJobPermil())
        {
            mAniValue = 15;
            NeedUpdate = true;
        }
    }
    return NeedUpdate;
}

bool Scheduler::OnSocketReceive()
{
    bool NeedUpdate = false;
    while(Platform::Server::TryNextPacket(mScheduleServer))
    {
        sint32 BufferSize = 0;
        bytes BufferData = Platform::Server::GetPacketBuffer(mScheduleServer, &BufferSize);
        OnSchedulePacket(Platform::Server::GetPacketType(mScheduleServer),
            Platform::Server::GetPacketPeerID(mScheduleServer), BufferData, BufferSize);
        NeedUpdate = true;
    }
    while(Platform::Server::TryNextPacket(mHttpServer))
    {
        sint32 BufferSize = 0;
        bytes BufferData = Platform::Server::GetPacketBuffer(mHttpServer, &BufferSize);
        OnHttpPacket(Platform::Server::GetPacketType(mHttpServer),
            Platform::Server::GetPacketPeerID(mHttpServer), BufferData, BufferSize);
        NeedUpdate = true;
    }
    return NeedUpdate;
}

void Scheduler::OnSchedulePacket(packettype type, sint32 peerid, bytes buffer, sint32 length)
{
    switch(type)
    {
    case packettype_entrance:
        (*mSchedulePeers)[peerid] = peerid;
        break;
    case packettype_message:
        ////////////////////
        break;
    case packettype_leaved:
    case packettype_kicked:
        mSchedulePeers->Remove(peerid);
        break;
    default: break;
    }
}

void Scheduler::SendCreateJob(sint32 jobid, chars batchjob, sint32 batchcount, chars redirect_url)
{
    // 배치잡 분산전달 구성
    dZoker NewZoke;
    NewZoke("type").setString("createjob");
    NewZoke("jobid").setUint32(jobid);
    NewZoke("batchjob").setString(dString(batchjob));
    NewZoke("redirect_url").setString(dString(redirect_url));
    // 배치잡 분산전달
    sint32 SumLength = 0;
    for(sint32 i = 0, iend = mSchedulePeers->Count(); i < iend; ++i)
    {
        sint32 CurPeerID = *mSchedulePeers->AccessByOrder(i);
        NewZoke("batchidx_begin").setUint32(batchcount * i / iend);
        NewZoke("batchidx_end").setUint32(batchcount * (i + 1) / iend);
        auto NewBinary = NewZoke.build();
        auto NewBinaryLength = NewBinary.length();
        Platform::Server::SendToPeer(mScheduleServer, CurPeerID, &NewBinaryLength, 4);
        Platform::Server::SendToPeer(mScheduleServer, CurPeerID, NewBinary.buffer(), NewBinaryLength);
        SumLength += NewBinaryLength;
    }
    mConnector.SetFlush(SumLength, true);
}

void Scheduler::OnHttpPacket(packettype type, sint32 peerid, bytes buffer, sint32 length)
{
    switch(type)
    {
    case packettype_entrance:
        (*mHttpPeers)[peerid].Init(peerid);
        break;
    case packettype_message:
        (*mHttpPeers)[peerid].AddHttp(this, buffer, length);
        break;
    case packettype_leaved:
    case packettype_kicked:
        mHttpPeers->Remove(peerid);
        break;
    default: break;
    }
}

void Scheduler::OnHttp(sint32 peerid, chars url)
{
    mAniValue = 15;

    branch;
    jump(!String::Compare(url, "/"))
    {
        const String HtmlText = "Invalid URL";
        SendHttp(peerid, 400, HtmlText, HtmlText.Length());
    }
    jump(!String::Compare(url, "/favicon.ico"))
    {
        const String HtmlIco = String::FromAsset("image/spider.ico");
        SendHttp(peerid, 200, HtmlIco, HtmlIco.Length());
    }
    jump(!String::Compare(url, "/createjob?", 11))
    {
        String UrlParamDump = &url[11];
        UrlParamDump.Replace("&", ";");
        UrlParamDump.AddTail(";");
        Context UrlParams;
        UrlParams.LoadPrm(UrlParamDump);

        auto& NewJob = (*mJobs)[++mLastJobID];
        if(NewJob.Init(mLastJobID, UrlParams))
        {
            const String NewJobID = String::FromInteger(mLastJobID);
            SendHttp(peerid, 200, NewJobID, NewJobID.Length());
            // 배치잡 분산전달
            auto BatchJob = String::FromUrlString(UrlParams("batchjob").GetText());
            auto BatchCount = UrlParams("batchcount").GetInt();
            auto RedirectUrl = String::FromUrlString(UrlParams("redirect_url").GetText());
            SendCreateJob(mLastJobID, BatchJob, BatchCount, RedirectUrl);
        }
        else
        {
            const String HtmlText = "RedirectUrl Error";
            SendHttp(peerid, 400, HtmlText, HtmlText.Length());
        }
    }
    jump(!String::Compare(url, "/getjob?jobid=", 14))
    {
        const sint32 JobID = Parser::GetInt(&url[14]);
        if(auto CurJob = mJobs->Access(JobID))
        {
            const String HtmlText = CurJob->ToHtml();
            SendHttp(peerid, 200, HtmlText, HtmlText.Length());
        }
        else
        {
            const String HtmlText = String::Format("Unknown JobID(%d)", JobID);
            SendHttp(peerid, 400, HtmlText, HtmlText.Length());
        }
    }
    jump(!String::Compare(url, "/deletejob?jobid=", 17))
    {
        const sint32 JobID = Parser::GetInt(&url[17]);
        if(auto CurJob = mJobs->Access(JobID))
        {
            mJobs->Remove(JobID);
            const String HtmlText = "OK";
            SendHttp(peerid, 200, HtmlText, HtmlText.Length());
        }
        else
        {
            const String HtmlText = String::Format("Unknown JobID(%d)", JobID);
            SendHttp(peerid, 400, HtmlText, HtmlText.Length());
        }
    }
    else
    {
        const String HtmlText = "Invalid URL";
        SendHttp(peerid, 400, HtmlText, HtmlText.Length());
    }
}

void Scheduler::SendHttp(sint32 peerid, sint32 code, chars html, sint32 length)
{
    if(mHttpServer)
    {
        const String HttpHeader = String::Format(
            "HTTP/1.1 %d OK\r\n"
            "Content-Type: text/html; charset=utf-8\r\n"
            "Server: Microsoft-HTTPAPI/2.0\r\n"
            "Connection: close\r\n"
            "Content-Length: %d\r\n"
            "Access-Control-Allow-Origin: *\r\n"
            "\r\n", code, length);
        Platform::Server::SendToPeer(mHttpServer, peerid, (chars) HttpHeader, HttpHeader.Length());
        Platform::Server::SendToPeer(mHttpServer, peerid, html, length);
    }
}

void Scheduler::SetToast(chars text)
{
    mToast = text;
}

void Scheduler::SetFlush(uint32 amount, bool all)
{
    mConnector.SetFlush(amount, all);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ Scheduler::escaper
void Scheduler::_init_(InitType type)
{
    if(type == InitType::Create)
    {
        mConnector.Init("SchedulerServer", EntryType::Server, "Scheduler", 0);
        const Context LoadContext(ST_Json, SO_NeedCopy, String::FromAsset("node/scheduler.json"));
        mPos.x = LoadContext("posx").GetFloat(0);
        mPos.y = LoadContext("posy").GetFloat(0);
        mEnabled = LoadContext("enabled").GetInt(0);
        mButtonPos = (mEnabled)? 1 : 0;

        mScheduleServer = Platform::Server::Create(true);
        Platform::Server::Listen(mScheduleServer, 22070);
        mSchedulePeers = new Map<sint32>();
        ip6address IP6Address;
        ip4address IP4Address = Platform::Socket::GetLocalAddress(&IP6Address);
        mConnector.InitAddress(IP4Address, IP6Address, 22070);

        mHttpServer = Platform::Server::Create(false);
        Platform::Server::Listen(mHttpServer, 12070);
        mHttpPeers = new Map<WebPeer>();
        mJobs = new Map<WebJob>();
        mAniValue = 0;
        mLastJobID = 0;
    }
    else
    {
        mScheduleServer = nullptr;
        mHttpServer = nullptr;
        mHttpPeers = nullptr;
        mJobs = nullptr;
    }
}

void Scheduler::_quit_()
{
    mConnector.Disable();
    Context SaveContext;
    SaveContext.At("posx").Set(String::FromFloat(mPos.x));
    SaveContext.At("posy").Set(String::FromFloat(mPos.y));
    SaveContext.At("enabled").Set(String::FromInteger(mEnabled));
    SaveContext.SaveJson().ToAsset("node/scheduler.json");

    Platform::Server::Release(mScheduleServer);
    delete mSchedulePeers;
    Platform::Server::Release(mHttpServer);
    delete mHttpPeers;
    delete mJobs;
}

void Scheduler::_move_(_self_&& rhs)
{
    mConnector = DD_rvalue(rhs.mConnector);
    mPos = DD_rvalue(rhs.mPos);
    mToast = DD_rvalue(rhs.mToast);
    mEnabled = DD_rvalue(rhs.mEnabled);
    mButtonPos = DD_rvalue(rhs.mButtonPos);

    mScheduleServer = DD_rvalue(rhs.mScheduleServer);
    mSchedulePeers = DD_rvalue(rhs.mSchedulePeers);
    mHttpServer = DD_rvalue(rhs.mHttpServer);
    mHttpPeers = DD_rvalue(rhs.mHttpPeers);
    mJobs = DD_rvalue(rhs.mJobs);
    mLastJobID = DD_rvalue(rhs.mLastJobID);
    mAniValue = DD_rvalue(rhs.mAniValue);
}

void Scheduler::_copy_(const _self_& rhs)
{
    BOSS_ASSERT("잘못된 시나리오입니다", false);
}
