// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HCurl_TriI1Basis.h"

const char *Basis_HCurl_TriI1Basis =
"// Intrepid2\n"
"basis[0 * 3 + 0] = 2.0 * (1.0 - ss);\n"
"basis[0 * 3 + 1] = 2.0 * rr;\n"
"basis[0 * 3 + 2] = 0.0;\n"
"\n"
"basis[1 * 3 + 0] = -2.0 * ss;\n"
"basis[1 * 3 + 1] = 2.0 * rr;\n"
"basis[1 * 3 + 2] = 0.0;\n"
"\n"
"basis[2 * 3 + 0] = -2.0 * ss;\n"
"basis[2 * 3 + 1] = 2.0 * (-1.0 + rr);\n"
"basis[2 * 3 + 2] = 0.0;\n"
"";
