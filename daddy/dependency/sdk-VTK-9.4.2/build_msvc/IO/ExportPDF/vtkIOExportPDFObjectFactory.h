// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause

#ifndef vtkIOExportPDFObjectFactory_h
#define vtkIOExportPDFObjectFactory_h

#include "vtkIOExportPDFModule.h" // For export macro
#include "vtkObjectFactory.h"

VTK_ABI_NAMESPACE_BEGIN

class VTKIOEXPORTPDF_EXPORT vtkIOExportPDFObjectFactory : public vtkObjectFactory
{
public:
  static vtkIOExportPDFObjectFactory * New();
  vtkTypeMacro(vtkIOExportPDFObjectFactory, vtkObjectFactory);

  const char * GetDescription() override { return "vtkIOExportPDF factory overrides."; }

  const char * GetVTKSourceVersion() override;

  void PrintSelf(ostream &os, vtkIndent indent) override;

protected:
  vtkIOExportPDFObjectFactory();

private:
  vtkIOExportPDFObjectFactory(const vtkIOExportPDFObjectFactory&) = delete;
  void operator=(const vtkIOExportPDFObjectFactory&) = delete;
};

VTK_ABI_NAMESPACE_END

#endif // vtkIOExportPDFObjectFactory_h
