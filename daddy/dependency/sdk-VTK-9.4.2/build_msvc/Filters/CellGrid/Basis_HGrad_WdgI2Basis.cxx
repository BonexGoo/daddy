// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_WdgI2Basis.h"

const char *Basis_HGrad_WdgI2Basis =
"RealT ww = 1.0 - rr - ss;\n"
"\n"
"basis[0] = 0.5 * ww * (2.0 * ww - 2.0 - tt) * (1.0 - tt);\n"
"basis[1] = 0.5 * rr * (2.0 * rr - 2.0 - tt) * (1.0 - tt);\n"
"basis[2] = 0.5 * ss * (2.0 * ss - 2.0 - tt) * (1.0 - tt);\n"
"basis[3] = 0.5 * ww * (2.0 * ww - 2.0 + tt) * (1.0 + tt);\n"
"basis[4] = 0.5 * rr * (2.0 * rr - 2.0 + tt) * (1.0 + tt);\n"
"basis[5] = 0.5 * ss * (2.0 * ss - 2.0 + tt) * (1.0 + tt);\n"
"\n"
"basis[6] = 2.0 * ww * rr * (1.0 - tt);\n"
"basis[7] = 2.0 * rr * ss * (1.0 - tt);\n"
"basis[8] = 2.0 * ss * ww * (1.0 - tt);\n"
"basis[9] = ww * (1.0 - tt * tt);\n"
"basis[10] = rr * (1.0 - tt * tt);\n"
"basis[11] = ss * (1.0 - tt * tt);\n"
"basis[12] = 2.0 * ww * rr * (1.0 + tt);\n"
"basis[13] = 2.0 * rr * ss * (1.0 + tt);\n"
"basis[14] = 2.0 * ss * ww * (1.0 + tt);\n"
"";
