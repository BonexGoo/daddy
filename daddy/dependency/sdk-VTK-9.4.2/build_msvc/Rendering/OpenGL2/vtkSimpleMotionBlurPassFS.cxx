// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkSimpleMotionBlurPassFS.h"

const char *vtkSimpleMotionBlurPassFS =
"//VTK::System::Dec\n"
"\n"
"\n"
"// Fragment shader used by the gaussian blur filter render pass.\n"
"\n"
"in vec2 tcoordVC;\n"
"uniform sampler2D source;\n"
"uniform float blendScale;\n"
"\n"
"// the output of this shader\n"
"//VTK::Output::Dec\n"
"\n"
"void main(void)\n"
"{\n"
"  gl_FragData[0] = blendScale*texture2D(source,tcoordVC);\n"
"}\n"
"";
