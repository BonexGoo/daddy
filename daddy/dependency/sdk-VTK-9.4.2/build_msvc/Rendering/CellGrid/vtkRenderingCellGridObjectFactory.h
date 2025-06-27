// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkRenderingCellGridObjectFactory_h
#define vtkRenderingCellGridObjectFactory_h

#include "vtkRenderingCellGridModule.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKRENDERINGCELLGRID_EXPORT vtkRenderingCellGridObjectFactory : public vtkObjectFactory
{
public:
  static vtkRenderingCellGridObjectFactory * New();
  vtkTypeMacro(vtkRenderingCellGridObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkRenderingCellGrid factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkRenderingCellGridObjectFactory();

private:
  vtkRenderingCellGridObjectFactory(const vtkRenderingCellGridObjectFactory&) = delete;
  void operator=(const vtkRenderingCellGridObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkRenderingCellGridObjectFactory_h
