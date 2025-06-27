// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkLineIntegralConvolution2D_LICN.h"

const char *vtkLineIntegralConvolution2D_LICN =
"//VTK::System::Dec\n"
"\n"
"\n"
"// the output of this shader\n"
"//VTK::Output::Dec\n"
"\n"
"/**\n"
"This shader finalizes the convolution for the LIC computation\n"
"applying the normalization. eg. if box kernel is used the this\n"
"is the number of steps taken.\n"
"*/\n"
"\n"
"uniform sampler2D texLIC;\n"
"\n"
"in vec2 tcoordVC;\n"
"\n"
"void main(void)\n"
"{\n"
"  vec4 conv = texture2D(texLIC, tcoordVC.st);\n"
"  conv.r = conv.r/conv.a;\n"
"  // lic => (convolution, mask, 0, 1)\n"
"  gl_FragData[0] = vec4(conv.rg , 0.0, 1.0);\n"
"}\n"
"";
