// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

// Object factories should never have deprecation warnings.
// NOLINTNEXTLINE(modernize-macro-to-enum)
#define VTK_DEPRECATION_LEVEL 0

#include "vtkIOExportPDFObjectFactory.h"
#include "vtkVersion.h"

// Include all of the classes we want to create overrides for.
#include "vtkPDFContextDevice2D.h"


VTK_ABI_NAMESPACE_BEGIN

vtkStandardNewMacro(vtkIOExportPDFObjectFactory);

// Now create the functions to create overrides with.
VTK_CREATE_CREATE_FUNCTION(vtkPDFContextDevice2D)


vtkIOExportPDFObjectFactory::vtkIOExportPDFObjectFactory()
{
this->RegisterOverride("vtkContextDevice2D", "vtkPDFContextDevice2D", "Override for VTK::IOExportPDF module", 1, vtkObjectFactoryCreatevtkPDFContextDevice2D);

}

const char * vtkIOExportPDFObjectFactory::GetVTKSourceVersion()
{
  return VTK_SOURCE_VERSION;
}

void vtkIOExportPDFObjectFactory::PrintSelf(ostream &os, vtkIndent indent)
{
  this->Superclass::PrintSelf(os, indent);
}

// Registration of object factories.
static unsigned int vtkIOExportPDFCount = 0;

VTKIOEXPORTPDF_EXPORT void vtkIOExportPDF_AutoInit_Construct()
{
  if(++vtkIOExportPDFCount == 1)
  {


    vtkIOExportPDFObjectFactory* factory = vtkIOExportPDFObjectFactory::New();
    if (factory)
    {
      // vtkObjectFactory keeps a reference to the "factory",
      vtkObjectFactory::RegisterFactory(factory);
      factory->Delete();
    }
  }
}
VTK_ABI_NAMESPACE_END
