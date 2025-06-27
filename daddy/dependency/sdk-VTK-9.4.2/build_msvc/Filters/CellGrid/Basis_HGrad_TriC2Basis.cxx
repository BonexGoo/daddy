// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_TriC2Basis.h"

const char *Basis_HGrad_TriC2Basis =
"basis[0] = (rr + ss - 1.0) * (2.0 * rr + 2.0 * ss - 1.0);\n"
"basis[1] = rr * (2.0 * rr - 1.0);\n"
"basis[2] = ss * (2.0 * ss - 1.0);\n"
"basis[3] = -4.0 * rr * (rr + ss - 1.0);\n"
"basis[4] = 4.0 * rr * ss;\n"
"basis[5] = -4.0 * ss * (rr + ss - 1.0);\n"
"";
