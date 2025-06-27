// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "Basis_HGrad_WdgC2Basis.h"

const char *Basis_HGrad_WdgC2Basis =
"basis[0] = ((-1. + rr + ss) * (-1. + 2. * rr + 2. * ss) * (-1. + tt) * tt) / 2.;\n"
"basis[1] = (rr * (-1. + 2. * rr) * (-1. + tt) * tt) / 2.;\n"
"basis[2] = (ss * (-1. + 2. * ss) * (-1. + tt) * tt) / 2.;\n"
"basis[3] = ((-1. + rr + ss) * (-1. + 2. * rr + 2. * ss) * tt * (1. + tt)) / 2.;\n"
"basis[4] = (rr * (-1. + 2. * rr) * tt * (1. + tt)) / 2.;\n"
"basis[5] = (ss * (-1. + 2. * ss) * tt * (1. + tt)) / 2.;\n"
"\n"
"basis[6] = -2. * rr * (-1. + rr + ss) * (-1. + tt) * tt;\n"
"basis[7] = 2. * rr * ss * (-1. + tt) * tt;\n"
"basis[8] = -2. * ss * (-1. + rr + ss) * (-1. + tt) * tt;\n"
"basis[9] = -((-1. + rr + ss) * (-1. + 2. * rr + 2. * ss) * (-1. + tt) * (1. + tt));\n"
"basis[10] = -(rr * (-1. + 2. * rr) * (-1. + tt) * (1. + tt));\n"
"basis[11] = -(ss * (-1. + 2. * ss) * (-1. + tt) * (1. + tt));\n"
"basis[12] = -2. * rr * (-1. + rr + ss) * tt * (1. + tt);\n"
"basis[13] = 2. * rr * ss * tt * (1. + tt);\n"
"basis[14] = -2. * ss * (-1. + rr + ss) * tt * (1. + tt);\n"
"basis[15] = 4. * rr * (-1. + rr + ss) * (-1. + tt) * (1. + tt);\n"
"basis[16] = -4. * rr * ss * (-1. + tt) * (1. + tt);\n"
"basis[17] = 4. * ss * (-1. + rr + ss) * (-1. + tt) * (1. + tt);\n"
"";
