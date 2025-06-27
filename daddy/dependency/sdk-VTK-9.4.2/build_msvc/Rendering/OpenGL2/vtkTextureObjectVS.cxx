// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkTextureObjectVS.h"

VTK_ABI_NAMESPACE_BEGIN

const char *vtkTextureObjectVS =
"//VTK::System::Dec\n"
"\n"
"// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen\n"
"// SPDX-License-Identifier: BSD-3-Clause\n"
"\n"
"in vec4 vertexMC;\n"
"in vec2 tcoordMC;\n"
"out vec2 tcoordVC;\n"
"\n"
"void main()\n"
"{\n"
"  tcoordVC = tcoordMC;\n"
"  gl_Position = vertexMC;\n"
"}\n"
"";

VTK_ABI_NAMESPACE_END
