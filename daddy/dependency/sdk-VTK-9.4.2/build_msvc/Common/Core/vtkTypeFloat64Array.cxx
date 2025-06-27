// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTypeFloat64Array.h"

#include "vtkObjectFactory.h"

//----------------------------------------------------------------------------
VTK_ABI_NAMESPACE_BEGIN
vtkStandardNewMacro(vtkTypeFloat64Array);

//----------------------------------------------------------------------------
vtkTypeFloat64Array::vtkTypeFloat64Array() = default;

//----------------------------------------------------------------------------
vtkTypeFloat64Array::~vtkTypeFloat64Array() = default;

//----------------------------------------------------------------------------
void vtkTypeFloat64Array::PrintSelf(ostream& os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os,indent);
}
VTK_ABI_NAMESPACE_END
