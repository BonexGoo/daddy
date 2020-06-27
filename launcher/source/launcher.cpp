#include <boss.hpp>
#include "launcher.hpp"

#include <resource.hpp>
#include <format/boss_bmp.hpp>
#include <format/boss_png.hpp>
#include <daddy.hpp>

ZAY_DECLARE_VIEW_CLASS("launcherView", launcherData)

ZAY_VIEW_API OnCommand(CommandType type, chars topic, id_share in, id_cloned_share* out)
{
}

ZAY_VIEW_API OnNotify(NotifyType type, chars topic, id_share in, id_cloned_share* out)
{
}

ZAY_VIEW_API OnGesture(GestureType type, sint32 x, sint32 y)
{
    if(type == GT_Pressed)
        m->hide();
}

ZAY_VIEW_API OnRender(ZayPanel& panel)
{
    // 배경색
    ZAY_RGB(panel, 255, 255, 255)
        panel.fill();

    // 앱뷰
    if(m->mAppView.Render(panel))
        m->invalidate(2);

    // 전체 마감선
    ZAY_INNER(panel, 2)
    ZAY_RGBA(panel, 0, 0, 0, 32)
        panel.rect(2);
}

launcherData::launcherData()
{
}

launcherData::~launcherData()
{
}
