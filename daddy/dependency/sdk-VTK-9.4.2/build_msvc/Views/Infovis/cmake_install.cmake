# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkViewsInfovis-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkViewsInfovis-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkViewsInfovis-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkViewsInfovis-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkViewsInfovis-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkViewsInfovis-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkViewsInfovis-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkViewsInfovis-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkViewsInfovis-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkViewsInfovis-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkApplyColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkApplyIcons.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkDendrogramItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkGraphItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkGraphLayoutView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHeatmapItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHierarchicalGraphPipeline.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHierarchicalGraphView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkIcicleView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkInteractorStyleAreaSelectHover.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkInteractorStyleTreeMapHover.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesHistogramRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedGraphRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedHierarchyRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedSurfaceRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedTreeAreaRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkSCurveSpline.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTanglegramItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeAreaView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeHeatmapItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeMapView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeRingView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkViewUpdater.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkApplyColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkApplyIcons.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkDendrogramItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkGraphItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkGraphLayoutView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHeatmapItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHierarchicalGraphPipeline.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHierarchicalGraphView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkIcicleView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkInteractorStyleAreaSelectHover.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkInteractorStyleTreeMapHover.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesHistogramRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedGraphRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedHierarchyRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedSurfaceRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedTreeAreaRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkSCurveSpline.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTanglegramItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeAreaView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeHeatmapItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeMapView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeRingView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkViewUpdater.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkApplyColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkApplyIcons.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkDendrogramItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkGraphItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkGraphLayoutView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHeatmapItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHierarchicalGraphPipeline.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHierarchicalGraphView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkIcicleView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkInteractorStyleAreaSelectHover.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkInteractorStyleTreeMapHover.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesHistogramRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedGraphRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedHierarchyRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedSurfaceRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedTreeAreaRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkSCurveSpline.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTanglegramItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeAreaView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeHeatmapItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeMapView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeRingView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkViewUpdater.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkApplyColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkApplyIcons.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkDendrogramItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkGraphItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkGraphLayoutView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHeatmapItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHierarchicalGraphPipeline.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkHierarchicalGraphView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkIcicleView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkInteractorStyleAreaSelectHover.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkInteractorStyleTreeMapHover.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesHistogramRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkParallelCoordinatesView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedGraphRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedHierarchyRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedSurfaceRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderedTreeAreaRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkRenderView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkSCurveSpline.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTanglegramItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeAreaView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeHeatmapItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeMapView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkTreeRingView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/vtkViewUpdater.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Views/Infovis/vtkViewsInfovisModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Views/Infovis/vtkViewsInfovisModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Views/Infovis/vtkViewsInfovisModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Views/Infovis/vtkViewsInfovisModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkViewsInfovis" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Views/Infovis/LICENSE")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Views/Infovis/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
