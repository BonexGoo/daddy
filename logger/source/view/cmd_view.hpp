#pragma once
#include <service/boss_zay.hpp>

class CmdView
{
public:
    CmdView();
    ~CmdView();

public:
    bool OnRender(ZayPanel& panel);
    void OnPacket(packettype type, sint32 peerid, bytes buffer);
    void AddLog(chars text, const Color color);

public:
    struct Log
    {
        sint32 mPeerID;
        String mText;
        Color mColor;
    };
    Log* GetLastLog(sint32 pos);

private:
    enum {mLogMax = 1024, mLogHeight = 20};
    id_mutex mMutex;
    Log mLogs[mLogMax];
    sint32 mLogFocus;
    sint32 mLogScroll;
    sint32 mLogScrollSmooth;
};
