// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

// Object factories should never have deprecation warnings.
// NOLINTNEXTLINE(modernize-macro-to-enum)
#define VTK_DEPRECATION_LEVEL 0

#include "vtkRenderingFreeTypeObjectFactory.h"
#include "vtkVersion.h"

// Include all of the classes we want to create overrides for.
#include "vtkMathTextFreeTypeTextRenderer.h"


VTK_ABI_NAMESPACE_BEGIN

vtkStandardNewMacro(vtkRenderingFreeTypeObjectFactory);

// Now create the functions to create overrides with.
VTK_CREATE_CREATE_FUNCTION(vtkMathTextFreeTypeTextRenderer)


vtkRenderingFreeTypeObjectFactory::vtkRenderingFreeTypeObjectFactory()
{
this->RegisterOverride("vtkTextRenderer", "vtkMathTextFreeTypeTextRenderer", "Override for VTK::RenderingFreeType module", 1, vtkObjectFactoryCreatevtkMathTextFreeTypeTextRenderer);

}

const char * vtkRenderingFreeTypeObjectFactory::GetVTKSourceVersion()
{
  return VTK_SOURCE_VERSION;
}

void vtkRenderingFreeTypeObjectFactory::PrintSelf(ostream &os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os, indent);
}

// Registration of object factories.
static unsigned int vtkRenderingFreeTypeCount = 0;

VTKRENDERINGFREETYPE_EXPORT void vtkRenderingFreeType_AutoInit_Construct()
{
  if(++vtkRenderingFreeTypeCount == 1)
  {


    vtkRenderingFreeTypeObjectFactory* factory = vtkRenderingFreeTypeObjectFactory::New();
    if (factory)
    {
      // vtkObjectFactory keeps a reference to the "factory",
      vtkObjectFactory::RegisterFactory(factory);
      factory->Delete();
    }
  }
}
VTK_ABI_NAMESPACE_END
