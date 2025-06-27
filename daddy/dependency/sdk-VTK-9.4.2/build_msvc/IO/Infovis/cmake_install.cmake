# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkIOInfovis-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkIOInfovis-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkIOInfovis-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkIOInfovis-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkIOInfovis-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkIOInfovis-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkIOInfovis-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkIOInfovis-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkIOInfovis-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkIOInfovis-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkBiomTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkChacoGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDelimitedTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDIMACSGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDIMACSGraphWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkFixedWidthTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkISIReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkMultiNewickTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkNewickTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkNewickTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkPhyloXMLTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkPhyloXMLTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkRISReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkTemporalDelimitedTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkTulipReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkXGMLReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkXMLTreeReader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkBiomTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkChacoGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDelimitedTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDIMACSGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDIMACSGraphWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkFixedWidthTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkISIReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkMultiNewickTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkNewickTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkNewickTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkPhyloXMLTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkPhyloXMLTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkRISReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkTemporalDelimitedTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkTulipReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkXGMLReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkXMLTreeReader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkBiomTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkChacoGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDelimitedTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDIMACSGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDIMACSGraphWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkFixedWidthTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkISIReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkMultiNewickTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkNewickTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkNewickTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkPhyloXMLTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkPhyloXMLTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkRISReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkTemporalDelimitedTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkTulipReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkXGMLReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkXMLTreeReader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkBiomTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkChacoGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDelimitedTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDIMACSGraphReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkDIMACSGraphWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkFixedWidthTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkISIReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkMultiNewickTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkNewickTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkNewickTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkPhyloXMLTreeReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkPhyloXMLTreeWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkRISReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkTemporalDelimitedTextReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkTulipReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkXGMLReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/vtkXMLTreeReader.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Infovis/vtkIOInfovisModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Infovis/vtkIOInfovisModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Infovis/vtkIOInfovisModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Infovis/vtkIOInfovisModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkIOInfovis" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Infovis/LICENSE")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Infovis/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
