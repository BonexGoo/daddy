// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HDiv_WdgI1Basis.h"

const char *Basis_HDiv_WdgI1Basis =
"// Intrepid2\n"
"basis[0 * 3 + 0] = rr * 2.0;\n"
"basis[0 * 3 + 1] = (ss - 1.0) * 2.0;\n"
"basis[0 * 3 + 2] = 0.0;\n"
"\n"
"basis[1 * 3 + 0] = rr * 2.0;\n"
"basis[1 * 3 + 1] = ss * 2.0;\n"
"basis[1 * 3 + 2] = 0.0;\n"
"\n"
"basis[2 * 3 + 0] = (rr - 1.0) * 2.0;\n"
"basis[2 * 3 + 1] = ss * 2.0;\n"
"basis[2 * 3 + 2] = 0.0;\n"
"\n"
"basis[3 * 3 + 0] = 0.0;\n"
"basis[3 * 3 + 1] = 0.0;\n"
"basis[3 * 3 + 2] = (tt - 1.0) / 2.0;\n"
"\n"
"basis[4 * 3 + 0] = 0.0;\n"
"basis[4 * 3 + 1] = 0.0;\n"
"basis[4 * 3 + 2] = (1.0 + tt) / 2.0;\n"
"";
