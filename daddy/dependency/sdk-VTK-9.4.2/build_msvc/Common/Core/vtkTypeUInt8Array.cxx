// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTypeUInt8Array.h"

#include "vtkObjectFactory.h"

//----------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkTypeUInt8Array);

//----------------------------------------------------------------------------
vtkTypeUInt8Array::vtkTypeUInt8Array() = default;

//----------------------------------------------------------------------------
vtkTypeUInt8Array::~vtkTypeUInt8Array() = default;

//----------------------------------------------------------------------------
void vtkTypeUInt8Array::PrintSelf(ostream& os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os,indent);
}
VTK_ABI_NAMESPACE_END
