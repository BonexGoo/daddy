# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkIOExport-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkIOExport-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkIOExport-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkIOExport-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkIOExport-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkIOExport-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkIOExport-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkIOExport-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkIOExport-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkIOExport-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkGLTFExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkIVExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONRenderWindowExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONSceneExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkOBJExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkOOGLExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkPOVExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBLight.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBProperty.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSVGContextDevice2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSVGExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSingleVTPExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkVRMLExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterFIWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterXMLWriter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkGLTFExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkIVExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONRenderWindowExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONSceneExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkOBJExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkOOGLExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkPOVExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBLight.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBProperty.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSVGContextDevice2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSVGExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSingleVTPExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkVRMLExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterFIWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterXMLWriter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkGLTFExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkIVExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONRenderWindowExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONSceneExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkOBJExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkOOGLExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkPOVExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBLight.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBProperty.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSVGContextDevice2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSVGExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSingleVTPExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkVRMLExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterFIWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterXMLWriter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkGLTFExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkIVExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONRenderWindowExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkJSONSceneExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkOBJExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkOOGLExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkPOVExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBLight.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkRIBProperty.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSVGContextDevice2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSVGExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkSingleVTPExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkVRMLExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterFIWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/vtkX3DExporterXMLWriter.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Export/vtkIOExportModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Export/vtkIOExportModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Export/vtkIOExportModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Export/vtkIOExportModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkIOExport" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Export/LICENSE")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Export/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
