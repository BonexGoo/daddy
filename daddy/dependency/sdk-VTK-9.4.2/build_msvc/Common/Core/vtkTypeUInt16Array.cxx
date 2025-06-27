// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTypeUInt16Array.h"

#include "vtkObjectFactory.h"

//----------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkTypeUInt16Array);

//----------------------------------------------------------------------------
vtkTypeUInt16Array::vtkTypeUInt16Array() = default;

//----------------------------------------------------------------------------
vtkTypeUInt16Array::~vtkTypeUInt16Array() = default;

//----------------------------------------------------------------------------
void vtkTypeUInt16Array::PrintSelf(ostream& os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os,indent);
}
VTK_ABI_NAMESPACE_END
