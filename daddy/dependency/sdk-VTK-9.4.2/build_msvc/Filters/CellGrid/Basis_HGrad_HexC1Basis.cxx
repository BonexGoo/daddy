// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_HexC1Basis.h"

const char *Basis_HGrad_HexC1Basis =
"basis[0] = (1.0 - rr) * (1.0 - ss) * (1.0 - tt) / 8.0;\n"
"basis[1] = (1.0 + rr) * (1.0 - ss) * (1.0 - tt) / 8.0;\n"
"basis[2] = (1.0 + rr) * (1.0 + ss) * (1.0 - tt) / 8.0;\n"
"basis[3] = (1.0 - rr) * (1.0 + ss) * (1.0 - tt) / 8.0;\n"
"\n"
"basis[4] = (1.0 - rr) * (1.0 - ss) * (1.0 + tt) / 8.0;\n"
"basis[5] = (1.0 + rr) * (1.0 - ss) * (1.0 + tt) / 8.0;\n"
"basis[6] = (1.0 + rr) * (1.0 + ss) * (1.0 + tt) / 8.0;\n"
"basis[7] = (1.0 - rr) * (1.0 + ss) * (1.0 + tt) / 8.0;\n"
"";
