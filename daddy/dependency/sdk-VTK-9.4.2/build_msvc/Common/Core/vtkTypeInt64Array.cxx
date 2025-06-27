// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTypeInt64Array.h"

#include "vtkObjectFactory.h"

//----------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkTypeInt64Array);

//----------------------------------------------------------------------------
vtkTypeInt64Array::vtkTypeInt64Array() = default;

//----------------------------------------------------------------------------
vtkTypeInt64Array::~vtkTypeInt64Array() = default;

//----------------------------------------------------------------------------
void vtkTypeInt64Array::PrintSelf(ostream& os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os,indent);
}
VTK_ABI_NAMESPACE_END
