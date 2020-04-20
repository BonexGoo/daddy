#include <boss.hpp>
#include "tree_view.hpp"

#include <resource.hpp>
#include <tree/tree_value.hpp>

TreeView::TreeView() : mTree(nullptr)
{
    mMutex = Mutex::Open();
    mContentSize = 0;
}

TreeView::~TreeView()
{
    Mutex::Close(mMutex);
}

bool TreeView::OnRender(ZayPanel& panel)
{
    // 배경
    ZAY_RGB(panel, 208, 216, 224)
        panel.fill();

    bool UpdateOnce = false;
    Mutex::Lock(mMutex);
    {
        ZAY_SCROLL_UI(panel, 0, mContentSize, "tree",
            ZAY_GESTURE_VNTXY(v, n, t, x, y)
            {
                static sint32 FirstY = 0;
                if(t == GT_Pressed)
                    FirstY = v->scrollpos(n).y - y;
                else if(t == GT_InDragging || t == GT_OutDragging)
                {
                    if(v->isScrollSensing(n))
                        FirstY = v->scrollpos(n).y - y;
                    const sint32 VectorY = (y - v->oldxy(n).y) * 20;
                    v->moveScroll(n, 0, FirstY + y, 0, FirstY + y + VectorY, 2.0, true);
                    v->invalidate(2);
                }
                else if(t == GT_WheelUp || t == GT_WheelDown)
                {
                    Platform::Popup::CloseAllTracker();
                    const sint32 OldPos = v->scrollpos(n).y;
                    const sint32 NewPos = OldPos + ((t == GT_WheelUp)? 300 : -300);
                    v->moveScroll(n, 0, OldPos, 0, NewPos, 1.0, true);
                    v->invalidate(2);
                }
            }, 5, 20)
        {
            sint32 PosY = 0;
            ZAY_MOVE(panel, 10, 10)
                PosY += mTree.OnRender(panel, UpdateOnce);
            // 스크롤 업데이트
            if(mContentSize != Math::Max(0, PosY + 10))
            {
                mContentSize = Math::Max(0, PosY + 10);
                UpdateOnce = true;
            }
        }

        // 클리어
        if(!mTree.IsEmpty())
        {
            ZAY_LTRB_UI(panel, panel.w() - 100 - 10, panel.h() - 26 - 10, panel.w() - 10, panel.h() - 10, "clear-dom",
                ZAY_GESTURE_T(t, this)
                {
                    if(t == GT_Pressed)
                    {
                        Mutex::Lock(mMutex);
                        {
                            mTree.RemoveAll();
                        }
                        Mutex::Unlock(mMutex);
                    }
                })
            {
                ZAY_RGBA(panel, 255, 192, 192, (panel.state("clear-dom") & PS_Focused)? 255 : 128)
                    panel.fill();
                ZAY_RGB(panel, 0, 0, 0)
                {
                    panel.text("Clear DOM");
                    ZAY_INNER(panel, 3)
                        panel.rect(1);
                }
            }
        }
    }
    Mutex::Unlock(mMutex);
    return UpdateOnce;
}

void TreeView::Update(chars name, chars value, bool addition)
{
    Mutex::Lock(mMutex);
    {
        if(TreeValue* CurValue = mTree(name, true))
        {
            if(addition)
                CurValue->Add(value);
            else CurValue->Set(value);
        }
    }
    Mutex::Unlock(mMutex);
}

void TreeView::Remove(chars name)
{
    Mutex::Lock(mMutex);
    {
        mTree.Remove(name);
    }
    Mutex::Unlock(mMutex);
}
