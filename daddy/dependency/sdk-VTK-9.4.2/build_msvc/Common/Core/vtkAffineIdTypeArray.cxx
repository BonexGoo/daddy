// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineIdTypeArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineIdTypeArray);
vtkStandardExtendedNewMacro(vtkAffineIdTypeArray);

//------------------------------------------------------------------------------
vtkAffineIdTypeArray::vtkAffineIdTypeArray() = default;

//------------------------------------------------------------------------------
vtkAffineIdTypeArray::~vtkAffineIdTypeArray() = default;

//------------------------------------------------------------------------------
void vtkAffineIdTypeArray::ConstructBackend(vtkIdType slope, vtkIdType intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineIdTypeArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
