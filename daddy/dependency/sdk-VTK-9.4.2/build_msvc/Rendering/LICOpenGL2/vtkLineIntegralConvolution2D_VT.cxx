// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkLineIntegralConvolution2D_VT.h"

const char *vtkLineIntegralConvolution2D_VT =
"//VTK::System::Dec\n"
"\n"
"\n"
"// move vector field to normalized image space\n"
"// pre-processing for vtkLineIntegralConvolution2D\n"
"\n"
"// the output of this shader\n"
"//VTK::Output::Dec\n"
"\n"
"// Fragment shader used by the gaussian blur filter render pass.\n"
"\n"
"uniform sampler2D texVectors; // input texture\n"
"uniform vec2      uTexSize;   // size of texture\n"
"\n"
"in vec2 tcoordVC;\n"
"\n"
"void main(void)\n"
"{\n"
"  //VTK::LICComponentSelection::Impl\n"
"  V = V/uTexSize;\n"
"  gl_FragData[0] = vec4(V, 0.0, 1.0);\n"
"}\n"
"";
