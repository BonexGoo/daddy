/// @brief     Definition of vtk-canvas class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_vtk_canvas.hpp"

// Dependencies
#include <service/boss_zaywidget.hpp>
#include <volume.hpp>
#include <QVTKOpenGLNativeWidget.h>
#include <vtkAlgorithmOutput.h>
#include <vtkDICOMReader.h>
#include <vtkGenericOpenGLRenderWindow.h>
#include <vtkNamedColors.h>
#include <vtkRenderer.h>

// VtkCanvasVolumeP
#include <vtkActor.h>
#include <vtkCamera.h>
#include <vtkColorTransferFunction.h>
#include <vtkOpenGLGPUVolumeRayCastMapper.h>
#include <vtkOutlineFilter.h>
#include <vtkPiecewiseFunction.h>
#include <vtkPolyDataMapper.h>
#include <vtkProperty.h>
#include <vtkRegularPolygonSource.h>
#include <vtkVolume.h>
#include <vtkVolumeProperty.h>

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ VtkCanvasWidgetP
class VtkCanvasWidgetP : public QVTKOpenGLNativeWidget
{
public:
    VtkCanvasWidgetP(const dString& domheader);
    virtual ~VtkCanvasWidgetP();

public:
    virtual void setDicom(vtkAlgorithmOutput* output) = 0;
    void updateVisible(bool show);
    void repaint();

protected:
    void moveEvent(QMoveEvent* event) override;
    void resizeEvent(QResizeEvent* event) override;

protected:
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

void VtkCanvasWidgetP::repaint()
{
    interactor()->Render();
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
// ■ VtkCanvasVolumeP
class VtkCanvasVolumeP : public VtkCanvasWidgetP
{
public:
    VtkCanvasVolumeP(const dString& domheader);
    ~VtkCanvasVolumeP() override;

public:
    void setDicom(vtkAlgorithmOutput* output) override;

private:
    vtkSmartPointer<vtkVolumeProperty> focusProperty(int value);
    vtkSmartPointer<vtkVolumeProperty> dataProperty(const VolumeData* data);

private:
    vtkSmartPointer<vtkVolume> mVolume;
    vtkSmartPointer<vtkActor> mOutlineActor;
    vtkSmartPointer<vtkActor> mSliceTopActor;
    vtkSmartPointer<vtkActor> mSliceSideActor;
    vtkSmartPointer<vtkActor> mSliceFrontActor;
};

VtkCanvasVolumeP::VtkCanvasVolumeP(const dString& domheader) : VtkCanvasWidgetP(domheader)
{
    mVolume = vtkSmartPointer<vtkVolume>::New();
    mVolume->SetProperty(dataProperty(nullptr));
    mRenderer->AddViewProp(mVolume);
}

VtkCanvasVolumeP::~VtkCanvasVolumeP()
{
}

void VtkCanvasVolumeP::setDicom(vtkAlgorithmOutput* output)
{
    auto Mapper = vtkSmartPointer<vtkOpenGLGPUVolumeRayCastMapper>::New();
    Mapper->SetInputConnection(output);
    mVolume->SetMapper(Mapper);

    if(auto OneCamera = mRenderer->GetActiveCamera())
    {
        auto Center = mVolume->GetCenter();
        OneCamera->SetFocalPoint(Center[0], Center[1], Center[2]);
        OneCamera->SetPosition(Center[0], Center[1] - 400, Center[2]);
        OneCamera->SetViewUp(0, 0, 1);
        OneCamera->SetClippingRange(0.001, 1000.0);
    }

    // Outline
    if(auto OldOutline = mOutlineActor.Get())
        mRenderer->RemoveActor(OldOutline);
    auto Outline = vtkSmartPointer<vtkOutlineFilter>::New();
    Outline->SetInputConnection(output);
    auto OutlineMapper = vtkSmartPointer<vtkPolyDataMapper>::New();
    OutlineMapper->SetInputConnection(Outline->GetOutputPort());
    mOutlineActor = vtkSmartPointer<vtkActor>::New();
    mOutlineActor->SetMapper(OutlineMapper);
    mOutlineActor->GetProperty()->SetColor(0.0, 1.0, 0.0);
    mRenderer->AddActor(mOutlineActor);

    // Slice
    vtkSmartPointer<vtkActor>* SliceActors[3] = {&mSliceTopActor, &mSliceSideActor, &mSliceFrontActor};
    for(int i = 0; i < 3; ++i)
    {
        auto Bounds = mVolume->GetBounds();
        auto Center = mVolume->GetCenter();
        auto Polygon = vtkSmartPointer<vtkRegularPolygonSource>::New();
        Polygon->GeneratePolygonOn();
        Polygon->SetNumberOfSides(50);
        Polygon->SetRadius((Bounds[3] - Bounds[0]) / 2);
        Polygon->SetCenter(Center[0], Center[1], Center[2]);
        Polygon->SetNormal((i == 1)? 1.0 : 0.0, (i == 2)? 1.0 : 0.0, (i == 0)? 1.0 : 0.0);
        auto Mapper = vtkSmartPointer<vtkPolyDataMapper>::New();
        Mapper->SetInputConnection(Polygon->GetOutputPort());
        *SliceActors[i] = vtkSmartPointer<vtkActor>::New();
        (*SliceActors[i])->SetMapper(Mapper.Get());
        (*SliceActors[i])->GetProperty()->SetColor(0.0, 1.0, 0.0);
        (*SliceActors[i])->VisibilityOff();
        mRenderer->AddActor(*SliceActors[i]);
    }
    repaint();
}

vtkSmartPointer<vtkVolumeProperty> VtkCanvasVolumeP::focusProperty(int value)
{
    const double XRayRadius = VolumeData::GetGraphRadius();
    auto Color = vtkSmartPointer<vtkColorTransferFunction>::New();
    Color->AddRGBPoint(value - XRayRadius - 1, 0.0, 0.0, 0.0);
    Color->AddRGBPoint(value - XRayRadius, 1.0, 1.0, 0.0);
    Color->AddRGBPoint(value + XRayRadius, 1.0, 1.0, 0.0);
    Color->AddRGBPoint(value + XRayRadius + 1, 0.0, 0.0, 0.0);

    auto Scalar = vtkSmartPointer<vtkPiecewiseFunction>::New();
    Scalar->AddPoint(value - XRayRadius - 1, 0.0);
    Scalar->AddPoint(value - XRayRadius, 1.0);
    Scalar->AddPoint(value + XRayRadius, 1.0);
    Scalar->AddPoint(value + XRayRadius + 1, 0.0);

    auto Gradient = vtkSmartPointer<vtkPiecewiseFunction>::New();
    Gradient->AddPoint(value - XRayRadius - 1, 0.0);
    Gradient->AddPoint(value - XRayRadius, 1.0);
    Gradient->AddPoint(value + XRayRadius, 1.0);
    Gradient->AddPoint(value + XRayRadius + 1, 0.0);

    auto Property = vtkSmartPointer<vtkVolumeProperty>::New();
    Property->SetColor(Color);
    Property->SetScalarOpacity(Scalar);
    Property->SetGradientOpacity(Gradient);
    Property->SetInterpolationTypeToLinear();
    Property->ShadeOn();
    Property->SetAmbient(0.1);
    Property->SetDiffuse(1.0);
    Property->SetSpecular(0.3);
    return Property;
}

vtkSmartPointer<vtkVolumeProperty> VtkCanvasVolumeP::dataProperty(const VolumeData* data)
{
    auto Color = vtkSmartPointer<vtkColorTransferFunction>::New();
    auto Scalar = vtkSmartPointer<vtkPiecewiseFunction>::New();
    auto Gradient = vtkSmartPointer<vtkPiecewiseFunction>::New();
    Color->AddRGBPoint(0, 0.0, 0.0, 0.0);
    Scalar->AddPoint(0, 0.0);
    Gradient->AddPoint(0, 0.0);

    if(!data || data->GetElementCount() == 0)
    {
        Color->AddRGBPoint(180, 0.3, 0.1, 0.2);
        Color->AddRGBPoint(1000, 1.0, 0.7, 0.6);
        Color->AddRGBPoint(2000, 1.0, 1.0, 0.9);
        Scalar->AddPoint(180, 0.0);
        Scalar->AddPoint(1000, 0.2);
        Scalar->AddPoint(2000, 0.8);
        Gradient->AddPoint(90, 0.5);
        Gradient->AddPoint(100, 1.0);
    }
    else for(int i = 0, iend = data->GetElementCount(); i < iend; ++i)
    {
        auto CurElement = data->GetElement(i);
        for(int j = CurElement->mMin; j <= CurElement->mMax; j += CurElement->mMax - CurElement->mMin)
        {
            Color->AddRGBPoint(j, CurElement->mColorR / 255.0, CurElement->mColorG / 255.0, CurElement->mColorB / 255.0);
            Scalar->AddPoint(j, CurElement->mOpacityScalar);
            Gradient->AddPoint(j, CurElement->mOpacityGradient);
        }
    }

    auto Property = vtkSmartPointer<vtkVolumeProperty>::New();
    Property->SetColor(Color);
    Property->SetScalarOpacity(Scalar);
    Property->SetGradientOpacity(Gradient);
    Property->SetInterpolationTypeToLinear();
    Property->ShadeOn();
    Property->SetAmbient(0.1);
    Property->SetDiffuse(1.0);
    Property->SetSpecular(0.3);
    return Property;
}

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
    inline VtkCanvasWidgetP* widget() {return mWidget;}

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
    VtkCanvasWidgetP* mWidget;
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
            ZayWidgetDOM::SetValue(dLiteral(DomHeader + "style").buildNative(),
                dLiteral("'" + mStyle + "'").buildNative());
            ZayWidgetDOM::SetValue(dLiteral(DomHeader + "channel").buildNative(),
                dLiteral("'" + mChannel + "'").buildNative());
            mWidget = new VtkCanvasVolumeP(DomHeader);
        }
        else mWidget = new VtkCanvasVolumeP("");
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
    if(auto Reader = static_cast<vtkDICOMReader*>(dicom))
        mRefAgent->widget()->setDicom(Reader->GetOutputPort());
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
