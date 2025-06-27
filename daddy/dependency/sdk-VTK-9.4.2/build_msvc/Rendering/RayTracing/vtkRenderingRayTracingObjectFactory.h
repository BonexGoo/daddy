// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkRenderingRayTracingObjectFactory_h
#define vtkRenderingRayTracingObjectFactory_h

#include "vtkRenderingRayTracingModule.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKRENDERINGRAYTRACING_EXPORT vtkRenderingRayTracingObjectFactory : public vtkObjectFactory
{
public:
  static vtkRenderingRayTracingObjectFactory * New();
  vtkTypeMacro(vtkRenderingRayTracingObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkRenderingRayTracing factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkRenderingRayTracingObjectFactory();

private:
  vtkRenderingRayTracingObjectFactory(const vtkRenderingRayTracingObjectFactory&) = delete;
  void operator=(const vtkRenderingRayTracingObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkRenderingRayTracingObjectFactory_h
