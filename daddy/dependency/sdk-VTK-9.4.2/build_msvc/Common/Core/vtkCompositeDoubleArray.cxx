// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkCompositeDoubleArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkCompositeDoubleArray);
vtkStandardExtendedNewMacro(vtkCompositeDoubleArray);

//------------------------------------------------------------------------------
vtkCompositeDoubleArray::vtkCompositeDoubleArray() = default;

//------------------------------------------------------------------------------
vtkCompositeDoubleArray::~vtkCompositeDoubleArray() = default;

//------------------------------------------------------------------------------
void vtkCompositeDoubleArray::ConstructBackend(vtkDataArrayCollection* arrays)
{
  this->RealSuperclass::ConstructBackend(arrays);
}

//------------------------------------------------------------------------------
void vtkCompositeDoubleArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
