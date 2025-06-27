// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkInteractionStyleObjectFactory_h
#define vtkInteractionStyleObjectFactory_h

#include "vtkInteractionStyleModule.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKINTERACTIONSTYLE_EXPORT vtkInteractionStyleObjectFactory : public vtkObjectFactory
{
public:
  static vtkInteractionStyleObjectFactory * New();
  vtkTypeMacro(vtkInteractionStyleObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkInteractionStyle factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkInteractionStyleObjectFactory();

private:
  vtkInteractionStyleObjectFactory(const vtkInteractionStyleObjectFactory&) = delete;
  void operator=(const vtkInteractionStyleObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkInteractionStyleObjectFactory_h
