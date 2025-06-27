// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_WdgC1Gradient.h"

const char *Basis_HGrad_WdgC1Gradient =
"basisGradient[0] = -(1.0 - tt) / 2.0;\n"
"basisGradient[1] = -(1.0 - tt) / 2.0;\n"
"basisGradient[2] = -(1.0 - rr - ss) / 2.0;\n"
"\n"
"basisGradient[3] = (1.0 - tt) / 2.0;\n"
"basisGradient[4] = 0.0;\n"
"basisGradient[5] = -rr / 2.0;\n"
"\n"
"basisGradient[6] = 0.0;\n"
"basisGradient[7] = (1.0 - tt) / 2.0;\n"
"basisGradient[8] = -ss / 2.0;\n"
"\n"
"basisGradient[9] = -(1.0 + tt) / 2.0;\n"
"basisGradient[10] = -(1.0 + tt) / 2.0;\n"
"basisGradient[11] = (1.0 - rr - ss) / 2.0;\n"
"\n"
"basisGradient[12] = (1.0 + tt) / 2.0;\n"
"basisGradient[13] = 0.0;\n"
"basisGradient[14] = rr / 2.0;\n"
"\n"
"basisGradient[15] = 0.0;\n"
"basisGradient[16] = (1.0 + tt) / 2.0;\n"
"basisGradient[17] = ss / 2.0;\n"
"";
