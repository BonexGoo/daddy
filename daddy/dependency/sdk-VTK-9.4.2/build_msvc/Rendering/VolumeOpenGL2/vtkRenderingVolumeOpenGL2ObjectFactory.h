// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkRenderingVolumeOpenGL2ObjectFactory_h
#define vtkRenderingVolumeOpenGL2ObjectFactory_h

#include "vtkRenderingVolumeOpenGL2Module.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKRENDERINGVOLUMEOPENGL2_EXPORT vtkRenderingVolumeOpenGL2ObjectFactory : public vtkObjectFactory
{
public:
  static vtkRenderingVolumeOpenGL2ObjectFactory * New();
  vtkTypeMacro(vtkRenderingVolumeOpenGL2ObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkRenderingVolumeOpenGL2 factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkRenderingVolumeOpenGL2ObjectFactory();

private:
  vtkRenderingVolumeOpenGL2ObjectFactory(const vtkRenderingVolumeOpenGL2ObjectFactory&) = delete;
  void operator=(const vtkRenderingVolumeOpenGL2ObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkRenderingVolumeOpenGL2ObjectFactory_h
