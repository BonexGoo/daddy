// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineLongArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineLongArray);
vtkStandardExtendedNewMacro(vtkAffineLongArray);

//------------------------------------------------------------------------------
vtkAffineLongArray::vtkAffineLongArray() = default;

//------------------------------------------------------------------------------
vtkAffineLongArray::~vtkAffineLongArray() = default;

//------------------------------------------------------------------------------
void vtkAffineLongArray::ConstructBackend(long slope, long intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineLongArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
