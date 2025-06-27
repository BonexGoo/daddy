// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkIOExportGL2PSObjectFactory_h
#define vtkIOExportGL2PSObjectFactory_h

#include "vtkIOExportGL2PSModule.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKIOEXPORTGL2PS_EXPORT vtkIOExportGL2PSObjectFactory : public vtkObjectFactory
{
public:
  static vtkIOExportGL2PSObjectFactory * New();
  vtkTypeMacro(vtkIOExportGL2PSObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkIOExportGL2PS factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkIOExportGL2PSObjectFactory();

private:
  vtkIOExportGL2PSObjectFactory(const vtkIOExportGL2PSObjectFactory&) = delete;
  void operator=(const vtkIOExportGL2PSObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkIOExportGL2PSObjectFactory_h
