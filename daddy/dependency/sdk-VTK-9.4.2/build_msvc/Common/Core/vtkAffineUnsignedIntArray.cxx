// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineUnsignedIntArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineUnsignedIntArray);
vtkStandardExtendedNewMacro(vtkAffineUnsignedIntArray);

//------------------------------------------------------------------------------
vtkAffineUnsignedIntArray::vtkAffineUnsignedIntArray() = default;

//------------------------------------------------------------------------------
vtkAffineUnsignedIntArray::~vtkAffineUnsignedIntArray() = default;

//------------------------------------------------------------------------------
void vtkAffineUnsignedIntArray::ConstructBackend(unsigned int slope, unsigned int intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineUnsignedIntArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
