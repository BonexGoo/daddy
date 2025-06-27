// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineUnsignedCharArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineUnsignedCharArray);
vtkStandardExtendedNewMacro(vtkAffineUnsignedCharArray);

//------------------------------------------------------------------------------
vtkAffineUnsignedCharArray::vtkAffineUnsignedCharArray() = default;

//------------------------------------------------------------------------------
vtkAffineUnsignedCharArray::~vtkAffineUnsignedCharArray() = default;

//------------------------------------------------------------------------------
void vtkAffineUnsignedCharArray::ConstructBackend(unsigned char slope, unsigned char intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineUnsignedCharArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
