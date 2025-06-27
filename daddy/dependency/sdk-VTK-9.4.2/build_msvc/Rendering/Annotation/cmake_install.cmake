# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkRenderingAnnotation-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkRenderingAnnotation-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkRenderingAnnotation-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkRenderingAnnotation-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkRenderingAnnotation-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkRenderingAnnotation-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkRenderingAnnotation-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkRenderingAnnotation-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkRenderingAnnotation-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkRenderingAnnotation-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAnnotatedCubeActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkArcPlotter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisFollower.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkBarChartActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCaptionActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkConvexHull2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCornerAnnotation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCubeAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCubeAxesActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkGraphAnnotationLayersFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLeaderActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLegendBoxActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLegendScaleActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkParallelCoordinatesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPieChartActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPolarAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPolarAxesActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkProp3DAxisFollower.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkRadialGridActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkScalarBarActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkSpiderPlotActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkXYPlotActor.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAnnotatedCubeActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkArcPlotter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisFollower.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkBarChartActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCaptionActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkConvexHull2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCornerAnnotation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCubeAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCubeAxesActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkGraphAnnotationLayersFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLeaderActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLegendBoxActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLegendScaleActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkParallelCoordinatesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPieChartActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPolarAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPolarAxesActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkProp3DAxisFollower.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkRadialGridActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkScalarBarActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkSpiderPlotActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkXYPlotActor.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAnnotatedCubeActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkArcPlotter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisFollower.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkBarChartActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCaptionActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkConvexHull2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCornerAnnotation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCubeAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCubeAxesActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkGraphAnnotationLayersFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLeaderActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLegendBoxActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLegendScaleActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkParallelCoordinatesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPieChartActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPolarAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPolarAxesActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkProp3DAxisFollower.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkRadialGridActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkScalarBarActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkSpiderPlotActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkXYPlotActor.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAnnotatedCubeActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkArcPlotter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkAxisFollower.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkBarChartActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCaptionActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkConvexHull2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCornerAnnotation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCubeAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkCubeAxesActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkGraphAnnotationLayersFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLeaderActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLegendBoxActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkLegendScaleActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkParallelCoordinatesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPieChartActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPolarAxesActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkPolarAxesActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkProp3DAxisFollower.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkRadialGridActor2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkScalarBarActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkSpiderPlotActor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkXYPlotActor.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkScalarBarActorInternal.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/Annotation/vtkRenderingAnnotationModule.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkScalarBarActorInternal.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/Annotation/vtkRenderingAnnotationModule.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkScalarBarActorInternal.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/Annotation/vtkRenderingAnnotationModule.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Annotation/vtkScalarBarActorInternal.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/Annotation/vtkRenderingAnnotationModule.h"
      )
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/Annotation/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
