// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTypeInt8Array.h"

#include "vtkObjectFactory.h"

//----------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkTypeInt8Array);

//----------------------------------------------------------------------------
vtkTypeInt8Array::vtkTypeInt8Array() = default;

//----------------------------------------------------------------------------
vtkTypeInt8Array::~vtkTypeInt8Array() = default;

//----------------------------------------------------------------------------
void vtkTypeInt8Array::PrintSelf(ostream& os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os,indent);
}
VTK_ABI_NAMESPACE_END
