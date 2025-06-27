// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_WdgC1Basis.h"

const char *Basis_HGrad_WdgC1Basis =
"basis[0] = (1.0 - rr - ss) * (1.0 - tt) / 2.0;\n"
"basis[1] = rr * (1.0 - tt) / 2.0;\n"
"basis[2] = ss * (1.0 - tt) / 2.0;\n"
"basis[3] = (1.0 - rr - ss) * (1.0 + tt) / 2.0;\n"
"basis[4] = rr * (1.0 + tt) / 2.0;\n"
"basis[5] = ss * (1.0 + tt) / 2.0;\n"
"";
