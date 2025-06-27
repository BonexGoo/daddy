// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTypeFloat32Array.h"

#include "vtkObjectFactory.h"

//----------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkTypeFloat32Array);

//----------------------------------------------------------------------------
vtkTypeFloat32Array::vtkTypeFloat32Array() = default;

//----------------------------------------------------------------------------
vtkTypeFloat32Array::~vtkTypeFloat32Array() = default;

//----------------------------------------------------------------------------
void vtkTypeFloat32Array::PrintSelf(ostream& os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os,indent);
}
VTK_ABI_NAMESPACE_END
