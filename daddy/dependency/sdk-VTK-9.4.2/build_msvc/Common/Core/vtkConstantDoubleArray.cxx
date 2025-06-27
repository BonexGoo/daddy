// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkConstantDoubleArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkConstantDoubleArray);
vtkStandardExtendedNewMacro(vtkConstantDoubleArray);

//------------------------------------------------------------------------------
vtkConstantDoubleArray::vtkConstantDoubleArray() = default;

//------------------------------------------------------------------------------
vtkConstantDoubleArray::~vtkConstantDoubleArray() = default;

//------------------------------------------------------------------------------
void vtkConstantDoubleArray::ConstructBackend(double value)
{
  this->RealSuperclass::ConstructBackend(value);
}

//------------------------------------------------------------------------------
void vtkConstantDoubleArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
