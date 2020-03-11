#pragma once
#include <daddy.hpp>
#include <service/boss_zay.hpp>

// Dependencies
#include <connector.hpp>
#include <webserver.hpp>

class Scheduler
{
    friend class WebPeer;

public:
    void MoveServerConnectors(float addx, float addy) const;
    bool OnRender(ZayPanel& panel);
    bool OnTick();
    bool OnSocketReceive();

private: // 스케줄서버
    void OnSchedulePacket(packettype type, sint32 peerid, bytes buffer, sint32 length);
    void SendCreateJob(sint32 jobid, chars batchjob, sint32 batchcount, chars redirect_url);

private: // 웹서버
    void OnHttpPacket(packettype type, sint32 peerid, bytes buffer, sint32 length);
    void OnHttp(sint32 peerid, chars url);
    void SendHttp(sint32 peerid, sint32 code, chars html, sint32 length);

public: // 개발전용
    void SetToast(chars text);
    void SetFlush(uint32 amount, bool all);

DD_escaper_alone(Scheduler):
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    Connector mConnector;
    mutable Point mPos;
    String mToast;
    bool mEnabled;
    float mButtonPos;
    id_server mScheduleServer;
    Map<sint32>* mSchedulePeers;
    id_server mHttpServer;
    Map<WebPeer>* mHttpPeers;
    Map<WebJob>* mJobs;
    sint32 mLastJobID;
    sint32 mAniValue;
};
