// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTypeUInt32Array.h"

#include "vtkObjectFactory.h"

//----------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkTypeUInt32Array);

//----------------------------------------------------------------------------
vtkTypeUInt32Array::vtkTypeUInt32Array() = default;

//----------------------------------------------------------------------------
vtkTypeUInt32Array::~vtkTypeUInt32Array() = default;

//----------------------------------------------------------------------------
void vtkTypeUInt32Array::PrintSelf(ostream& os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os,indent);
}
VTK_ABI_NAMESPACE_END
