// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkConstantUnsignedIntArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkConstantUnsignedIntArray);
vtkStandardExtendedNewMacro(vtkConstantUnsignedIntArray);

//------------------------------------------------------------------------------
vtkConstantUnsignedIntArray::vtkConstantUnsignedIntArray() = default;

//------------------------------------------------------------------------------
vtkConstantUnsignedIntArray::~vtkConstantUnsignedIntArray() = default;

//------------------------------------------------------------------------------
void vtkConstantUnsignedIntArray::ConstructBackend(unsigned int value)
{
  this->RealSuperclass::ConstructBackend(value);
}

//------------------------------------------------------------------------------
void vtkConstantUnsignedIntArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
