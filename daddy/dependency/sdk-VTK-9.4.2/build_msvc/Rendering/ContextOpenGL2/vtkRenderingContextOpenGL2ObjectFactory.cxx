// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

// Object factories should never have deprecation warnings.
// NOLINTNEXTLINE(modernize-macro-to-enum)
#define VTK_DEPRECATION_LEVEL 0

#include "vtkRenderingContextOpenGL2ObjectFactory.h"
#include "vtkVersion.h"

// Include all of the classes we want to create overrides for.
#include "vtkOpenGLContextActor.h"
#include "vtkOpenGLContextDevice2D.h"
#include "vtkOpenGLContextDevice3D.h"
#include "vtkOpenGLPropItem.h"
#include "vtkOpenGLContextBufferId.h"


VTK_ABI_NAMESPACE_BEGIN

vtkStandardNewMacro(vtkRenderingContextOpenGL2ObjectFactory);

// Now create the functions to create overrides with.
VTK_CREATE_CREATE_FUNCTION(vtkOpenGLContextActor)
VTK_CREATE_CREATE_FUNCTION(vtkOpenGLContextDevice2D)
VTK_CREATE_CREATE_FUNCTION(vtkOpenGLContextDevice3D)
VTK_CREATE_CREATE_FUNCTION(vtkOpenGLPropItem)
VTK_CREATE_CREATE_FUNCTION(vtkOpenGLContextBufferId)


vtkRenderingContextOpenGL2ObjectFactory::vtkRenderingContextOpenGL2ObjectFactory()
{
this->RegisterOverride("vtkContextActor", "vtkOpenGLContextActor", "Override for VTK::RenderingContextOpenGL2 module", 1, vtkObjectFactoryCreatevtkOpenGLContextActor);
this->RegisterOverride("vtkContextDevice2D", "vtkOpenGLContextDevice2D", "Override for VTK::RenderingContextOpenGL2 module", 1, vtkObjectFactoryCreatevtkOpenGLContextDevice2D);
this->RegisterOverride("vtkContextDevice3D", "vtkOpenGLContextDevice3D", "Override for VTK::RenderingContextOpenGL2 module", 1, vtkObjectFactoryCreatevtkOpenGLContextDevice3D);
this->RegisterOverride("vtkPropItem", "vtkOpenGLPropItem", "Override for VTK::RenderingContextOpenGL2 module", 1, vtkObjectFactoryCreatevtkOpenGLPropItem);
this->RegisterOverride("vtkAbstractContextBufferId", "vtkOpenGLContextBufferId", "Override for VTK::RenderingContextOpenGL2 module", 1, vtkObjectFactoryCreatevtkOpenGLContextBufferId);

}

const char * vtkRenderingContextOpenGL2ObjectFactory::GetVTKSourceVersion()
{
  return VTK_SOURCE_VERSION;
}

void vtkRenderingContextOpenGL2ObjectFactory::PrintSelf(ostream &os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os, indent);
}

// Registration of object factories.
static unsigned int vtkRenderingContextOpenGL2Count = 0;

VTKRENDERINGCONTEXTOPENGL2_EXPORT void vtkRenderingContextOpenGL2_AutoInit_Construct()
{
  if(++vtkRenderingContextOpenGL2Count == 1)
  {


    vtkRenderingContextOpenGL2ObjectFactory* factory = vtkRenderingContextOpenGL2ObjectFactory::New();
    if (factory)
    {
      // vtkObjectFactory keeps a reference to the "factory",
      vtkObjectFactory::RegisterFactory(factory);
      factory->Delete();
    }
  }
}
VTK_ABI_NAMESPACE_END
