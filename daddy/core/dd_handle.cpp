/// @brief     Definition of handle class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_handle.hpp"

// Dependencies
//

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ HandleAgentP
class HandleAgentP
{
public:
    void attach() const;
    void detach() const;
    void clear();

public:
    inline ptr_u handle() const {return mHandle;}

DD_escaper_alone(HandleAgentP):
    void _init_(InitType type)
    {
        mHandle = 0;
        mDestroyer = dHandle::defaultDestroyer();
        mRefCount = 1;
    }
    void _quit_()
    {
        if(mRefCount == 0)
            mDestroyer(mHandle);
    }
    void _move_(_self_&& rhs)
    {
        mHandle = DD_rvalue(rhs.mHandle);
        mDestroyer = DD_rvalue(rhs.mDestroyer);
        mRefCount = DD_rvalue(rhs.mRefCount);
    }
    void _copy_(const _self_& rhs)
    {
        DD_assert(false, "you have called an unused method.");
    }
    ptr_u mHandle;
    dHandle::Destroyer mDestroyer;
    mutable int32_t mRefCount;

public:
    DD_passage_alone(HandleAgentP, ptr_u handle, dHandle::Destroyer destroyer)
    {
        mHandle = handle;
        mDestroyer = destroyer;
        mRefCount = 1;
    }
};

void HandleAgentP::attach() const
{
    mRefCount++;
}

void HandleAgentP::detach() const
{
    if(--mRefCount == 0)
        delete this;
}

void HandleAgentP::clear()
{
    mDestroyer(mHandle);
    mHandle = 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dHandle
bool dHandle::isValid() const
{
    return (mRefAgent != blank().mRefAgent);
}

void dHandle::clear(bool forced)
{
    if(forced)
        mRefAgent->clear();
    _quit_();
    _init_(InitType::Create);
}

ptr_u dHandle::getHandle() const
{
    return mRefAgent->handle();
}

dHandle::Destroyer dHandle::defaultDestroyer()
{
    return [](ptr_u handle)->void {};
}

const dHandle& dHandle::blank()
{DD_global_direct(dHandle, _, 0, defaultDestroyer()); return _;}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dHandle::escaper
void dHandle::_init_(InitType type)
{
    if(type == InitType::Create)
        (mRefAgent = blank().mRefAgent)->attach();
    else mRefAgent = nullptr;
}

void dHandle::_quit_()
{
    if(mRefAgent)
        mRefAgent->detach();
}

void dHandle::_move_(_self_&& rhs)
{
    mRefAgent = rhs.mRefAgent;
}

void dHandle::_copy_(const _self_& rhs)
{
    (mRefAgent = rhs.mRefAgent)->attach();
}

DD_passage_define(dHandle, ptr_u handle, Destroyer destroyer)
{
    mRefAgent = new HandleAgentP(handle, destroyer);
}

} // namespace Daddy
