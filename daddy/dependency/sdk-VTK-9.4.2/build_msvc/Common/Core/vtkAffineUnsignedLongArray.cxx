// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineUnsignedLongArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineUnsignedLongArray);
vtkStandardExtendedNewMacro(vtkAffineUnsignedLongArray);

//------------------------------------------------------------------------------
vtkAffineUnsignedLongArray::vtkAffineUnsignedLongArray() = default;

//------------------------------------------------------------------------------
vtkAffineUnsignedLongArray::~vtkAffineUnsignedLongArray() = default;

//------------------------------------------------------------------------------
void vtkAffineUnsignedLongArray::ConstructBackend(unsigned long slope, unsigned long intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineUnsignedLongArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
