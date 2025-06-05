/// @brief     Definition of vtk-canvas class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_vtk_canvas.hpp"

// Dependencies
#include "canvas_desktop/dd_vtk_widget_slice.hpp"
#include "canvas_desktop/dd_vtk_widget_volume.hpp"

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ VtkCanvasAgentP
class VtkCanvasAgentP
{
public:
    void attach() const;
    bool detach() const;

public:
    inline const std::string& wid() const {return mWID;}
    inline const dString& style() const {return mStyle;}
    inline const dString& channel() const {return mChannel;}
    inline const dString& color() const {return mColor;}
    inline VtkWidgetP* widget() {return mWidget;}

public:
    typedef std::map<std::string, VtkCanvasAgentP*> CanvasAgentMap;
    static CanvasAgentMap& MAP() {DD_global_direct(CanvasAgentMap, _); return _;}

DD_escaper_alone(VtkCanvasAgentP):
    void _init_(InitType type)
    {
        mWidget = nullptr;
        mRefCount = 1;
    }
    void _quit_()
    {
        DD_assert(mRefCount == 0 || mRefCount == 1, "reference count does not match.");
        if(mRefCount == 1)
            delete mWidget;
    }
    void _move_(_self_&& rhs)
    {
        mWidget = DD_rvalue(rhs.mWidget);
        mRefCount = DD_rvalue(rhs.mRefCount);
    }
    void _copy_(const _self_& rhs)
    {
        DD_assert(false, "you have called an unused method.");
    }
    std::string mWID;
    dString mStyle;
    dString mChannel;
    dString mColor;
    VtkWidgetP* mWidget;
    mutable int32_t mRefCount;

public:
    DD_passage_alone(VtkCanvasAgentP, std::string wid, dLiteral style, dLiteral channel, dLiteral color)
    {
        mWID = wid;
        mStyle = style;
        mChannel = channel;
        mColor = color;

        if(0 < mWID.length())
        {
            auto DomHeader = dString::print("canvas.%s.", mWID.c_str());
            dExternalDom::set(DomHeader + "style", "'" + mStyle + "'");
            dExternalDom::set(DomHeader + "channel", "'" + mChannel + "'");
            if(mStyle == "volume")
                mWidget = new VtkWidgetVolumeP(DomHeader);
            else
            {
                const std::string Test(mStyle.string(), mStyle.length());
                if(Test.find("_top") != std::string::npos)
                    mWidget = new VtkWidgetSliceP(DomHeader, "top");
                else if(Test.find("_side") != std::string::npos)
                    mWidget = new VtkWidgetSliceP(DomHeader, "side");
                else if(Test.find("_front") != std::string::npos)
                    mWidget = new VtkWidgetSliceP(DomHeader, "front");
                else mWidget = new VtkWidgetSliceP(DomHeader, "");
            }
        }
        else if(mStyle == "volume")
            mWidget = new VtkWidgetVolumeP("");
        else mWidget = new VtkWidgetSliceP("", "");
        mRefCount = 1;
        mWidget->updateVisible(false);
    }
};

DD_global("gLayoutMarginL", int32_t, gLayoutMarginL, 0);
DD_global("gLayoutMarginT", int32_t, gLayoutMarginT, 0);
DD_global("gLayoutMarginR", int32_t, gLayoutMarginR, 0);
DD_global("gLayoutMarginB", int32_t, gLayoutMarginB, 0);
DD_global("gCanvasSpacingX", int32_t, gCanvasSpacingX, 0);
DD_global("gCanvasSpacingY", int32_t, gCanvasSpacingY, 0);

void VtkCanvasAgentP::attach() const
{
    mRefCount++;
}

bool VtkCanvasAgentP::detach() const
{
    if(--mRefCount == 0)
    {
        delete this;
        return true;
    }
    return false;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dVtkCanvas
void dVtkCanvas::setParent(ptr parent)
{
    if(auto OneWidget = mRefAgent->widget())
        OneWidget->setParent((QWidget*) parent);
}

void dVtkCanvas::setGeometry(int32_t x, int32_t y, int32_t width, int32_t height)
{
    if(auto OneWidget = mRefAgent->widget())
        OneWidget->setGeometry(x, y, width, height);
}

void dVtkCanvas::setVisible(bool show)
{
    if(auto OneWidget = mRefAgent->widget())
        OneWidget->updateVisible(show);
}

void dVtkCanvas::addDelegate()
{
}

dString dVtkCanvas::style() const
{
    return mRefAgent->style();
}

dString dVtkCanvas::channel() const
{
    return mRefAgent->channel();
}

dString dVtkCanvas::color() const
{
    return mRefAgent->color();
}

void dVtkCanvas::setDicom(ptr dicom)
{
    mRefAgent->widget()->setDicom(dicom);
}

void dVtkCanvas::setLayoutMargin(int32_t left, int32_t top, int32_t right, int32_t bottom)
{
    gLayoutMarginL = left;
    gLayoutMarginT = top;
    gLayoutMarginR = right;
    gLayoutMarginB = bottom;
}

int32_t dVtkCanvas::layoutMarginL()
{
    return gLayoutMarginL;
}

int32_t dVtkCanvas::layoutMarginT()
{
    return gLayoutMarginT;
}

int32_t dVtkCanvas::layoutMarginR()
{
    return gLayoutMarginR;
}

int32_t dVtkCanvas::layoutMarginB()
{
    return gLayoutMarginB;
}

void dVtkCanvas::setCanvasSpacing(int32_t x, int32_t y)
{
    gCanvasSpacingX = x;
    gCanvasSpacingY = y;
}

int32_t dVtkCanvas::canvasSpacingX()
{
    return gCanvasSpacingX;
}

int32_t dVtkCanvas::canvasSpacingY()
{
    return gCanvasSpacingY;
}

void dVtkCanvas::passAll(PassCB cb)
{
    for(auto& it : VtkCanvasAgentP::MAP())
    {
        dVtkCanvas TempCanvas;
        TempCanvas.mRefAgent = it.second;
        cb(it.first.c_str(), TempCanvas);
        TempCanvas.mRefAgent = nullptr;
    }
}

const dVtkCanvas& dVtkCanvas::blank()
{DD_global_direct(dVtkCanvas, _, "", "", "", ""); return _;}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dVtkCanvas::escaper
void dVtkCanvas::_init_(InitType type)
{
    if(type == InitType::Create)
        (mRefAgent = blank().mRefAgent)->attach();
    else mRefAgent = nullptr;
}

void dVtkCanvas::_quit_()
{
    if(mRefAgent)
    {
        auto OldWID = mRefAgent->wid();
        if(mRefAgent->detach() && 0 < OldWID.length())
            VtkCanvasAgentP::MAP().erase(OldWID);
    }
}

void dVtkCanvas::_move_(_self_&& rhs)
{
    mRefAgent = rhs.mRefAgent;
}

void dVtkCanvas::_copy_(const _self_& rhs)
{
    (mRefAgent = rhs.mRefAgent)->attach();
}

DD_passage_define_alone(dVtkCanvas, dLiteral wid, dLiteral style, dLiteral channel, dLiteral color)
{
    std::string NewWID = wid.buildNative();
    if(VtkCanvasAgentP::MAP().find(NewWID) == VtkCanvasAgentP::MAP().end())
    {
        mRefAgent = new VtkCanvasAgentP(NewWID, style, channel, color);
        VtkCanvasAgentP::MAP()[NewWID] = mRefAgent;
    }
    else mRefAgent = nullptr;
}

} // namespace Daddy
