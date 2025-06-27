// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineLongLongArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineLongLongArray);
vtkStandardExtendedNewMacro(vtkAffineLongLongArray);

//------------------------------------------------------------------------------
vtkAffineLongLongArray::vtkAffineLongLongArray() = default;

//------------------------------------------------------------------------------
vtkAffineLongLongArray::~vtkAffineLongLongArray() = default;

//------------------------------------------------------------------------------
void vtkAffineLongLongArray::ConstructBackend(long long slope, long long intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineLongLongArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
