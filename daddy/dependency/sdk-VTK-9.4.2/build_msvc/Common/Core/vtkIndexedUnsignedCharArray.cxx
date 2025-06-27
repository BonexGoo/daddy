// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkIndexedUnsignedCharArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkIndexedUnsignedCharArray);
vtkStandardExtendedNewMacro(vtkIndexedUnsignedCharArray);

//------------------------------------------------------------------------------
vtkIndexedUnsignedCharArray::vtkIndexedUnsignedCharArray() = default;

//------------------------------------------------------------------------------
vtkIndexedUnsignedCharArray::~vtkIndexedUnsignedCharArray() = default;

//------------------------------------------------------------------------------
void vtkIndexedUnsignedCharArray::ConstructBackend(vtkIdList* indexes, vtkDataArray* array)
{
  this->RealSuperclass::ConstructBackend(indexes, array);
}

//------------------------------------------------------------------------------
void vtkIndexedUnsignedCharArray::ConstructBackend(vtkDataArray* indexes, vtkDataArray* array)
{
  this->RealSuperclass::ConstructBackend(indexes, array);
}

//------------------------------------------------------------------------------
void vtkIndexedUnsignedCharArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
