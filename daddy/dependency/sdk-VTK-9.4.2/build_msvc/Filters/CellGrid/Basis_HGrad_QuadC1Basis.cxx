// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_QuadC1Basis.h"

const char *Basis_HGrad_QuadC1Basis =
"basis[0] = (1.0 - rr) * (1.0 - ss) / 4.0;\n"
"basis[1] = (1.0 + rr) * (1.0 - ss) / 4.0;\n"
"basis[2] = (1.0 + rr) * (1.0 + ss) / 4.0;\n"
"basis[3] = (1.0 - rr) * (1.0 + ss) / 4.0;\n"
"";
