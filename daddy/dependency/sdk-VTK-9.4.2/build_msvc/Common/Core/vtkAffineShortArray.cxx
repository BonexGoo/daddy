// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
// Instantiate superclass first to give the template a DLL interface.
#define VTK_AOS_DATA_ARRAY_TEMPLATE_INSTANTIATING

#include "vtkAffineShortArray.h"

#include "vtkObjectFactory.h"

//------------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkAffineShortArray);
vtkStandardExtendedNewMacro(vtkAffineShortArray);

//------------------------------------------------------------------------------
vtkAffineShortArray::vtkAffineShortArray() = default;

//------------------------------------------------------------------------------
vtkAffineShortArray::~vtkAffineShortArray() = default;

//------------------------------------------------------------------------------
void vtkAffineShortArray::ConstructBackend(short slope, short intercept)
{
  this->RealSuperclass::ConstructBackend(slope, intercept);
}

//------------------------------------------------------------------------------
void vtkAffineShortArray::PrintSelf(ostream& os, vtkIndent indent)
{
  this->RealSuperclass::PrintSelf(os, indent);
}
VTK_ABI_NAMESPACE_END
