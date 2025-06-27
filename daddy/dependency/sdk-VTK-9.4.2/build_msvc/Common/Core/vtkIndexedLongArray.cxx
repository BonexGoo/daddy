// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkIndexedLongArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkIndexedLongArray);
vtkStandardExtendedNewMacro(vtkIndexedLongArray);

//------------------------------------------------------------------------------
vtkIndexedLongArray::vtkIndexedLongArray() = default;

//------------------------------------------------------------------------------
vtkIndexedLongArray::~vtkIndexedLongArray() = default;

//------------------------------------------------------------------------------
void vtkIndexedLongArray::ConstructBackend(vtkIdList* indexes, vtkDataArray* array)
{
  this->RealSuperclass::ConstructBackend(indexes, array);
}

//------------------------------------------------------------------------------
void vtkIndexedLongArray::ConstructBackend(vtkDataArray* indexes, vtkDataArray* array)
{
  this->RealSuperclass::ConstructBackend(indexes, array);
}

//------------------------------------------------------------------------------
void vtkIndexedLongArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
