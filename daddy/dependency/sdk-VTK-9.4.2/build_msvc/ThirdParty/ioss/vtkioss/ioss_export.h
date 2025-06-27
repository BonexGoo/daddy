
#ifndef IOSS_EXPORT_H
#define IOSS_EXPORT_H

#ifdef IOSS_STATIC_DEFINE
#  define IOSS_EXPORT
#  define IOSS_NO_EXPORT
#else
#  ifndef IOSS_EXPORT
#    ifdef ioss_EXPORTS
        /* We are building this library */
#      define IOSS_EXPORT __declspec(dllexport)
#    else
        /* We are using this library */
#      define IOSS_EXPORT __declspec(dllimport)
#    endif
#  endif

#  ifndef IOSS_NO_EXPORT
#    define IOSS_NO_EXPORT 
#  endif
#endif

#ifndef IOSS_DEPRECATED
#  define IOSS_DEPRECATED __declspec(deprecated)
#endif

#ifndef IOSS_DEPRECATED_EXPORT
#  define IOSS_DEPRECATED_EXPORT IOSS_EXPORT IOSS_DEPRECATED
#endif

#ifndef IOSS_DEPRECATED_NO_EXPORT
#  define IOSS_DEPRECATED_NO_EXPORT IOSS_NO_EXPORT IOSS_DEPRECATED
#endif

/* NOLINTNEXTLINE(readability-avoid-unconditional-preprocessor-if) */
#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef IOSS_NO_DEPRECATED
#    define IOSS_NO_DEPRECATED
#  endif
#endif

#endif /* IOSS_EXPORT_H */
