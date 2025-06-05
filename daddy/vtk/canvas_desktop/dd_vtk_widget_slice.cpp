/// @brief     Definition of vtk-canvas class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_vtk_widget_slice.hpp"

// Dependencies
#include <vtkCamera.h>
#include <vtkDICOMReader.h>
#include <vtkImageResliceMapper.h>

namespace Daddy {

VtkWidgetSliceP::VtkWidgetSliceP(const dLiteral& domheader, const dLiteral& mode)
    : VtkWidgetP(domheader), mMode(mode)
{
    mImageSlice = vtkSmartPointer<vtkImageSlice>::New();
    mImageSlice->SetProperty(dataProperty(nullptr));
    mRenderer->AddViewProp(mImageSlice);
}

VtkWidgetSliceP::~VtkWidgetSliceP()
{
}

void VtkWidgetSliceP::setDicom(ptr dicom)
{
    if(auto Reader = static_cast<vtkDICOMReader*>(dicom))
    {
        auto Output = Reader->GetOutputPort();
        auto Mapper = vtkSmartPointer<vtkImageResliceMapper>::New();
        Mapper->SetInputConnection(Output);
        Mapper->SliceFacesCameraOn();
        Mapper->SliceAtFocalPointOn();
        Mapper->BorderOff();
        mImageSlice->SetMapper(Mapper);

        if(auto OneCamera = mRenderer->GetActiveCamera())
        {
            auto Center = mImageSlice->GetCenter();
            OneCamera->SetFocalPoint(Center[0], Center[1], Center[2]);
            if(mMode == "top")
            {
                OneCamera->SetPosition(Center[0], Center[1], Center[2] + 400);
                OneCamera->SetViewUp(0, 1, 0);
            }
            else if(mMode == "side")
            {
                OneCamera->SetPosition(Center[0] - 400, Center[1], Center[2]);
                OneCamera->SetViewUp(0, 0, 1);
            }
            else if(mMode == "front" || true)
            {
                OneCamera->SetPosition(Center[0], Center[1] - 400, Center[2]);
                OneCamera->SetViewUp(0, 0, 1);
            }
            OneCamera->SetClippingRange(0.001, 1000.0);
        }
        repaint();
    }
}

vtkSmartPointer<vtkImageProperty> VtkWidgetSliceP::focusProperty(int value)
{
    auto Property = vtkSmartPointer<vtkImageProperty>::New();
    Property->SetColorWindow(2000);
    Property->SetColorLevel(1000);
    Property->SetInterpolationTypeToLinear();
    Property->SetAmbient(0.1);
    Property->SetDiffuse(1.0);
    Property->SetOpacity(0.3);
    return Property;
}

vtkSmartPointer<vtkImageProperty> VtkWidgetSliceP::dataProperty(const dVtkVolume* volume)
{
    auto Property = vtkSmartPointer<vtkImageProperty>::New();
    Property->SetColorWindow(2000);
    Property->SetColorLevel(1000);
    Property->SetInterpolationTypeToLinear();
    Property->SetAmbient(0.1);
    Property->SetDiffuse(1.0);
    Property->SetOpacity(1.3);
    return Property;
}

} // namespace Daddy
