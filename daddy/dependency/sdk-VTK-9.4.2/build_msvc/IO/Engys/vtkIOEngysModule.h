
#ifndef VTKIOENGYS_EXPORT_H
#define VTKIOENGYS_EXPORT_H

#ifdef VTKIOENGYS_STATIC_DEFINE
#  define VTKIOENGYS_EXPORT
#  define VTKIOENGYS_NO_EXPORT
#else
#  ifndef VTKIOENGYS_EXPORT
#    ifdef IOEngys_EXPORTS
        /* We are building this library */
#      define VTKIOENGYS_EXPORT __declspec(dllexport)
#    else
        /* We are using this library */
#      define VTKIOENGYS_EXPORT __declspec(dllimport)
#    endif
#  endif

#  ifndef VTKIOENGYS_NO_EXPORT
#    define VTKIOENGYS_NO_EXPORT 
#  endif
#endif

#ifndef VTKIOENGYS_DEPRECATED
#  define VTKIOENGYS_DEPRECATED __declspec(deprecated)
#endif

#ifndef VTKIOENGYS_DEPRECATED_EXPORT
#  define VTKIOENGYS_DEPRECATED_EXPORT VTKIOENGYS_EXPORT VTKIOENGYS_DEPRECATED
#endif

#ifndef VTKIOENGYS_DEPRECATED_NO_EXPORT
#  define VTKIOENGYS_DEPRECATED_NO_EXPORT VTKIOENGYS_NO_EXPORT VTKIOENGYS_DEPRECATED
#endif

/* NOLINTNEXTLINE(readability-avoid-unconditional-preprocessor-if) */
#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOENGYS_NO_DEPRECATED
#    define VTKIOENGYS_NO_DEPRECATED
#  endif
#endif

/* VTK-HeaderTest-Exclude: vtkIOEngysModule.h */

/* Include ABI Namespace */
#include "vtkABINamespace.h"

/* AutoInit implementations. */
#ifdef vtkIOEngys_AUTOINIT_INCLUDE
#include vtkIOEngys_AUTOINIT_INCLUDE
#endif
#ifdef vtkIOEngys_AUTOINIT
#include "vtkAutoInit.h"
VTK_MODULE_AUTOINIT(vtkIOEngys)
#endif

#endif /* VTKIOENGYS_EXPORT_H */
