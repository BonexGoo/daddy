#include <boss.hpp>
#include <daddy.hpp>
#include "webserver.hpp"

#include <scheduler.hpp>

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ WebPeer
void WebPeer::Init(sint32 peerid)
{
    mPeerID = peerid;
}

void WebPeer::AddHttp(Scheduler* scheduler, bytes buffer, sint32 length)
{
    static const String HttpBegin1("GET");
    static const String HttpBegin2("HTTP/1.1");
    static const String HttpEnd("\r\n\r\n");
    mHttpDump.AddTail((chars) buffer, length);

    sint32 BeginPos1 = 0, BeginPos2 = 0, EndPos = 0;
    while((EndPos = mHttpDump.Find(0, HttpEnd)) != -1)
    {
        if((BeginPos1 = mHttpDump.Find(0, HttpBegin1)) != -1 && (BeginPos2 = mHttpDump.Find(0, HttpBegin2)) != -1)
        {
            sint32 ParamPos = BeginPos1 + HttpBegin1.Length();
            while(mHttpDump[ParamPos] == ' ') ParamPos++;
            sint32 ParamSize = BeginPos2 - ParamPos;
            while(mHttpDump[ParamPos + ParamSize - 1] == ' ') ParamSize--;
            const String Param(&((chars) mHttpDump)[ParamPos], ParamSize);

            scheduler->OnHttp(mPeerID, Param);
            mHttpDump = mHttpDump.Right(mHttpDump.Length() - (EndPos + HttpEnd.Length()));
        }
        else break;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ WebPeer::escaper
void WebPeer::_init_(InitType type)
{
    mPeerID = 0;
}

void WebPeer::_quit_()
{
}

void WebPeer::_move_(_self_&& rhs)
{
    mPeerID = rhs.mPeerID;
    mHttpDump = DD_rvalue(rhs.mHttpDump);
}

void WebPeer::_copy_(const _self_& rhs)
{
    mPeerID = rhs.mPeerID;
    mHttpDump = rhs.mHttpDump;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ WebJob
bool WebJob::Init(sint32 jobid, const Context& params)
{
    mDeviceID = String::FromUrlString(params("deviceid").GetString());
    mSApp = String::FromUrlString(params("sapp").GetString());
    mBatchJob = String::FromUrlString(params("batchjob").GetString());
    mBatchCount = params("batchcount").GetInt();
    mRedirectUrl = String::FromUrlString(params("redirect_url").GetString());

    mJobID = jobid;
    mLastJobPermil = 0;
    mSocket = Platform::Socket::OpenForTcp();
    const sint32 Pos1 = mRedirectUrl.Find(0, "http://");
    const sint32 Pos2 = mRedirectUrl.Find(Pos1 + 7, ":");
    const sint32 Pos3 = mRedirectUrl.Find(Pos2 + 1, "/");
    if(Pos1 == -1 || Pos2 == -1 || Pos3 == -1)
        return false;

    const String Domain = mRedirectUrl.Middle(Pos1 + 7, Pos2 - (Pos1 + 7));
    const sint32 Port = Parser::GetInt(mRedirectUrl.Middle(Pos2 + 1, Pos3 - (Pos2 + 1)));
    if(!Platform::Socket::Connect(mSocket, Domain, Port))
    {
        Platform::Socket::Close(mSocket);
        mSocket = nullptr;
        return false;
    }
    return true;
}

String WebJob::ToHtml() const
{
    String Collector;
    Collector += String::Format("<p>DeviceID = %s</p>", (chars) mDeviceID);
    Collector += String::Format("<p>SApp = %s</p>", (chars) mSApp);
    Collector += String::Format("<p>BatchJob = %s</p>", (chars) mBatchJob);
    Collector += String::Format("<p>BatchCount = %d</p>", mBatchCount);
    Collector += String::Format("<p>RedirectUrl = %s</p>", (chars) mRedirectUrl);
    return Collector;
}

bool WebJob::UpdateJobPermil()
{
    if(mLastJobPermil == 1000) return false;
    if(Math::Random() < 0.95) return false;
    mLastJobPermil = Math::Min(mLastJobPermil + 50 + Math::Random() * 50, 1000);

    if(mSocket)
    {
        const String Url = String::Format("/updatejob?jobid=%d&progress=%.01f", mJobID, mLastJobPermil * 0.1f);
        const String HttpHeader = String::Format(
            "GET %s HTTP/1.1\r\n"
            "Host: 192.168.61.35:12070\r\n"
            "Connection: keep-alive\r\n"
            "Upgrade-Insecure-Requests: 1\r\n"
            "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36\r\n"
            "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\r\n"
            "Accept-Encoding: gzip, deflate\r\n"
            "Accept-Language: ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7\r\n\r\n", (chars) Url);
        Platform::Socket::Send(mSocket, (bytes)(chars) HttpHeader, HttpHeader.Length());
    }
    return true;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ WebJob::escaper
void WebJob::_init_(InitType type)
{
    mBatchCount = 0;
    mJobID = 0;
    mLastJobPermil = 0;
    mSocket = nullptr;
}

void WebJob::_quit_()
{
    Platform::Socket::Close(mSocket);
}

void WebJob::_move_(_self_&& rhs)
{
    mDeviceID = DD_rvalue(rhs.mDeviceID);
    mSApp = DD_rvalue(rhs.mSApp);
    mBatchJob = DD_rvalue(rhs.mBatchJob);
    mBatchCount = rhs.mBatchCount;
    mRedirectUrl = DD_rvalue(rhs.mRedirectUrl);
    mJobID = rhs.mJobID;
    mLastJobPermil = rhs.mLastJobPermil;
    mSocket = rhs.mSocket;
}

void WebJob::_copy_(const _self_& rhs)
{
    DD_assert(false, "you have called an unused method.");
}
