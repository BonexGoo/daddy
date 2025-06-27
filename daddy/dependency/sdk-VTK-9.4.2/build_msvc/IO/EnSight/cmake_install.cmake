# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkIOEnSight-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkIOEnSight-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkIOEnSight-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkIOEnSight-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkIOEnSight-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkIOEnSight-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkIOEnSight-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkIOEnSight-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkIOEnSight-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkIOEnSight-9.4.dll")
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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSight6BinaryReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSight6Reader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldBinaryReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldCombinedReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightMasterServerReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightSOSGoldReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkGenericEnSightReader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSight6BinaryReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSight6Reader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldBinaryReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldCombinedReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightMasterServerReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightSOSGoldReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkGenericEnSightReader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSight6BinaryReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSight6Reader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldBinaryReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldCombinedReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightMasterServerReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightSOSGoldReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkGenericEnSightReader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSight6BinaryReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSight6Reader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldBinaryReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldCombinedReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightGoldReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightMasterServerReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkEnSightSOSGoldReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/EnSight/vtkGenericEnSightReader.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/EnSight/vtkIOEnSightModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/EnSight/vtkIOEnSightModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/EnSight/vtkIOEnSightModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/EnSight/vtkIOEnSightModule.h")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/EnSight/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
