#include <boss.hpp>
#include "tree_value.hpp"

#include <resource.hpp>

TreeValue::TreeValue(TreeElement* parent) : TreeElement(parent, Type::Value)
{
}

TreeValue::~TreeValue()
{
}

sint32 TreeValue::OnRender(ZayPanel& panel, bool& needupdate, chars name) const
{
    sint32 Height = 24;
    const sint32 NameBoxWidth = 100;
    const sint32 ValueBoxWidth = 200;
    needupdate |= CheckUpdate();

    ZAY_XYWH(panel, 0, 0, NameBoxWidth + ValueBoxWidth, Height)
    {
        const String NameToolTip = (NameBoxWidth - 20 < Platform::Graphics::GetStringWidth(name))? name : "";
        ZAY_XYWH_UI(panel, 0, 0, NameBoxWidth, panel.h(), uiname() + "_a",
            ZAY_GESTURE_T(t, NameToolTip)
            {
                if(t == GT_ToolTip && 0 < NameToolTip.Length())
                    Platform::Popup::ShowToolTip(NameToolTip);
            })
        {
            ZAY_RGBA(panel, 128, 128, 128, 128)
                panel.fill();
            ZAY_RGB(panel, 0, 0, 0)
            ZAY_LTRB(panel, 10, 0, panel.w() - 10, panel.h())
                panel.text(name, UIFA_CenterMiddle, UIFE_Right);
        }

        const String ValueToolTip = (ValueBoxWidth - 20 < Platform::Graphics::GetStringWidth(mValue))? mValue : "";
        ZAY_XYWH_UI(panel, NameBoxWidth, 0, ValueBoxWidth, panel.h(), uiname() + "_b",
            ZAY_GESTURE_T(t, ValueToolTip)
            {
                if(t == GT_ToolTip && 0 < ValueToolTip.Length())
                    Platform::Popup::ShowToolTip(ValueToolTip);
            })
        {
            const sint32 ColorAni = 100 + 155 * (1 - GetUpdateAni());
            ZAY_RGBA(panel, -255, -ColorAni, -ColorAni, 128)
                panel.fill();
            ZAY_RGB(panel, 0, 0, 0)
            ZAY_LTRB(panel, 10, 0, panel.w() - 10, panel.h())
                panel.text(mValue, UIFA_LeftMiddle, UIFE_Right);
        }

        // 구분선
        ZAY_RGBA(panel, 0, 0, 0, 32)
        ZAY_XYWH(panel, 0, -1, panel.w(), 1)
            panel.fill();
    }
    return Height;
}

void TreeValue::Set(chars value)
{
    if(!!mValue.Compare(value))
    {
        mValue = value;
        Update();
    }
}

void TreeValue::Add(chars value)
{
    if(const sint64 Value = Parser::GetInt<sint64>(value))
    {
        mValue = String::FromInteger(Parser::GetInt<sint64>(mValue) + Value);
        Update();
    }
}
