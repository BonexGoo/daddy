#pragma once
#include <daddy.hpp>
#include <service/boss_zay.hpp>

class Scheduler;

class WebPeer
{
public:
    void Init(sint32 peerid);
    void AddHttp(Scheduler* scheduler, bytes buffer, sint32 length);

DD_escaper_alone(WebPeer):
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    sint32 mPeerID;
    String mHttpDump;
};

class WebJob
{
public:
    bool Init(sint32 jobid, const Context& params);
    String ToHtml() const;
    bool UpdateJobPermil();

DD_escaper_alone(WebJob):
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    String mDeviceID;
    String mSApp;
    String mBatchJob;
    sint32 mBatchCount;
    String mRedirectUrl;
    sint32 mJobID;
    sint32 mLastJobPermil;
    id_socket mSocket;
};
