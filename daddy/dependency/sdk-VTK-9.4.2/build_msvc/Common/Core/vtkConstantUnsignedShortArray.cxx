// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkConstantUnsignedShortArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkConstantUnsignedShortArray);
vtkStandardExtendedNewMacro(vtkConstantUnsignedShortArray);

//------------------------------------------------------------------------------
vtkConstantUnsignedShortArray::vtkConstantUnsignedShortArray() = default;

//------------------------------------------------------------------------------
vtkConstantUnsignedShortArray::~vtkConstantUnsignedShortArray() = default;

//------------------------------------------------------------------------------
void vtkConstantUnsignedShortArray::ConstructBackend(unsigned short value)
{
  this->RealSuperclass::ConstructBackend(value);
}

//------------------------------------------------------------------------------
void vtkConstantUnsignedShortArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
