// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineIntArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineIntArray);
vtkStandardExtendedNewMacro(vtkAffineIntArray);

//------------------------------------------------------------------------------
vtkAffineIntArray::vtkAffineIntArray() = default;

//------------------------------------------------------------------------------
vtkAffineIntArray::~vtkAffineIntArray() = default;

//------------------------------------------------------------------------------
void vtkAffineIntArray::ConstructBackend(int slope, int intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineIntArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
