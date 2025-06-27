// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkCompositeIdTypeArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkCompositeIdTypeArray);
vtkStandardExtendedNewMacro(vtkCompositeIdTypeArray);

//------------------------------------------------------------------------------
vtkCompositeIdTypeArray::vtkCompositeIdTypeArray() = default;

//------------------------------------------------------------------------------
vtkCompositeIdTypeArray::~vtkCompositeIdTypeArray() = default;

//------------------------------------------------------------------------------
void vtkCompositeIdTypeArray::ConstructBackend(vtkDataArrayCollection* arrays)
{
  this->RealSuperclass::ConstructBackend(arrays);
}

//------------------------------------------------------------------------------
void vtkCompositeIdTypeArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
