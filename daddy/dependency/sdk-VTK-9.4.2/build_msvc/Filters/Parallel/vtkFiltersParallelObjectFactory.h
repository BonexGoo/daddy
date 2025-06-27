// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkFiltersParallelObjectFactory_h
#define vtkFiltersParallelObjectFactory_h

#include "vtkFiltersParallelModule.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKFILTERSPARALLEL_EXPORT vtkFiltersParallelObjectFactory : public vtkObjectFactory
{
public:
  static vtkFiltersParallelObjectFactory * New();
  vtkTypeMacro(vtkFiltersParallelObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkFiltersParallel factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkFiltersParallelObjectFactory();

private:
  vtkFiltersParallelObjectFactory(const vtkFiltersParallelObjectFactory&) = delete;
  void operator=(const vtkFiltersParallelObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkFiltersParallelObjectFactory_h
