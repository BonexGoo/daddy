// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_QuadC2Basis.h"

const char *Basis_HGrad_QuadC2Basis =
"basis[0] = rr * (rr - 1.0) * ss * (ss - 1.0) / 4.0;\n"
"basis[1] = rr * (rr + 1.0) * ss * (ss - 1.0) / 4.0;\n"
"basis[2] = rr * (rr + 1.0) * ss * (ss + 1.0) / 4.0;\n"
"basis[3] = rr * (rr - 1.0) * ss * (ss + 1.0) / 4.0;\n"
"// edge midpoints basis functions\n"
"basis[4] = (1.0 - rr) * (1.0 + rr) * ss * (ss - 1.0) / 2.0;\n"
"basis[5] = rr * (rr + 1.0) * (1.0 - ss) * (1.0 + ss) / 2.0;\n"
"basis[6] = (1.0 - rr) * (1.0 + rr) * ss * (ss + 1.0) / 2.0;\n"
"basis[7] = rr * (rr - 1.0) * (1.0 - ss) * (1.0 + ss) / 2.0;\n"
"// quad bubble basis function\n"
"basis[8] = (1.0 - rr) * (1.0 + rr) * (1.0 - ss) * (1.0 + ss);\n"
"";
