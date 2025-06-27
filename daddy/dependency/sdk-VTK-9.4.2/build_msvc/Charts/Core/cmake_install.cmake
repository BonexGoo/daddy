# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkChartsCore-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkChartsCore-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkChartsCore-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkChartsCore-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkChartsCore-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkChartsCore-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkChartsCore-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkChartsCore-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkChartsCore-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkChartsCore-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkAxis.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkAxisExtended.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCategoryLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChart.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartBox.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartHistogram2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartMatrix.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartParallelCoordinates.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartPie.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartXY.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartXYZ.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorTransferControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorTransferFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCompositeControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCompositeTransferFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkContextArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkContextPolygon.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkInteractiveArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkLookupTableItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewiseControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewiseFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewisePointHandleItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlot.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlot3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBar.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBarRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBox.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotFunctionalBag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotHistogram2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotLine.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotLine3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotParallelCoordinates.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPie.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPoints3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotStacked.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkScalarsToColorsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkScatterPlotMatrix.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkAxis.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkAxisExtended.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCategoryLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChart.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartBox.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartHistogram2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartMatrix.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartParallelCoordinates.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartPie.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartXY.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartXYZ.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorTransferControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorTransferFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCompositeControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCompositeTransferFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkContextArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkContextPolygon.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkInteractiveArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkLookupTableItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewiseControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewiseFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewisePointHandleItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlot.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlot3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBar.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBarRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBox.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotFunctionalBag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotHistogram2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotLine.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotLine3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotParallelCoordinates.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPie.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPoints3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotStacked.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkScalarsToColorsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkScatterPlotMatrix.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkAxis.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkAxisExtended.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCategoryLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChart.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartBox.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartHistogram2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartMatrix.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartParallelCoordinates.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartPie.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartXY.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartXYZ.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorTransferControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorTransferFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCompositeControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCompositeTransferFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkContextArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkContextPolygon.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkInteractiveArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkLookupTableItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewiseControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewiseFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewisePointHandleItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlot.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlot3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBar.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBarRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBox.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotFunctionalBag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotHistogram2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotLine.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotLine3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotParallelCoordinates.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPie.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPoints3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotStacked.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkScalarsToColorsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkScatterPlotMatrix.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkAxis.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkAxisExtended.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCategoryLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChart.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartBox.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartHistogram2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartMatrix.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartParallelCoordinates.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartPie.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartXY.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkChartXYZ.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorLegend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorTransferControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkColorTransferFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCompositeControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkCompositeTransferFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkContextArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkContextPolygon.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkInteractiveArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkLookupTableItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewiseControlPointsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewiseFunctionItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPiecewisePointHandleItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlot.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlot3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotArea.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBar.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBarRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotBox.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotFunctionalBag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotHistogram2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotLine.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotLine3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotParallelCoordinates.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPie.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotPoints3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotStacked.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkPlotSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkRangeHandlesItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkScalarsToColorsItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Charts/Core/vtkScatterPlotMatrix.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Charts/Core/vtkChartsCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Charts/Core/vtkChartsCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Charts/Core/vtkChartsCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Charts/Core/vtkChartsCoreModule.h")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Charts/Core/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
