// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

// Object factories should never have deprecation warnings.
// NOLINTNEXTLINE(modernize-macro-to-enum)
#define VTK_DEPRECATION_LEVEL 0

#include "vtkRenderingVolumeOpenGL2ObjectFactory.h"
#include "vtkVersion.h"

// Include all of the classes we want to create overrides for.
#include "vtkOpenGLGPUVolumeRayCastMapper.h"
#include "vtkOpenGLProjectedTetrahedraMapper.h"
#include "vtkOpenGLRayCastImageDisplayHelper.h"


VTK_ABI_NAMESPACE_BEGIN

vtkStandardNewMacro(vtkRenderingVolumeOpenGL2ObjectFactory);

// Now create the functions to create overrides with.
VTK_CREATE_CREATE_FUNCTION(vtkOpenGLGPUVolumeRayCastMapper)
VTK_CREATE_CREATE_FUNCTION(vtkOpenGLProjectedTetrahedraMapper)
VTK_CREATE_CREATE_FUNCTION(vtkOpenGLRayCastImageDisplayHelper)


vtkRenderingVolumeOpenGL2ObjectFactory::vtkRenderingVolumeOpenGL2ObjectFactory()
{
this->RegisterOverride("vtkGPUVolumeRayCastMapper", "vtkOpenGLGPUVolumeRayCastMapper", "Override for VTK::RenderingVolumeOpenGL2 module", 1, vtkObjectFactoryCreatevtkOpenGLGPUVolumeRayCastMapper);
this->RegisterOverride("vtkProjectedTetrahedraMapper", "vtkOpenGLProjectedTetrahedraMapper", "Override for VTK::RenderingVolumeOpenGL2 module", 1, vtkObjectFactoryCreatevtkOpenGLProjectedTetrahedraMapper);
this->RegisterOverride("vtkRayCastImageDisplayHelper", "vtkOpenGLRayCastImageDisplayHelper", "Override for VTK::RenderingVolumeOpenGL2 module", 1, vtkObjectFactoryCreatevtkOpenGLRayCastImageDisplayHelper);

}

const char * vtkRenderingVolumeOpenGL2ObjectFactory::GetVTKSourceVersion()
{
  return VTK_SOURCE_VERSION;
}

void vtkRenderingVolumeOpenGL2ObjectFactory::PrintSelf(ostream &os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os, indent);
}

// Registration of object factories.
static unsigned int vtkRenderingVolumeOpenGL2Count = 0;

VTKRENDERINGVOLUMEOPENGL2_EXPORT void vtkRenderingVolumeOpenGL2_AutoInit_Construct()
{
  if(++vtkRenderingVolumeOpenGL2Count == 1)
  {


    vtkRenderingVolumeOpenGL2ObjectFactory* factory = vtkRenderingVolumeOpenGL2ObjectFactory::New();
    if (factory)
    {
      // vtkObjectFactory keeps a reference to the "factory",
      vtkObjectFactory::RegisterFactory(factory);
      factory->Delete();
    }
  }
}
VTK_ABI_NAMESPACE_END
