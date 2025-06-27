// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkRenderingUIObjectFactory_h
#define vtkRenderingUIObjectFactory_h

#include "vtkRenderingUIModule.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKRENDERINGUI_EXPORT vtkRenderingUIObjectFactory : public vtkObjectFactory
{
public:
  static vtkRenderingUIObjectFactory * New();
  vtkTypeMacro(vtkRenderingUIObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkRenderingUI factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkRenderingUIObjectFactory();

private:
  vtkRenderingUIObjectFactory(const vtkRenderingUIObjectFactory&) = delete;
  void operator=(const vtkRenderingUIObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkRenderingUIObjectFactory_h
