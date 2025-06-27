// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

// Object factories should never have deprecation warnings.
// NOLINTNEXTLINE(modernize-macro-to-enum)
#define VTK_DEPRECATION_LEVEL 0

#include "vtkRenderingRayTracingObjectFactory.h"
#include "vtkVersion.h"

// Include all of the classes we want to create overrides for.
#include "vtkOSPRayVolumeMapper.h"


VTK_ABI_NAMESPACE_BEGIN

vtkStandardNewMacro(vtkRenderingRayTracingObjectFactory);

// Now create the functions to create overrides with.
VTK_CREATE_CREATE_FUNCTION(vtkOSPRayVolumeMapper)


vtkRenderingRayTracingObjectFactory::vtkRenderingRayTracingObjectFactory()
{
this->RegisterOverride("vtkOSPRayVolumeInterface", "vtkOSPRayVolumeMapper", "Override for VTK::RenderingRayTracing module", 1, vtkObjectFactoryCreatevtkOSPRayVolumeMapper);

}

const char * vtkRenderingRayTracingObjectFactory::GetVTKSourceVersion()
{
  return VTK_SOURCE_VERSION;
}

void vtkRenderingRayTracingObjectFactory::PrintSelf(ostream &os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os, indent);
}

// Registration of object factories.
static unsigned int vtkRenderingRayTracingCount = 0;

VTKRENDERINGRAYTRACING_EXPORT void vtkRenderingRayTracing_AutoInit_Construct()
{
  if(++vtkRenderingRayTracingCount == 1)
  {


    vtkRenderingRayTracingObjectFactory* factory = vtkRenderingRayTracingObjectFactory::New();
    if (factory)
    {
      // vtkObjectFactory keeps a reference to the "factory",
      vtkObjectFactory::RegisterFactory(factory);
      factory->Delete();
    }
  }
}
VTK_ABI_NAMESPACE_END
