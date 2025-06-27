// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_TetC2Basis.h"

const char *Basis_HGrad_TetC2Basis =
"basis[0] = (-1. + rr + ss + tt) * (-1. + 2. * rr + 2. * ss + 2. * tt);\n"
"basis[1] = rr * (-1. + 2. * rr);\n"
"basis[2] = ss * (-1. + 2. * ss);\n"
"basis[3] = tt * (-1. + 2. * tt);\n"
"\n"
"basis[4] = -4. * rr * (-1. + rr + ss + tt);\n"
"basis[5] = 4. * rr * ss;\n"
"basis[6] = -4. * ss * (-1. + rr + ss + tt);\n"
"basis[7] = -4. * tt * (-1. + rr + ss + tt);\n"
"basis[8] = 4. * rr * tt;\n"
"basis[9] = 4. * ss * tt;\n"
"";
