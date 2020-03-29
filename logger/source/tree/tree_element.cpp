#include <boss.hpp>
#include "tree_element.hpp"

TreeElement::TreeElement(TreeElement* parent, Type type)
{
    mRefParent = parent;
    mType = type;

    static sint32 LastElementID = -1;
    mUIName = String::Format("tree.%d", ++LastElementID);
    mUpdateCount = 0;
    mUpdateAni = 0;
}

TreeElement::~TreeElement()
{
}

void TreeElement::Update()
{
    mUpdateCount++;
    mUpdateAni = UpdateAniMax;
    if(mRefParent)
        mRefParent->Update();
}

float TreeElement::GetUpdateAni() const
{
    return mUpdateAni / (float) UpdateAniMax;
}

bool TreeElement::CheckUpdate() const
{
    if(0 < mUpdateAni)
    {
        mUpdateAni--;
        return true;
    }
    return false;
}
