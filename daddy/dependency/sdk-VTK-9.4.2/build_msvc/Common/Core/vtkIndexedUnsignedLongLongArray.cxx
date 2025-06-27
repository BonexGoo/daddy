// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkIndexedUnsignedLongLongArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkIndexedUnsignedLongLongArray);
vtkStandardExtendedNewMacro(vtkIndexedUnsignedLongLongArray);

//------------------------------------------------------------------------------
vtkIndexedUnsignedLongLongArray::vtkIndexedUnsignedLongLongArray() = default;

//------------------------------------------------------------------------------
vtkIndexedUnsignedLongLongArray::~vtkIndexedUnsignedLongLongArray() = default;

//------------------------------------------------------------------------------
void vtkIndexedUnsignedLongLongArray::ConstructBackend(vtkIdList* indexes, vtkDataArray* array)
{
  this->RealSuperclass::ConstructBackend(indexes, array);
}

//------------------------------------------------------------------------------
void vtkIndexedUnsignedLongLongArray::ConstructBackend(vtkDataArray* indexes, vtkDataArray* array)
{
  this->RealSuperclass::ConstructBackend(indexes, array);
}

//------------------------------------------------------------------------------
void vtkIndexedUnsignedLongLongArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
