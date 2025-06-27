# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkIOLegacy-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkIOLegacy-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkIOLegacy-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkIOLegacy-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkIOLegacy-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkIOLegacy-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkIOLegacy-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkIOLegacy-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkIOLegacy-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkIOLegacy-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkCompositeDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkCompositeDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataSetReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGenericDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGenericDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGraphWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkLegacyCellGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkLegacyCellGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPixelExtentIO.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPolyDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkRectilinearGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkSimplePointsReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkSimplePointsWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredPointsReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredPointsWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTableWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkUnstructuredGridWriter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkCompositeDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkCompositeDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataSetReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGenericDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGenericDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGraphWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkLegacyCellGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkLegacyCellGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPixelExtentIO.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPolyDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkRectilinearGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkSimplePointsReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkSimplePointsWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredPointsReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredPointsWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTableWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkUnstructuredGridWriter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkCompositeDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkCompositeDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataSetReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGenericDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGenericDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGraphWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkLegacyCellGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkLegacyCellGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPixelExtentIO.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPolyDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkRectilinearGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkSimplePointsReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkSimplePointsWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredPointsReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredPointsWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTableWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkUnstructuredGridWriter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkCompositeDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkCompositeDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataSetReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGenericDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGenericDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkGraphWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkLegacyCellGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkLegacyCellGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPixelExtentIO.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkPolyDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkRectilinearGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkSimplePointsReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkSimplePointsWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredPointsReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkStructuredPointsWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTableWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Legacy/vtkUnstructuredGridWriter.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Legacy/vtkIOLegacyModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Legacy/vtkIOLegacyModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Legacy/vtkIOLegacyModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Legacy/vtkIOLegacyModule.h")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Legacy/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
