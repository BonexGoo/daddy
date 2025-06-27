// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkCompositeSignedCharArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkCompositeSignedCharArray);
vtkStandardExtendedNewMacro(vtkCompositeSignedCharArray);

//------------------------------------------------------------------------------
vtkCompositeSignedCharArray::vtkCompositeSignedCharArray() = default;

//------------------------------------------------------------------------------
vtkCompositeSignedCharArray::~vtkCompositeSignedCharArray() = default;

//------------------------------------------------------------------------------
void vtkCompositeSignedCharArray::ConstructBackend(vtkDataArrayCollection* arrays)
{
  this->RealSuperclass::ConstructBackend(arrays);
}

//------------------------------------------------------------------------------
void vtkCompositeSignedCharArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
