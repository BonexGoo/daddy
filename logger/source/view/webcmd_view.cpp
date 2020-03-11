#include <boss.hpp>
#include <daddy.hpp>
#include "webcmd_view.hpp"

#include <resource.hpp>

Peer::Peer()
{
    mPeerID = 0;
}

Peer::~Peer()
{
}

void Peer::Init(sint32 peerid)
{
    mPeerID = peerid;
}

void Peer::AddHttp(WebCmdView* view, bytes buffer, sint32 length)
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

            view->OnHttpGET(mPeerID, Param);
            mHttpDump = mHttpDump.Right(mHttpDump.Length() - (EndPos + HttpEnd.Length()));
        }
        else break;
    }
}

WebCmdView::WebCmdView()
{
    mRefServer = nullptr;
    mRefCmdView = nullptr;
    mMutex = Mutex::Open();
    mAniValue = 0;
}

WebCmdView::~WebCmdView()
{
    Mutex::Close(mMutex);
}

bool WebCmdView::OnRender(ZayPanel& panel)
{
    bool UpdateOnce = false;
    Mutex::Lock(mMutex);
    {
        for(sint32 i = 0; i < mAniValue; ++i)
        {
            ZAY_INNER(panel, i + 1)
            ZAY_RGBA(panel, 255, 0, 255, 200 * (mAniValue - i) / (mAniValue + 1))
                panel.rect(1);
        }
        UpdateOnce = (0 < mAniValue)? mAniValue-- : false;
    }
    Mutex::Unlock(mMutex);
    return UpdateOnce;
}

void WebCmdView::OnPacket(packettype type, sint32 peerid, bytes buffer, sint32 length)
{
    Mutex::Lock(mMutex);
    {
        switch(type)
        {
        case packettype_entrance:
            mPeerMap[peerid].Init(peerid);
            break;
        case packettype_message:
            mPeerMap[peerid].AddHttp(this, buffer, length);
            break;
        case packettype_leaved:
        case packettype_kicked:
            mPeerMap.Remove(peerid);
            break;
        default: break;
        }
    }
    Mutex::Unlock(mMutex);
}

void WebCmdView::SetRef(id_server server, CmdView* cmdview)
{
    Mutex::Lock(mMutex);
    {
        mRefServer = server;
        mRefCmdView = cmdview;
    }
    Mutex::Unlock(mMutex);
}

void WebCmdView::OnHttpGET(sint32 peerid, chars url)
{
    mAniValue = 15;
    branch;
    jump(!String::Compare(url, "/"))
    {
        const String HtmlText = String::FromAsset("html/redirect_start.html");
        SendHttp(peerid, 200, HtmlText, HtmlText.Length());
    }
    jump(!String::Compare(url, "/favicon.ico"))
    {
        const String HtmlIco = String::FromAsset("html/main.ico");
        SendHttp(peerid, 200, HtmlIco, HtmlIco.Length());
    }
    jump(!String::Compare(url, "/fingerprint?text=", 18))
    {
        const String Text = &url[18];
        dString DeviceID = dUnique::fingerPrint((chars) Text, Text.Length());
        SendHttp(peerid, 200, DeviceID.string(), DeviceID.length());
    }
    jump(!String::Compare(url, "/latest?deviceid=", 17))
    {
        String TextCollector;
        if(mRefCmdView)
        {
            for(sint32 i = 0; i < 50; ++i)
            {
                if(auto CurLog = mRefCmdView->GetLastLog(i))
                if(0 < CurLog->mText.Length())
                {
                    auto NewHtmlLog = CurLog->mText.ToHtmlString();
                    TextCollector += String::Format(
                        "<p style=\"color:#%02X%02X%02X\">%s</p>\n",
                        CurLog->mColor.r, CurLog->mColor.g, CurLog->mColor.b, (chars) NewHtmlLog);
                }
            }
        }
        else TextCollector = "<p style=\"color:#FF0000\">ERROR</p>\n";

        String HtmlText = String::FromAsset("html/redirect.html");
        HtmlText.Replace("######", TextCollector);
        SendHttp(peerid, 200, HtmlText, HtmlText.Length());
    }
    jump(!String::Compare(url, "/addlog?", 8))
    {
        if(mRefCmdView)
        {
            String UrlParamDump = &url[8];
            UrlParamDump.Replace("&", ";");
            UrlParamDump.AddTail(";");
            Context UrlParams;
            UrlParams.LoadPrm(UrlParamDump);
            mRefCmdView->AddLog(
                (chars) String::FromUrlString(UrlParams("text").GetString()),
                Color('#' + String::FromUrlString(UrlParams("color").GetString("808080"))));
        }

        const String HtmlText = "OK";
        SendHttp(peerid, 200, HtmlText, HtmlText.Length());
    }
    else
    {
        const String HtmlText = String::FromAsset("html/error.html");
        SendHttp(peerid, 400, HtmlText, HtmlText.Length());
    }
}

void WebCmdView::SendHttp(sint32 peerid, sint32 code, chars html, sint32 length)
{
    if(mRefServer)
    {
        const String HttpHeader = String::Format(
            "HTTP/1.1 %d OK\r\n"
            "Content-Type: text/html; charset=utf-8\r\n"
            "Server: Microsoft-HTTPAPI/2.0\r\n"
            "Connection: close\r\n"
            "Content-Length: %d\r\n"
            "Access-Control-Allow-Origin: *\r\n"
            "\r\n", code, length);
        Platform::Server::SendToPeer(mRefServer, peerid, (chars) HttpHeader, HttpHeader.Length());
        Platform::Server::SendToPeer(mRefServer, peerid, html, length);
    }
}
