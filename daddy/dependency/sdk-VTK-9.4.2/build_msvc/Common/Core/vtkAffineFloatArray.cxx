// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineFloatArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineFloatArray);
vtkStandardExtendedNewMacro(vtkAffineFloatArray);

//------------------------------------------------------------------------------
vtkAffineFloatArray::vtkAffineFloatArray() = default;

//------------------------------------------------------------------------------
vtkAffineFloatArray::~vtkAffineFloatArray() = default;

//------------------------------------------------------------------------------
void vtkAffineFloatArray::ConstructBackend(float slope, float intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineFloatArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
