// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkConstantFloatArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkConstantFloatArray);
vtkStandardExtendedNewMacro(vtkConstantFloatArray);

//------------------------------------------------------------------------------
vtkConstantFloatArray::vtkConstantFloatArray() = default;

//------------------------------------------------------------------------------
vtkConstantFloatArray::~vtkConstantFloatArray() = default;

//------------------------------------------------------------------------------
void vtkConstantFloatArray::ConstructBackend(float value)
{
  this->RealSuperclass::ConstructBackend(value);
}

//------------------------------------------------------------------------------
void vtkConstantFloatArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
