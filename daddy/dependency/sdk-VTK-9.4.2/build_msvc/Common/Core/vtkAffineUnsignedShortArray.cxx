// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineUnsignedShortArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineUnsignedShortArray);
vtkStandardExtendedNewMacro(vtkAffineUnsignedShortArray);

//------------------------------------------------------------------------------
vtkAffineUnsignedShortArray::vtkAffineUnsignedShortArray() = default;

//------------------------------------------------------------------------------
vtkAffineUnsignedShortArray::~vtkAffineUnsignedShortArray() = default;

//------------------------------------------------------------------------------
void vtkAffineUnsignedShortArray::ConstructBackend(unsigned short slope, unsigned short intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineUnsignedShortArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
