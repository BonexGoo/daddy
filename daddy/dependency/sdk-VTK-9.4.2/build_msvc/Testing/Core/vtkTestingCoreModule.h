
#ifndef VTKTESTINGCORE_EXPORT_H
#define VTKTESTINGCORE_EXPORT_H

#ifdef VTKTESTINGCORE_STATIC_DEFINE
#  define VTKTESTINGCORE_EXPORT
#  define VTKTESTINGCORE_NO_EXPORT
#else
#  ifndef VTKTESTINGCORE_EXPORT
#    ifdef TestingCore_EXPORTS
        /* We are building this library */
#      define VTKTESTINGCORE_EXPORT __declspec(dllexport)
#    else
        /* We are using this library */
#      define VTKTESTINGCORE_EXPORT __declspec(dllimport)
#    endif
#  endif

#  ifndef VTKTESTINGCORE_NO_EXPORT
#    define VTKTESTINGCORE_NO_EXPORT 
#  endif
#endif

#ifndef VTKTESTINGCORE_DEPRECATED
#  define VTKTESTINGCORE_DEPRECATED __declspec(deprecated)
#endif

#ifndef VTKTESTINGCORE_DEPRECATED_EXPORT
#  define VTKTESTINGCORE_DEPRECATED_EXPORT VTKTESTINGCORE_EXPORT VTKTESTINGCORE_DEPRECATED
#endif

#ifndef VTKTESTINGCORE_DEPRECATED_NO_EXPORT
#  define VTKTESTINGCORE_DEPRECATED_NO_EXPORT VTKTESTINGCORE_NO_EXPORT VTKTESTINGCORE_DEPRECATED
#endif

/* NOLINTNEXTLINE(readability-avoid-unconditional-preprocessor-if) */
#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKTESTINGCORE_NO_DEPRECATED
#    define VTKTESTINGCORE_NO_DEPRECATED
#  endif
#endif

/* VTK-HeaderTest-Exclude: vtkTestingCoreModule.h */

/* Include ABI Namespace */
#include "vtkABINamespace.h"

#endif /* VTKTESTINGCORE_EXPORT_H */
