/// @brief     Definition of vtk-canvas class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_vtk_canvas.hpp"

// Dependencies
#include <service/boss_zaywidget.hpp>
#include <QVTKOpenGLNativeWidget.h>
#include <vtkGenericOpenGLRenderWindow.h>
#include <vtkNamedColors.h>
#include <vtkRenderer.h>

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ VtkCanvasWidgetP
class VtkCanvasWidgetP : public QVTKOpenGLNativeWidget
{
public:
    VtkCanvasWidgetP(const dString& domheader);
    ~VtkCanvasWidgetP();

public:
    void updateVisible(bool show);

protected:
    void moveEvent(QMoveEvent* event) override;
    void resizeEvent(QResizeEvent* event) override;

private:
    const dString mDomHeader;
    int32_t mVisibled;
    vtkSmartPointer<vtkRenderer> mRenderer;
};

VtkCanvasWidgetP::VtkCanvasWidgetP(const dString& domheader) : mDomHeader(domheader)
{
    mVisibled = -1;
    mRenderer = vtkSmartPointer<vtkRenderer>::New();
    mRenderer->ResetCamera();

    auto BGColor = vtkSmartPointer<vtkNamedColors>::New();
    const unsigned char Red = Math::Random() * 255;
    const unsigned char Green = Math::Random() * 255;
    const unsigned char Blue = Math::Random() * 255;
    std::array<unsigned char, 4> bkg = {Red, Green, Blue, 255};
    BGColor->SetColor("BkgColor", bkg.data());
    mRenderer->SetBackground(BGColor->GetColor3d("BkgColor").GetData());

    auto Window = vtkSmartPointer<vtkGenericOpenGLRenderWindow>::New();
    Window->AddRenderer(mRenderer);
    setRenderWindow(Window.Get());
}

VtkCanvasWidgetP::~VtkCanvasWidgetP()
{
}

void VtkCanvasWidgetP::updateVisible(bool show)
{
    if(0 < mDomHeader.length() && mVisibled != show)
    {
        mVisibled = show;
        setVisible(show);
        ZayWidgetDOM::SetValue(dLiteral(mDomHeader + "visible").buildNative(), (mVisibled)? "1" : "0");
    }
}

void VtkCanvasWidgetP::moveEvent(QMoveEvent* event)
{
    ZayWidgetDOM::SetValue(dLiteral(mDomHeader + "pos.x").buildNative(), String::FromInteger(geometry().x()));
    ZayWidgetDOM::SetValue(dLiteral(mDomHeader + "pos.y").buildNative(), String::FromInteger(geometry().y()));
    QVTKOpenGLNativeWidget::moveEvent(event);
}

void VtkCanvasWidgetP::resizeEvent(QResizeEvent* event)
{
    ZayWidgetDOM::SetValue(dLiteral(mDomHeader + "size.cx").buildNative(), String::FromInteger(geometry().size().width()));
    ZayWidgetDOM::SetValue(dLiteral(mDomHeader + "size.cy").buildNative(), String::FromInteger(geometry().size().height()));
    QVTKOpenGLNativeWidget::resizeEvent(event);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ VtkCanvasAgentP
class VtkCanvasAgentP
{
public:
    void attach() const;
    void detach() const;

public:
    inline const dString& style() const {return mStyle;}
    inline const dString& channel() const {return mChannel;}
    inline const dString& color() const {return mColor;}
    inline VtkCanvasWidgetP* widget() {return mWidget;}

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
    dString mStyle;
    dString mChannel;
    dString mColor;
    VtkCanvasWidgetP* mWidget;
    mutable int32_t mRefCount;

public:
    DD_passage_alone(VtkCanvasAgentP, const dString& wid, const dString& style, const dString& channel, const dString& color)
    {
        mStyle = style;
        mChannel = channel;
        mColor = color;

        if(0 < wid.length())
        {
            auto DomHeader = dString::print("canvas.%.*s.", wid.length(), wid.string());
            ZayWidgetDOM::SetValue(dLiteral(DomHeader + "style").buildNative(),
                dLiteral("'" + mStyle + "'").buildNative());
            ZayWidgetDOM::SetValue(dLiteral(DomHeader + "channel").buildNative(),
                dLiteral("'" + mChannel + "'").buildNative());
            mWidget = new VtkCanvasWidgetP(DomHeader);
        }
        else mWidget = new VtkCanvasWidgetP("");
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

void VtkCanvasAgentP::detach() const
{
    if(--mRefCount == 0)
        delete this;
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
        mRefAgent->detach();
}

void dVtkCanvas::_move_(_self_&& rhs)
{
    mRefAgent = rhs.mRefAgent;
}

void dVtkCanvas::_copy_(const _self_& rhs)
{
    (mRefAgent = rhs.mRefAgent)->attach();
}

DD_passage_define_alone(dVtkCanvas, dString wid, dString style, dString channel, dString color)
{
    mRefAgent = new VtkCanvasAgentP(wid, style, channel, color);
}

} // namespace Daddy
