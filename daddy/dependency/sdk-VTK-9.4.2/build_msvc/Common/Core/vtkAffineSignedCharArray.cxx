// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineSignedCharArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineSignedCharArray);
vtkStandardExtendedNewMacro(vtkAffineSignedCharArray);

//------------------------------------------------------------------------------
vtkAffineSignedCharArray::vtkAffineSignedCharArray() = default;

//------------------------------------------------------------------------------
vtkAffineSignedCharArray::~vtkAffineSignedCharArray() = default;

//------------------------------------------------------------------------------
void vtkAffineSignedCharArray::ConstructBackend(signed char slope, signed char intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineSignedCharArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
