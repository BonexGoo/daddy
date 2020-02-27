/// @brief     Definition of escaper class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_escaper.hpp"

// Dependencies
#include <chrono>
#include <cstdio>

namespace Daddy {

DD_global auto gNowFirst = std::chrono::high_resolution_clock::now();
static int64_t GetCounter__()
{
    auto Now = std::chrono::high_resolution_clock::now();
    return std::chrono::duration_cast<std::chrono::nanoseconds>(Now - gNowFirst).count();
}

class EscapePlanP
{
public:
    EscapePlanP(const EscapePlanP* super, utf8s name, uint32_t size, utf8s file, uint32_t line)
        : mSuper(super), mClass{name, size}, mCode{file, line}
    {
        mCB.Init = nullptr;
        mCB.Quit = nullptr;
        mCB.Move = nullptr;
        mCB.Copy = nullptr;
        mCallCount.Init = 0;
        mCallCount.Quit = 0;
        mCallCount.Move = 0;
        mCallCount.Copy = 0;
        mCallTime.Init = 0;
        mCallTime.Quit = 0;
        mCallTime.Move = 0;
        mCallTime.Copy = 0;
        mNext = nullptr;
    }
    ~EscapePlanP()
    {
        #ifdef DD_ENABLE_TRACE
            if(mSuper == (const EscapePlanP*) 1) // DD_escaper_alone
            {
                printf("\nclass %s (%d bytes, %s, %dLn)\n",
                    mClass.Name, mClass.Size, mCode.File, mCode.Line);
                printf("   _init_ : total %.03lfms, %d calls\n", mCallTime.Init * 0.000001, mCallCount.Init);
                printf("   _quit_ : total %.03lfms, %d calls\n", mCallTime.Quit * 0.000001, mCallCount.Quit);
                printf("   _move_ : total %.03lfms, %d calls\n", mCallTime.Move * 0.000001, mCallCount.Move);
                printf("   _copy_ : total %.03lfms, %d calls\n", mCallTime.Copy * 0.000001, mCallCount.Copy);
            }
            else if(mSuper)
            {
                printf("\nclass %s : public %s (%d bytes, %s, %dLn)\n",
                    mClass.Name, mSuper->mClass.Name, mClass.Size, mCode.File, mCode.Line);
                printf("   _init_ : total %.03lfms, %d calls\n", mCallTime.Init * 0.000001, mCallCount.Init);
                printf("   _quit_ : total %.03lfms, %d calls\n", mCallTime.Quit * 0.000001, mCallCount.Quit);
                printf("   _move_ : total %.03lfms, %d calls\n", mCallTime.Move * 0.000001, mCallCount.Move);
                printf("   _copy_ : total %.03lfms, %d calls\n", mCallTime.Copy * 0.000001, mCallCount.Copy);
            }
        #endif

        auto RemInfo = mNext;
        while(RemInfo)
        {
            auto NextInfo = RemInfo->mNext;
            RemInfo->mNext = nullptr;
            delete RemInfo;
            RemInfo = NextInfo;
        }
    }

public:
    const EscapePlanP* mSuper;
    EscapePlanP* mNext;
    const struct
    {
        utf8s Name;
        uint32_t Size;
    } mClass;
    const struct
    {
        utf8s File;
        uint32_t Line;
    } mCode;
    struct
    {
        EscapeModel::InitCB Init;
        EscapeModel::QuitCB Quit;
        EscapeModel::MoveCB Move;
        EscapeModel::CopyCB Copy;
    } mCB;
    union
    {
        struct
        {
            uint32_t Init;
            uint32_t Quit;
            uint32_t Move;
            uint32_t Copy;
        };
        uint32_t Func[4];
    } mCallCount;
    union
    {
        struct
        {
            int64_t Init;
            int64_t Quit;
            int64_t Move;
            int64_t Copy;
        };
        int64_t Func[4];
    } mCallTime;
};

// [CHALLENGES] 응용프로그램 종료시 모든 글로벌변수가 소멸된 이후에 gPlanFirst를 소멸하도록 해야됨
DD_global EscapePlanP* gPlanFirst = new EscapePlanP(nullptr, nullptr, 0, nullptr, 0);
EscapePlanP* EscapeModel::__em_create(const EscapePlanP* super, utf8s name, uint32_t size, utf8s file, uint32_t line, InitCB icb, QuitCB qcb, MoveCB mcb, CopyCB ccb)
{
    auto NewEP = new EscapePlanP(super, name, size, file, line);
    NewEP->mCB.Init = icb;
    NewEP->mCB.Quit = qcb;
    NewEP->mCB.Move = mcb;
    NewEP->mCB.Copy = ccb;

    NewEP->mNext = gPlanFirst->mNext;
    gPlanFirst->mNext = NewEP;
    return NewEP;
}

void EscapeModel::__em_release(EscapeModel* model, void* self)
{
    model->mRefEP->mCB.Quit(self);
}

int64_t EscapeModel::__em_enter(CycleType type)
{
    #ifdef DD_ENABLE_TRACE
        mRefEP->mCallCount.Func[(int32_t) type]++;
        return GetCounter__();
    #else
        return 0;
    #endif
}

void EscapeModel::__em_leave(CycleType type, int64_t timeNs)
{
    #ifdef DD_ENABLE_TRACE
        mRefEP->mCallTime.Func[(int32_t) type] += GetCounter__() - timeNs;
    #endif
}

void EscapeModel::__em_operatorMove(void* self, void* rhs)
{
    mRefEP->mCB.Quit(self);
    mRefEP->mCB.Move(self, rhs);
    mRefEP->mCB.Init(rhs, InitType::ClearOnly);
}

void EscapeModel::__em_operatorCopy(void* self, const void* rhs)
{
    mRefEP->mCB.Quit(self);
    mRefEP->mCB.Copy(self, rhs);
}

EscapeModel::EscapeModel(EscapePlanP* ep) : mRefEP(ep)
{
}

EscapeModel::~EscapeModel()
{
}

} // namespace Daddy
