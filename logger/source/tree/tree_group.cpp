#include <boss.hpp>
#include "tree_group.hpp"

#include <resource.hpp>
#include "tree_value.hpp"

TreeGroup::TreeGroup(TreeElement* parent) : TreeElement(parent, Type::Group)
{
    mIndexable = true;
    mExpanded = true;
}

TreeGroup::~TreeGroup()
{
    mChildren.AccessByCallback([](const MapPath* path, TreeElement** value, payload data)->void
    {
        if(value)
        {
            delete *value;
            *value = nullptr;
        }
    }, nullptr);
}

sint32 TreeGroup::OnRender(ZayPanel& panel, bool& needupdate, chars name) const
{
    sint32 Height = 0;
    const sint32 NameBoxWidth = 100;
    const sint32 IndexBoxWidth = 30;
    const sint32 TabSize = (name)? 40 : 0;
    needupdate |= CheckUpdate();

    if(name)
    {
        Height = 24;
        ZAY_XYWH_UI(panel, 0, 0, Math::Max(NameBoxWidth, Platform::Graphics::GetStringWidth(name) + 20), Height, uiname(),
            ZAY_GESTURE_T(t, this)
            {
                if(t == GT_Pressed)
                    mExpanded ^= true;
            })
        {
            ZAY_RGBA_IF(panel, 255, 255, 0, (panel.state(uiname()) & PS_Focused)? 255 : 128, mExpanded)
            ZAY_RGBA_IF(panel, 255, 128, 0, (panel.state(uiname()) & PS_Focused)? 255 : 128, !mExpanded)
                panel.fill();
            ZAY_RGB(panel, 0, 0, 0)
            {
                panel.text(name, UIFA_CenterMiddle, UIFE_Right);
                panel.rect(1);
            }

            // 업데이트수
            const sint32 ColorAni = 255 * GetUpdateAni();
            const sint32 AlphaAni = 128 + 127 * GetUpdateAni();
            ZAY_RGBA(panel, ColorAni, 0, 0, AlphaAni)
                panel.text(panel.w(), panel.h() / 2,
                    String::Format("  updated.%d", updatecount()), UIFA_LeftMiddle);
        }
        if(!mExpanded)
            return Height + 10;
        else Height += 1;
    }

    // Value
    const sint32 SavedY = Height;
    ZAY_RGBA_IF(panel, 128, 255, 255, 128, !mIndexable)
    ZAY_RGBA_IF(panel, 255, 128, 255, 128, mIndexable)
    for(sint32 i = 0, iend = mChildren.Count(); i < iend; ++i)
    {
        chararray GetName;
        if(auto CurChild = mChildren.AccessByOrder(i, &GetName))
        if((*CurChild)->type() == Type::Value)
            ZAY_MOVE(panel, TabSize, Height)
                Height += (*CurChild)->OnRender(panel, needupdate, &GetName[0]);
    }
    // Value외곽선
    if(SavedY < Height)
    {
        ZAY_LTRB(panel, TabSize, SavedY, TabSize + 100 + 200, Height - 1)
        ZAY_RGB(panel, 0, 0, 0)
            panel.rect(1);
        Height += 10 - 1;
    }
    else if(name)
        Height += 10 - 1;

    // Child그룹
    if(mIndexable)
    {
        for(sint32 i = 0, iend = mChildren.Count(); i < iend; ++i)
        {
            const String Index = String::FromInteger(i);
            if(auto CurChild = mChildren.Access(Index))
            if((*CurChild)->type() == Type::Group)
            {
                auto CurGroup = (const TreeGroup*) *CurChild;
                ZAY_MOVE(panel, TabSize + IndexBoxWidth, Height)
                {
                    const sint32 ChildHeight = CurGroup->OnRender(panel, needupdate);
                    Height += ChildHeight;
                    // 넘버링영역
                    ZAY_LTRB(panel, -5, -1, -3, ChildHeight - 10 + 1)
                    ZAY_RGB(panel, 0, 0, 0)
                        panel.fill();
                    // 넘버링
                    ZAY_LTRB(panel, -IndexBoxWidth, 0, -5, 16)
                    {
                        ZAY_RGBA(panel, 255, 0, 255, 128)
                            panel.fill();
                        ZAY_RGB(panel, 0, 0, 0)
                            panel.text(Index, UIFA_CenterMiddle, UIFE_Right);
                        ZAY_RGB(panel, 0, 0, 0)
                            panel.rect(1);
                    }
                }
            }
        }
    }
    else for(sint32 i = 0, iend = mChildren.Count(); i < iend; ++i)
    {
        chararray GetName;
        if(auto CurChild = mChildren.AccessByOrder(i, &GetName))
        if((*CurChild)->type() == Type::Group)
            ZAY_MOVE(panel, TabSize, Height)
                Height += (*CurChild)->OnRender(panel, needupdate, &GetName[0]);
    }
    return Height;
}

TreeValue* TreeGroup::operator()(chars name, bool forced)
{
    TreeGroup* CurGroup = this;
    for(chars iName = name; true; ++iName)
    {
        if(*iName == '\0' || *iName == '.')
        {
            auto& CurChild = CurGroup->mChildren(name, iName - name);
            // Indexable업데이트 : 하나라도 네임그룹명이 존재한다면 인덱스그룹이 아님
            CurGroup->mIndexable &= ('0' <= name[0] && name[0] <= '9');
            if(*iName == '\0')
            {
                if(!CurChild) CurChild = new TreeValue(CurGroup);
                else if(CurChild->type() != Type::Value)
                {
                    if(!forced) break;
                    delete CurChild;
                    CurChild = new TreeValue(CurGroup);
                }
                return (TreeValue*) CurChild;
            }
            else
            {
                if(!CurChild) CurChild = new TreeGroup(CurGroup);
                else if(CurChild->type() != Type::Group)
                {
                    if(!forced) break;
                    delete CurChild;
                    CurChild = new TreeGroup(CurGroup);
                }
                CurGroup = (TreeGroup*) CurChild;
                name = iName + 1;
            }
        }
    }
    return nullptr;
}

bool TreeGroup::Remove(chars name)
{
    TreeGroup* CurGroup = this;
    for(chars iName = name; true; ++iName)
    {
        if(*iName == '\0' || *iName == '.')
        {
            if(auto CurChild = CurGroup->mChildren(name, iName - name))
            {
                if(*iName == '\0')
                {
                    delete CurChild;
                    CurChild = nullptr;
                    return true;
                }
                else if(CurChild->type() == Type::Group)
                {
                    CurGroup = (TreeGroup*) CurChild;
                    name = iName + 1;
                }
                else break;
            }
            else break;
        }
    }
    return false;
}

bool TreeGroup::RemoveAll()
{
    bool Result = false;
    mChildren.AccessByCallback([](const MapPath* path, TreeElement** value, payload data)->void
    {
        if(value)
        {
            delete *value;
            *value = nullptr;
            *((bool*) data) = true;
        }
    }, &Result);
    mChildren.Reset();
    return Result;
}

bool TreeGroup::IsEmpty() const
{
    return (mChildren.Count() == 0);
}
