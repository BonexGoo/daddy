// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkConstantUnsignedLongLongArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkConstantUnsignedLongLongArray);
vtkStandardExtendedNewMacro(vtkConstantUnsignedLongLongArray);

//------------------------------------------------------------------------------
vtkConstantUnsignedLongLongArray::vtkConstantUnsignedLongLongArray() = default;

//------------------------------------------------------------------------------
vtkConstantUnsignedLongLongArray::~vtkConstantUnsignedLongLongArray() = default;

//------------------------------------------------------------------------------
void vtkConstantUnsignedLongLongArray::ConstructBackend(unsigned long long value)
{
  this->RealSuperclass::ConstructBackend(value);
}

//------------------------------------------------------------------------------
void vtkConstantUnsignedLongLongArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
