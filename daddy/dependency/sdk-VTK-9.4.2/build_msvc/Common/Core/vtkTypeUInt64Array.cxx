// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTypeUInt64Array.h"

#include "vtkObjectFactory.h"

//----------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkTypeUInt64Array);

//----------------------------------------------------------------------------
vtkTypeUInt64Array::vtkTypeUInt64Array() = default;

//----------------------------------------------------------------------------
vtkTypeUInt64Array::~vtkTypeUInt64Array() = default;

//----------------------------------------------------------------------------
void vtkTypeUInt64Array::PrintSelf(ostream& os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os,indent);
}
VTK_ABI_NAMESPACE_END
