/// @brief     Definition of vtk-canvas class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_vtk_widget_volume.hpp"

// Dependencies
#include <vtkAlgorithmOutput.h>
#include <vtkCamera.h>
#include <vtkColorTransferFunction.h>
#include <vtkDICOMReader.h>
#include <vtkOpenGLGPUVolumeRayCastMapper.h>
#include <vtkOutlineFilter.h>
#include <vtkPiecewiseFunction.h>
#include <vtkPolyDataMapper.h>
#include <vtkProperty.h>
#include <vtkRegularPolygonSource.h>

namespace Daddy {

VtkWidgetVolumeP::VtkWidgetVolumeP(const dLiteral& domheader) : VtkWidgetP(domheader)
{
    mVolume = vtkSmartPointer<vtkVolume>::New();
    mVolume->SetProperty(dataProperty(nullptr));
    mRenderer->AddViewProp(mVolume);
}

VtkWidgetVolumeP::~VtkWidgetVolumeP()
{
}

void VtkWidgetVolumeP::setDicom(ptr dicom)
{
    if(auto Reader = static_cast<vtkDICOMReader*>(dicom))
    {
        auto Output = Reader->GetOutputPort();
        auto Mapper = vtkSmartPointer<vtkOpenGLGPUVolumeRayCastMapper>::New();
        Mapper->SetInputConnection(Output);
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
        Outline->SetInputConnection(Output);
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
}

vtkSmartPointer<vtkVolumeProperty> VtkWidgetVolumeP::focusProperty(int value)
{
    const double XRayRadius = dVtkVolume::getGraphRadius();
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

vtkSmartPointer<vtkVolumeProperty> VtkWidgetVolumeP::dataProperty(const dVtkVolume* volume)
{
    auto Color = vtkSmartPointer<vtkColorTransferFunction>::New();
    auto Scalar = vtkSmartPointer<vtkPiecewiseFunction>::New();
    auto Gradient = vtkSmartPointer<vtkPiecewiseFunction>::New();
    Color->AddRGBPoint(0, 0.0, 0.0, 0.0);
    Scalar->AddPoint(0, 0.0);
    Gradient->AddPoint(0, 0.0);

    if(!volume || volume->getElementCount() == 0)
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
    else for(int i = 0, iend = volume->getElementCount(); i < iend; ++i)
    {
        auto CurElement = volume->getElement(i);
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

} // namespace Daddy
