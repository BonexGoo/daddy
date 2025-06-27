// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_PyrC1Basis.h"

const char *Basis_HGrad_PyrC1Basis =
"if (abs(tt - 1.0) < eps)\n"
"{\n"
"  if (tt <= 1.0)\n"
"  {\n"
"    tt = 1.0 - eps;\n"
"  }\n"
"  else\n"
"  {\n"
"    tt = 1.0 + eps;\n"
"  }\n"
"}\n"
"\n"
"RealT ttTerm = 0.25 / (1.0 - tt);\n"
"\n"
"basis[0] = (1.0 - rr - tt) * (1.0 - ss - tt) * ttTerm;\n"
"basis[1] = (1.0 + rr - tt) * (1.0 - ss - tt) * ttTerm;\n"
"basis[2] = (1.0 + rr - tt) * (1.0 + ss - tt) * ttTerm;\n"
"basis[3] = (1.0 - rr - tt) * (1.0 + ss - tt) * ttTerm;\n"
"basis[4] = tt;\n"
"";
