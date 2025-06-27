// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkConstantIntArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkConstantIntArray);
vtkStandardExtendedNewMacro(vtkConstantIntArray);

//------------------------------------------------------------------------------
vtkConstantIntArray::vtkConstantIntArray() = default;

//------------------------------------------------------------------------------
vtkConstantIntArray::~vtkConstantIntArray() = default;

//------------------------------------------------------------------------------
void vtkConstantIntArray::ConstructBackend(int value)
{
  this->RealSuperclass::ConstructBackend(value);
}

//------------------------------------------------------------------------------
void vtkConstantIntArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
