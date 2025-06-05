/// @brief     Definition of vtk-canvas child class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include <daddy.hpp>
#include "dd_vtk_widget.hpp"
#include "../dd_vtk_volume.hpp"
#include <vtkImageProperty.h>
#include <vtkImageSlice.h>

namespace Daddy {

/// @brief VTK캔버스 하위객체
class VtkWidgetSliceP : public VtkWidgetP
{
public:
    VtkWidgetSliceP(const dLiteral& domheader, const dLiteral& mode);
    ~VtkWidgetSliceP() override;

public:
    void setDicom(ptr dicom) override;

private:
    vtkSmartPointer<vtkImageProperty> focusProperty(int value);
    vtkSmartPointer<vtkImageProperty> dataProperty(const dVtkVolume* volume);

private:
    const dString mMode;
    vtkSmartPointer<vtkImageSlice> mImageSlice;
};

} // namespace Daddy
