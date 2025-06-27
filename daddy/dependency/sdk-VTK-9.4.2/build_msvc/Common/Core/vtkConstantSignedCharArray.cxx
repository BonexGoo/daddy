// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkConstantSignedCharArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkConstantSignedCharArray);
vtkStandardExtendedNewMacro(vtkConstantSignedCharArray);

//------------------------------------------------------------------------------
vtkConstantSignedCharArray::vtkConstantSignedCharArray() = default;

//------------------------------------------------------------------------------
vtkConstantSignedCharArray::~vtkConstantSignedCharArray() = default;

//------------------------------------------------------------------------------
void vtkConstantSignedCharArray::ConstructBackend(signed char value)
{
  this->RealSuperclass::ConstructBackend(value);
}

//------------------------------------------------------------------------------
void vtkConstantSignedCharArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
