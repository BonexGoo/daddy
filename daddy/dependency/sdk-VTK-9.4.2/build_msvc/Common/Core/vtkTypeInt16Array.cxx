// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTypeInt16Array.h"

#include "vtkObjectFactory.h"

//----------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkTypeInt16Array);

//----------------------------------------------------------------------------
vtkTypeInt16Array::vtkTypeInt16Array() = default;

//----------------------------------------------------------------------------
vtkTypeInt16Array::~vtkTypeInt16Array() = default;

//----------------------------------------------------------------------------
void vtkTypeInt16Array::PrintSelf(ostream& os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os,indent);
}
VTK_ABI_NAMESPACE_END
