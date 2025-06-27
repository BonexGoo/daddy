// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkCompositeUnsignedIntArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkCompositeUnsignedIntArray);
vtkStandardExtendedNewMacro(vtkCompositeUnsignedIntArray);

//------------------------------------------------------------------------------
vtkCompositeUnsignedIntArray::vtkCompositeUnsignedIntArray() = default;

//------------------------------------------------------------------------------
vtkCompositeUnsignedIntArray::~vtkCompositeUnsignedIntArray() = default;

//------------------------------------------------------------------------------
void vtkCompositeUnsignedIntArray::ConstructBackend(vtkDataArrayCollection* arrays)
{
  this->RealSuperclass::ConstructBackend(arrays);
}

//------------------------------------------------------------------------------
void vtkCompositeUnsignedIntArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
