/// @brief     RPC-framework.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_telepath.hpp"

// Dependencies
#include "dd_binary.hpp"
#include "dd_platform.hpp"
#include "dd_string.hpp"
#include "dd_zoker.hpp"
#include <cstring>
#include <map>
#include <string>
#include <thread>
#include <stack>

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ TeleClientP
class TeleClientP
{
public:
    bool connectTo(utf8s hostname, uint16_t port)
    {
        return mConnected = mSocket.openClient(dString(hostname), port);
    }

    void disconnect()
    {
        mSocket.close();
        mConnected = false;
    }

    bool sendBinary(const dBinary& binary)
    {
        mConnected = mSocket.sendTo(0, binary, true);
        return mConnected;
    }

    dBinary recvBinary()
    {
        return mSocket.recvFrom(0);
    }

    bool nextReceive()
    {
        bool NeedUpdate = false;
        mSocket.recvAll([this, &NeedUpdate](uint32_t id, const dBinary& binary)->void
            {
                NeedUpdate |= mReceiveCB(id, dTelepath::ReceiveType::Message, binary);
            });
        return NeedUpdate;
    }

public:
    inline bool isConnected() const
    {return mConnected;}

DD_escaper_alone(TeleClientP):
    void _init_(InitType)
    {
        mReceiveCB = nullptr;
        mConnected = false;
    }
    void _quit_()
    {
    }
    void _move_(_self_&& rhs)
    {
        mSocket = DD_rvalue(rhs.mSocket);
        mReceiveCB = DD_rvalue(rhs.mReceiveCB);
        mConnected = DD_rvalue(rhs.mConnected);
    }
    void _copy_(const _self_& rhs)
    {
        mSocket = rhs.mSocket;
        mReceiveCB = rhs.mReceiveCB;
        mConnected = rhs.mConnected;
    }
    dSocket mSocket;
    dTelepath::ReceiveCB mReceiveCB;
    bool mConnected;

public:
    DD_passage_alone(TeleClientP, dTelepath::ReceiveCB cb)
    {
        mReceiveCB = cb;
        mConnected = false;
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ TeleServerP
class TeleServerP
{
public:
    bool bindTo(uint16_t port)
    {
        mSavedPort = port;
        if(!mReceiveCB)
            return mSocket.openServer(port);
        return mSocket.openServer(port,
            [this](dSocket::AssignType type, uint32_t id)->void
            {
                switch(type)
                {
                case dSocket::AssignType::Entrance:
                    mReceiveCB(id, dTelepath::ReceiveType::Connected, dBinary());
                    break;
                case dSocket::AssignType::Leaved:
                    mReceiveCB(id, dTelepath::ReceiveType::Disconnected, dBinary());
                    break;
                }
            });
    }

    uint32_t numClient() const
    {
        return mSocket.count();
    }

    bool sendBinary(dTelepath::TeleID tele, const dBinary& binary)
    {
        return mSocket.sendTo(tele, binary, true);
    }

    bool sendBinaryAll(const dBinary& binary)
    {
        return mSocket.sendAll(binary, true);
    }

    bool nextReceive()
    {
        bool NeedUpdate = false;
        mSocket.recvAll([this, &NeedUpdate](uint32_t id, const dBinary& binary)->void
            {
                NeedUpdate |= mReceiveCB(id, dTelepath::ReceiveType::Message, binary);
            });
        return NeedUpdate;
    }

public:
    inline uint16_t port() const
    {return mSavedPort;}

DD_escaper_alone(TeleServerP):
    void _init_(InitType)
    {
        mReceiveCB = nullptr;
        mSavedPort = 0;
    }
    void _quit_()
    {
    }
    void _move_(_self_&& rhs)
    {
        mSocket = DD_rvalue(rhs.mSocket);
        mReceiveCB = DD_rvalue(rhs.mReceiveCB);
        mSavedPort = DD_rvalue(rhs.mSavedPort);
    }
    void _copy_(const _self_& rhs)
    {
        mSocket = rhs.mSocket;
        mReceiveCB = rhs.mReceiveCB;
        mSavedPort = rhs.mSavedPort;
    }
    dSocket mSocket;
    dTelepath::ReceiveCB mReceiveCB;
    uint16_t mSavedPort;

public:
    DD_passage_alone(TeleServerP, dTelepath::ReceiveCB cb)
    {
        mReceiveCB = cb;
        mSavedPort = 0;
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ TeleGateClientP
class TeleGateClientP
{
public:
    TeleGateClientP()
    {
        mLastSilk = -1;
    }
    ~TeleGateClientP()
    {
    }

public:
    inline TeleClientP& gate()
    {return mGate;}

    void sendToGate_Node(dTelepath::onMarkInCB cb)
    {
        dZoker NewZoker;
        NewZoker("type").setString("node");
        NewZoker("id").setString(dString(cb((int32_t) dTeleApi::MarkInType::EntityUuid), -1));
        mGate.sendBinary(NewZoker.build());
    }

    void sendToGate_AddSilk(dTelepath::SilkID silk)
    {
        dZoker NewZoker;
        NewZoker("type").setString("connect_add");
        NewZoker("id").setInt32(silk);

        auto CurSilk = mSilks.find(silk);
        if(CurSilk != mSilks.end())
        {
            NewZoker("entry").setString(dString((CurSilk->second.mType == dTelepath::SilkType::Server)? "server" : "client"));
            NewZoker("protocol").setString(CurSilk->second.mProtocol);
            if(CurSilk->second.mType == dTelepath::SilkType::Server)
                NewZoker("port").setUint16(CurSilk->second.mSocket.mServer->port());
        }
        mGate.sendBinary(NewZoker.build());
    }

    void sendToGate_SubSilk(dTelepath::SilkID silk)
    {
        dZoker NewZoker;
        NewZoker("type").setString("connect_sub");
        NewZoker("id").setInt32(silk);
        mGate.sendBinary(NewZoker.build());
    }

    void sendToGate_AddAllSilks()
    {
        for(const auto& iSilk : mSilks)
            sendToGate_AddSilk(iSilk.first);
    }

    void sendToGate_Toast(dLiteral text)
    {
        dZoker NewZoker;
        NewZoker("type").setString("toast");
        NewZoker("text").setString(text);
        mGate.sendBinary(NewZoker.build());
    }

    void sendToGate_SilkFlush(int32_t silk, uint32_t amount, bool all)
    {
        dZoker NewZoker;
        NewZoker("type").setString("silk_flush");
        NewZoker("slik").setInt32(silk);
        NewZoker("amount").setUint32(amount);
        NewZoker("all").setUint8(all);
        mGate.sendBinary(NewZoker.build());
    }

public:
    class Silk
    {
    public:
        void initServer(dTelepath::ReceiveCB cb)
        {
            DD_assert(mSocket.mAny == nullptr, "you have called a method at the wrong timing.");
            mSocket.mServer = new TeleServerP(cb);
            for(int port = 61012; !mSocket.mServer->bindTo(port); ++port);
        }

        void initClient(dTelepath::ReceiveCB cb)
        {
            DD_assert(mSocket.mAny == nullptr, "you have called a method at the wrong timing.");
            mSocket.mClient = new TeleClientP(cb);
        }

    DD_escaper_alone(Silk):
        void _init_(InitType)
        {
            mType = dTelepath::SilkType::Server;
            mSocket.mAny = nullptr;
        }
        void _quit_()
        {
            if(mType == dTelepath::SilkType::Server)
                delete mSocket.mServer;
            else delete mSocket.mClient;
        }
        void _move_(_self_&& rhs)
        {
            mType = DD_rvalue(rhs.mType);
            mProtocol = DD_rvalue(rhs.mProtocol);
            mSocket.mAny = DD_rvalue(rhs.mSocket.mAny);
        }
        void _copy_(const _self_&)
        {
            DD_assert(false, "you have called an unused method.");
        }
    public:
        dTelepath::SilkType mType;
        dString mProtocol;
        union
        {
            void* mAny;
            TeleServerP* mServer;
            TeleClientP* mClient;
        } mSocket;
    };

    TeleServerP* linkedServer(dTelepath::SilkID silk)
    {
        auto CurSilk = mSilks.find(silk);
        if(CurSilk == mSilks.end())
            return nullptr;
        if(CurSilk->second.mType != dTelepath::SilkType::Server)
            return nullptr;
        return CurSilk->second.mSocket.mServer;
    }

    TeleClientP* linkedClient(dTelepath::SilkID silk)
    {
        auto CurSilk = mSilks.find(silk);
        if(CurSilk == mSilks.end())
            return nullptr;
        if(CurSilk->second.mType != dTelepath::SilkType::Client)
            return nullptr;
        return CurSilk->second.mSocket.mClient;
    }

    bool nextReceiveForAllSilks()
    {
        bool NeedUpdate = false;
        for(const auto& iSilk : mSilks)
        {
            if(iSilk.second.mType == dTelepath::SilkType::Server)
                NeedUpdate |= iSilk.second.mSocket.mServer->nextReceive();
            else NeedUpdate |= iSilk.second.mSocket.mClient->nextReceive();
        }
        return NeedUpdate;
    }

    dTelepath::SilkID addSilk(dTelepath::SilkType type, dLiteral protocol, dTelepath::ReceiveCB cb)
    {
        Silk& NewSilk = mSilks[++mLastSilk];
        NewSilk.mType = type;
        NewSilk.mProtocol = protocol;

        if(type == dTelepath::SilkType::Server)
            NewSilk.initServer(cb);
        else NewSilk.initClient(cb);
        return mLastSilk;
    }

    void subSilk(dTelepath::SilkID silk)
    {
        mSilks.erase(silk);
    }

    uint32_t numLinkedTelepath(dTelepath::SilkID silk)
    {
        auto CurSilk = mSilks.find(silk);
        if(CurSilk == mSilks.end())
            return 0;
        if(CurSilk->second.mType == dTelepath::SilkType::Server)
            return CurSilk->second.mSocket.mServer->numClient();
        return CurSilk->second.mSocket.mClient->isConnected()? 1 : 0;
    }

    bool send(dTelepath::SilkID silk, dTelepath::TeleID tele, const dBinary& binary)
    {
        auto CurSilk = mSilks.find(silk);
        if(CurSilk == mSilks.end())
            return false;
        if(CurSilk->second.mType == dTelepath::SilkType::Server)
            return CurSilk->second.mSocket.mServer->sendBinary(tele, binary);
        return CurSilk->second.mSocket.mClient->sendBinary(binary);
    }

    bool sendAll(dTelepath::SilkID silk, const dBinary& binary)
    {
        auto CurSilk = mSilks.find(silk);
        if(CurSilk == mSilks.end())
            return false;
        if(CurSilk->second.mType == dTelepath::SilkType::Server)
            return CurSilk->second.mSocket.mServer->sendBinaryAll(binary);
        return CurSilk->second.mSocket.mClient->sendBinary(binary);
    }

private:
    TeleClientP mGate;
    dTelepath::SilkID mLastSilk;
    std::map<dTelepath::SilkID, Silk> mSilks;
};

static TeleGateClientP* gLastClient = nullptr;

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dTelepath
dTelepath::SilkID dTelepath::addSilk(SilkType type, dLiteral protocol, ReceiveCB cb)
{
    const SilkID NewSilk = gLastClient->addSilk(type, protocol, cb);
    printf("[daddy] dTelepath.addSilk(%s, %.*s) ---> %d\n",
        (type == SilkType::Server)? "Server" : "Client",
        protocol.length(), protocol.string(), NewSilk);

    if(gLastClient->gate().isConnected())
        gLastClient->sendToGate_AddSilk(NewSilk);
    return NewSilk;
}

void dTelepath::subSilk(SilkID silk)
{
    gLastClient->subSilk(silk);
    printf("[daddy] dTelepath.subSilk(%d)\n", silk);

    if(gLastClient->gate().isConnected())
        gLastClient->sendToGate_SubSilk(silk);
}

uint32_t dTelepath::numLinkedTelepath(SilkID silk)
{
    return gLastClient->numLinkedTelepath(silk);
}

bool dTelepath::send(SilkID silk, TeleID tele, const dBinary binary)
{
    bool Result = gLastClient->send(silk, tele, binary);
    gLastClient->sendToGate_SilkFlush(silk, binary.length(), false);
    return Result;
}

bool dTelepath::sendAll(SilkID silk, const dBinary binary)
{
    bool Result = gLastClient->sendAll(silk, binary);
    gLastClient->sendToGate_SilkFlush(silk, binary.length(), true);
    return Result;
}

void dTelepath::toast(dLiteral text)
{
    gLastClient->sendToGate_Toast(text);
}

TeleGateClientP* dTelepath::createClient()
{
    return (gLastClient = new TeleGateClientP());
}

bool dTelepath::releaseClient()
{
    if(gLastClient)
    {
        delete gLastClient;
        gLastClient = nullptr;
        return true;
    }
    return false;
}

void dTelepath::gateCall(dLiteral hostname, TeleGateClientP* client, onMarkInCB cb)
{
    if(client->gate().isConnected())
    {
        dBinary NewBinary = client->gate().recvBinary();
        if(0 < NewBinary.length())
        {
            const dZokeReader NewReader(NewBinary);
            auto Type = NewReader("type").getString();
            auto ID = NewReader("id").getInt32();

            if(auto CurClient = client->linkedClient(ID))
            {
                if(!strcmp(Type, "connected"))
                {
                    auto IP = NewReader("address")("ip4").getString();
                    auto Port = NewReader("address")("port").getUint16();
                    CurClient->connectTo(IP, Port);
                }
                else if(!strcmp(Type, "disconnected"))
                    CurClient->disconnect();
            }
        }
    }
    else if(client->gate().connectTo(hostname.buildNative(), 11019))
    {
        client->sendToGate_Node(cb);
        client->sendToGate_AddAllSilks();
    }
}

bool dTelepath::nextReceive(TeleGateClientP* client)
{
    return client->nextReceiveForAllSilks();
}

} // namespace Daddy
