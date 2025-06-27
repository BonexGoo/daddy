// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineDoubleArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineDoubleArray);
vtkStandardExtendedNewMacro(vtkAffineDoubleArray);

//------------------------------------------------------------------------------
vtkAffineDoubleArray::vtkAffineDoubleArray() = default;

//------------------------------------------------------------------------------
vtkAffineDoubleArray::~vtkAffineDoubleArray() = default;

//------------------------------------------------------------------------------
void vtkAffineDoubleArray::ConstructBackend(double slope, double intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineDoubleArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
