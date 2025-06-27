// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTypeInt32Array.h"

#include "vtkObjectFactory.h"

//----------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkTypeInt32Array);

//----------------------------------------------------------------------------
vtkTypeInt32Array::vtkTypeInt32Array() = default;

//----------------------------------------------------------------------------
vtkTypeInt32Array::~vtkTypeInt32Array() = default;

//----------------------------------------------------------------------------
void vtkTypeInt32Array::PrintSelf(ostream& os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os,indent);
}
VTK_ABI_NAMESPACE_END
