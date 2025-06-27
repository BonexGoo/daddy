// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_EdgeC2Basis.h"

const char *Basis_HGrad_EdgeC2Basis =
"basis[0] = 0.5 * (1.0 - rr) * rr;\n"
"basis[1] = 0.5 * (1.0 + rr) * rr;\n"
"basis[2] = (1.0 - rr) * (1.0 + rr);\n"
"";
