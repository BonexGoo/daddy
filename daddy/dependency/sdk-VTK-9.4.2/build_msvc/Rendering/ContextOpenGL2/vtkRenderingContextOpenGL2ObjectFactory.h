// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkRenderingContextOpenGL2ObjectFactory_h
#define vtkRenderingContextOpenGL2ObjectFactory_h

#include "vtkRenderingContextOpenGL2Module.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKRENDERINGCONTEXTOPENGL2_EXPORT vtkRenderingContextOpenGL2ObjectFactory : public vtkObjectFactory
{
public:
  static vtkRenderingContextOpenGL2ObjectFactory * New();
  vtkTypeMacro(vtkRenderingContextOpenGL2ObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkRenderingContextOpenGL2 factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkRenderingContextOpenGL2ObjectFactory();

private:
  vtkRenderingContextOpenGL2ObjectFactory(const vtkRenderingContextOpenGL2ObjectFactory&) = delete;
  void operator=(const vtkRenderingContextOpenGL2ObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkRenderingContextOpenGL2ObjectFactory_h
