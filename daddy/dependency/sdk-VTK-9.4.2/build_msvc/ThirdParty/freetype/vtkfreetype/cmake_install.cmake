# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files/VTK")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkfreetype-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkfreetype-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkfreetype-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkfreetype-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkfreetype-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkfreetype-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkfreetype-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkfreetype-9.4.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/vtkfreetype/include" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/ft2build.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/vtk_freetype_mangle.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/vtkfreetype/include/freetype" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/freetype.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftadvanc.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftbbox.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftbdf.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftbitmap.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftbzip2.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftcache.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftcid.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftcolor.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftdriver.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/fterrdef.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/fterrors.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftfntfmt.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftgasp.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftglyph.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftgxval.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftgzip.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftimage.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftincrem.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftlcdfil.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftlist.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftlogging.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftlzw.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftmac.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftmm.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftmodapi.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftmoderr.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftotval.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftoutln.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftparams.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftpfr.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftrender.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftsizes.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftsnames.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftstroke.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftsynth.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftsystem.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/fttrigon.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/fttypes.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ftwinfnt.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/t1tables.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/ttnameid.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/tttables.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/tttags.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/vtkfreetype/include/freetype/config" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/config/ftconfig.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/config/ftheader.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/config/ftmodule.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/config/ftoption.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/config/ftstdlib.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/config/integer-types.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/config/mac-support.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/freetype/vtkfreetype/include/freetype/config/public-macros.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/ThirdParty/freetype/vtkfreetype/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
