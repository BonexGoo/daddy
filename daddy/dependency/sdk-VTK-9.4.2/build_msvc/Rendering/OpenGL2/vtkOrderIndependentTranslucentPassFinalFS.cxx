// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkOrderIndependentTranslucentPassFinalFS.h"

const char *vtkOrderIndependentTranslucentPassFinalFS =
"//VTK::System::Dec\n"
"\n"
"// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen\n"
"// SPDX-License-Identifier: BSD-3-Clause\n"
"\n"
"in vec2 texCoord;\n"
"\n"
"uniform sampler2D translucentRTexture;\n"
"uniform sampler2D translucentRGBATexture;\n"
"\n"
"// the output of this shader\n"
"//VTK::Output::Dec\n"
"\n"
"void main()\n"
"{\n"
"  vec4 t1Color = texture(translucentRGBATexture, texCoord);\n"
"  float t2Color = texture(translucentRTexture, texCoord).r;\n"
"\n"
"  gl_FragData[0] = vec4(t1Color.rgb/max(t2Color,0.01), 1.0-t1Color.a);\n"
"  // gl_FragData[0] = vec4(t1Color.a, t1Color.a, t1Color.a, 0.0);\n"
"  // gl_FragData[0] = vec4(t2Color, t2Color, t2Color, 0.0);\n"
"}\n"
"";
