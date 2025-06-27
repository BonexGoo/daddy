// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_QuadC1Gradient.h"

const char *Basis_HGrad_QuadC1Gradient =
"basisGradient[0] = -(1.0 - ss) / 4.0;\n"
"basisGradient[1] = -(1.0 - rr) / 4.0;\n"
"basisGradient[2] = 0.0;\n"
"\n"
"basisGradient[3] = (1.0 - ss) / 4.0;\n"
"basisGradient[4] = -(1.0 + rr) / 4.0;\n"
"basisGradient[5] = 0.0;\n"
"\n"
"basisGradient[6] = (1.0 + ss) / 4.0;\n"
"basisGradient[7] = (1.0 + rr) / 4.0;\n"
"basisGradient[8] = 0.0;\n"
"\n"
"basisGradient[9] = -(1.0 + ss) / 4.0;\n"
"basisGradient[10] = (1.0 - rr) / 4.0;\n"
"basisGradient[11] = 0.0;\n"
"";
