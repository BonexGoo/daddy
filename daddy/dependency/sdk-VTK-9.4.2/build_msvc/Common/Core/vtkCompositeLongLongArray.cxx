// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkCompositeLongLongArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkCompositeLongLongArray);
vtkStandardExtendedNewMacro(vtkCompositeLongLongArray);

//------------------------------------------------------------------------------
vtkCompositeLongLongArray::vtkCompositeLongLongArray() = default;

//------------------------------------------------------------------------------
vtkCompositeLongLongArray::~vtkCompositeLongLongArray() = default;

//------------------------------------------------------------------------------
void vtkCompositeLongLongArray::ConstructBackend(vtkDataArrayCollection* arrays)
{
  this->RealSuperclass::ConstructBackend(arrays);
}

//------------------------------------------------------------------------------
void vtkCompositeLongLongArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
