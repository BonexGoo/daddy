// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineUnsignedLongLongArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineUnsignedLongLongArray);
vtkStandardExtendedNewMacro(vtkAffineUnsignedLongLongArray);

//------------------------------------------------------------------------------
vtkAffineUnsignedLongLongArray::vtkAffineUnsignedLongLongArray() = default;

//------------------------------------------------------------------------------
vtkAffineUnsignedLongLongArray::~vtkAffineUnsignedLongLongArray() = default;

//------------------------------------------------------------------------------
void vtkAffineUnsignedLongLongArray::ConstructBackend(unsigned long long slope, unsigned long long intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineUnsignedLongLongArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
