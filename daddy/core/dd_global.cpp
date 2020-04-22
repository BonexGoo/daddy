/// @brief     Definition of global utility.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_global.hpp"

// Dependencies
#if DD_OS_WINDOWS
#else
#endif

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ GlobalAgentP
class GlobalAgentP
{
public:
    GlobalAgentP(utf8s name, void* ptr) : mName(name), mPtr(ptr)
    {
        mAlived = false;
        mPrev = this;
        mNext = this;
    }
    ~GlobalAgentP()
    {
        GlobalAgentP* CurGlobal = mNext;
        while(CurGlobal && CurGlobal != this)
        {
            GlobalAgentP* NextGlobal = CurGlobal->mNext;
            CurGlobal->mNext = nullptr;
            delete CurGlobal;
            CurGlobal = NextGlobal;
        }
    }

public:
    utf8s const mName;
    void* const mPtr;
    dGlobal::Constructor mConstructor;
    dGlobal::Destructor mDestructor;
    bool mAlived;
    GlobalAgentP* mPrev;
    GlobalAgentP* mNext;
};

static GlobalAgentP gGlobalFirst("", nullptr);

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dGlobal
void* dGlobal::loadAttach(utf8s name, void* ptr, Constructor ccb, Destructor dcb)
{
    GlobalAgentP* NewGlobal = new GlobalAgentP(name, ptr);
    NewGlobal->mConstructor = ccb;
    NewGlobal->mDestructor = dcb;

    NewGlobal->mNext = &gGlobalFirst;
    NewGlobal->mPrev = gGlobalFirst.mPrev;
    gGlobalFirst.mPrev->mNext = NewGlobal;
    gGlobalFirst.mPrev = NewGlobal;
    return ptr;
}

void* dGlobal::loadDirect(void* ptr, Constructor ccb, Destructor dcb)
{
    loadAttach("", ptr, ccb, dcb);
    gGlobalFirst.mPrev->mAlived = true;
    gGlobalFirst.mPrev->mConstructor(gGlobalFirst.mPrev->mPtr);
    return ptr;
}

void dGlobal::setDependency(utf8s nameFirst, utf8s nameLater)
{
    for(GlobalAgentP* iLater = gGlobalFirst.mNext; iLater != &gGlobalFirst; iLater = iLater->mNext)
    {
        if(!strcmp(iLater->mName, nameLater))
        {
            for(GlobalAgentP* iFirst = iLater->mNext; iFirst != &gGlobalFirst; iFirst = iFirst->mNext)
            {
                // iLater보다 후방에 있는 iFirst를 발견
                if(!strcmp(iFirst->mName, nameFirst))
                {
                    // iFirst를 축출
                    GlobalAgentP* FirstPrev = iFirst->mPrev;
                    GlobalAgentP* FirstNext = iFirst->mNext;
                    FirstPrev->mNext = FirstNext;
                    FirstNext->mPrev = FirstPrev;
                    // iLater앞에 iFirst를 연결
                    GlobalAgentP* LaterPrev = iLater->mPrev;
                    iFirst->mPrev = LaterPrev;
                    iFirst->mNext = iLater;
                    LaterPrev->mNext = iFirst;
                    iLater->mPrev = iFirst;
                    break;
                }
            }
            break;
        }
    }
}

void dGlobal::load()
{
    setDependency("gPlanFirst", "gStringPool");
    for(GlobalAgentP* iGlobal = gGlobalFirst.mNext; iGlobal != &gGlobalFirst; iGlobal = iGlobal->mNext)
    {
        if(!iGlobal->mAlived)
        {
            iGlobal->mAlived = true;
            iGlobal->mConstructor(iGlobal->mPtr);
        }
    }
}

void dGlobal::release()
{
    for(GlobalAgentP* iGlobal = gGlobalFirst.mPrev; iGlobal != &gGlobalFirst; iGlobal = iGlobal->mPrev)
    {
        if(iGlobal->mAlived)
        {
            iGlobal->mAlived = false;
            iGlobal->mDestructor(iGlobal->mPtr);
        }
    }
}

} // namespace Daddy
