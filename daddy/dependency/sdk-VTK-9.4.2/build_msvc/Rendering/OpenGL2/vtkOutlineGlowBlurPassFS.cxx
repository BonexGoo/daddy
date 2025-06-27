// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkOutlineGlowBlurPassFS.h"

const char *vtkOutlineGlowBlurPassFS =
"//VTK::System::Dec\n"
"\n"
"\n"
"// Fragment shader used by the outline glow blur render pass.\n"
"\n"
"in vec2 tcoordVC;\n"
"uniform sampler2D source;\n"
"\n"
"uniform float coef[3];\n"
"uniform float offsetx;\n"
"uniform float offsety;\n"
"\n"
"// the output of this shader\n"
"//VTK::Output::Dec\n"
"\n"
"void main(void)\n"
"{\n"
"  vec2 offset=vec2(offsetx,offsety);\n"
"\n"
"  gl_FragData[0] = coef[0]*texture2D(source,tcoordVC-offset)\n"
"    +coef[1]*texture2D(source,tcoordVC)\n"
"    +coef[2]*texture2D(source,tcoordVC+offset);\n"
"}\n"
"";
