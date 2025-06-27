// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkRenderingGL2PSOpenGL2ObjectFactory_h
#define vtkRenderingGL2PSOpenGL2ObjectFactory_h

#include "vtkRenderingGL2PSOpenGL2Module.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKRENDERINGGL2PSOPENGL2_EXPORT vtkRenderingGL2PSOpenGL2ObjectFactory : public vtkObjectFactory
{
public:
  static vtkRenderingGL2PSOpenGL2ObjectFactory * New();
  vtkTypeMacro(vtkRenderingGL2PSOpenGL2ObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkRenderingGL2PSOpenGL2 factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkRenderingGL2PSOpenGL2ObjectFactory();

private:
  vtkRenderingGL2PSOpenGL2ObjectFactory(const vtkRenderingGL2PSOpenGL2ObjectFactory&) = delete;
  void operator=(const vtkRenderingGL2PSOpenGL2ObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkRenderingGL2PSOpenGL2ObjectFactory_h
