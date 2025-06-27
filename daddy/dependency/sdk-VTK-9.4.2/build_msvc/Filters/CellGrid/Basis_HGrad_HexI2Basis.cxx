// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_HexI2Basis.h"

const char *Basis_HGrad_HexI2Basis =
"basis[0] = 0.125 * (1.0 - rr) * (1.0 - ss) * (1.0 - tt) * (-rr - ss - tt - 2.0);\n"
"basis[1] = 0.125 * (1.0 + rr) * (1.0 - ss) * (1.0 - tt) * (rr - ss - tt - 2.0);\n"
"basis[2] = 0.125 * (1.0 + rr) * (1.0 + ss) * (1.0 - tt) * (rr + ss - tt - 2.0);\n"
"basis[3] = 0.125 * (1.0 - rr) * (1.0 + ss) * (1.0 - tt) * (-rr + ss - tt - 2.0);\n"
"basis[4] = 0.125 * (1.0 - rr) * (1.0 - ss) * (1.0 + tt) * (-rr - ss + tt - 2.0);\n"
"basis[5] = 0.125 * (1.0 + rr) * (1.0 - ss) * (1.0 + tt) * (rr - ss + tt - 2.0);\n"
"basis[6] = 0.125 * (1.0 + rr) * (1.0 + ss) * (1.0 + tt) * (rr + ss + tt - 2.0);\n"
"basis[7] = 0.125 * (1.0 - rr) * (1.0 + ss) * (1.0 + tt) * (-rr + ss + tt - 2.0);\n"
"\n"
"basis[8] = 0.25 * (1.0 - rr * rr) * (1.0 - ss) * (1.0 - tt);\n"
"basis[9] = 0.25 * (1.0 + rr) * (1.0 - ss * ss) * (1.0 - tt);\n"
"basis[10] = 0.25 * (1.0 - rr * rr) * (1.0 + ss) * (1.0 - tt);\n"
"basis[11] = 0.25 * (1.0 - rr) * (1.0 - ss * ss) * (1.0 - tt);\n"
"\n"
"basis[12] = 0.25 * (1.0 - rr) * (1.0 - ss) * (1.0 - tt * tt);\n"
"basis[13] = 0.25 * (1.0 + rr) * (1.0 - ss) * (1.0 - tt * tt);\n"
"basis[14] = 0.25 * (1.0 + rr) * (1.0 + ss) * (1.0 - tt * tt);\n"
"basis[15] = 0.25 * (1.0 - rr) * (1.0 + ss) * (1.0 - tt * tt);\n"
"\n"
"basis[16] = 0.25 * (1.0 - rr * rr) * (1.0 - ss) * (1.0 + tt);\n"
"basis[17] = 0.25 * (1.0 + rr) * (1.0 - ss * ss) * (1.0 + tt);\n"
"basis[18] = 0.25 * (1.0 - rr * rr) * (1.0 + ss) * (1.0 + tt);\n"
"basis[19] = 0.25 * (1.0 - rr) * (1.0 - ss * ss) * (1.0 + tt);\n"
"";
