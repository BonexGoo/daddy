// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkConstantIdTypeArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkConstantIdTypeArray);
vtkStandardExtendedNewMacro(vtkConstantIdTypeArray);

//------------------------------------------------------------------------------
vtkConstantIdTypeArray::vtkConstantIdTypeArray() = default;

//------------------------------------------------------------------------------
vtkConstantIdTypeArray::~vtkConstantIdTypeArray() = default;

//------------------------------------------------------------------------------
void vtkConstantIdTypeArray::ConstructBackend(vtkIdType value)
{
  this->RealSuperclass::ConstructBackend(value);
}

//------------------------------------------------------------------------------
void vtkConstantIdTypeArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
