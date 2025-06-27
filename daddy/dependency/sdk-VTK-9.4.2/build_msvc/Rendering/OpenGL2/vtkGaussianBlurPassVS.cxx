// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkGaussianBlurPassVS.h"

const char *vtkGaussianBlurPassVS =
"//VTK::System::Dec\n"
"\n"
"// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen\n"
"// SPDX-License-Identifier: BSD-3-Clause\n"
"\n"
"in vec4 vertexMC;\n"
"\n"
"in vec2 tcoordMC;\n"
"out vec2 tcoordVC;\n"
"\n"
"void main()\n"
"{\n"
"  tcoordVC = tcoordMC;\n"
"  gl_Position = vertexMC;\n"
"}\n"
"";
