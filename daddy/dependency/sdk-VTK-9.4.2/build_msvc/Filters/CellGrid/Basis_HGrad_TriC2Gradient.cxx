// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_TriC2Gradient.h"

const char *Basis_HGrad_TriC2Gradient =
"basisGradient[0] = 4.0 * rr + 4.0 * ss - 3.0;\n"
"basisGradient[1] = 4.0 * rr + 4.0 * ss - 3.0;\n"
"basisGradient[2] = 0.0;\n"
"\n"
"basisGradient[3] = 4.0 * rr - 1.0;\n"
"basisGradient[4] = 0.0;\n"
"basisGradient[5] = 0.0;\n"
"\n"
"basisGradient[6] = 0.0;\n"
"basisGradient[7] = 4.0 * ss - 1.0;\n"
"basisGradient[8] = 0.0;\n"
"\n"
"basisGradient[9] = -4.0 * (2.0 * rr + ss - 1.0);\n"
"basisGradient[10] = -4.0 * rr;\n"
"basisGradient[11] = 0.0;\n"
"\n"
"basisGradient[12] = 4.0 * ss;\n"
"basisGradient[13] = 4.0 * rr;\n"
"basisGradient[14] = 0.0;\n"
"\n"
"basisGradient[15] = -4.0 * ss;\n"
"basisGradient[16] = -4.0 * (rr + 2.0 * ss - 1.0);\n"
"basisGradient[17] = 0.0;\n"
"";
