/// @brief     Definition of vtk-canvas child class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include <daddy.hpp>
#include "dd_vtk_widget.hpp"
#include "../dd_vtk_volume.hpp"
#include <vtkActor.h>
#include <vtkVolume.h>

namespace Daddy {

/// @brief VTK캔버스 하위객체
class VtkWidgetVolumeP : public VtkWidgetP
{
public:
    VtkWidgetVolumeP(const dLiteral& domheader);
    ~VtkWidgetVolumeP() override;

public:
    void setDicom(ptr dicom) override;

private:
    vtkSmartPointer<vtkVolumeProperty> focusProperty(int value);
    vtkSmartPointer<vtkVolumeProperty> dataProperty(const dVtkVolume* volume);

private:
    vtkSmartPointer<vtkVolume> mVolume;
    vtkSmartPointer<vtkActor> mOutlineActor;
    vtkSmartPointer<vtkActor> mSliceTopActor;
    vtkSmartPointer<vtkActor> mSliceSideActor;
    vtkSmartPointer<vtkActor> mSliceFrontActor;
};

} // namespace Daddy
