// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkDomainsChemistryOpenGL2ObjectFactory_h
#define vtkDomainsChemistryOpenGL2ObjectFactory_h

#include "vtkDomainsChemistryOpenGL2Module.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKDOMAINSCHEMISTRYOPENGL2_EXPORT vtkDomainsChemistryOpenGL2ObjectFactory : public vtkObjectFactory
{
public:
  static vtkDomainsChemistryOpenGL2ObjectFactory * New();
  vtkTypeMacro(vtkDomainsChemistryOpenGL2ObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkDomainsChemistryOpenGL2 factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkDomainsChemistryOpenGL2ObjectFactory();

private:
  vtkDomainsChemistryOpenGL2ObjectFactory(const vtkDomainsChemistryOpenGL2ObjectFactory&) = delete;
  void operator=(const vtkDomainsChemistryOpenGL2ObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkDomainsChemistryOpenGL2ObjectFactory_h
