# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkFiltersGeometry-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkFiltersGeometry-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkFiltersGeometry-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkFiltersGeometry-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkFiltersGeometry-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkFiltersGeometry-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkFiltersGeometry-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkFiltersGeometry-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkFiltersGeometry-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkFiltersGeometry-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkAbstractGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkAttributeSmoothingFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkCompositeDataGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkDataSetRegionSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkDataSetSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkExplicitStructuredGridSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkHierarchicalDataSetGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkImageDataGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkImageDataToUniformGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkLinearToQuadraticCellsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkMarkBoundaryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkProjectSphereFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRecoverGeometryWireframe.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRectilinearGridGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRectilinearGridPartitioner.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredAMRGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredAMRNeighbor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridPartitioner.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredNeighbor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredPointsGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkUnstructuredGridGeometryFilter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkAbstractGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkAttributeSmoothingFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkCompositeDataGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkDataSetRegionSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkDataSetSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkExplicitStructuredGridSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkHierarchicalDataSetGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkImageDataGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkImageDataToUniformGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkLinearToQuadraticCellsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkMarkBoundaryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkProjectSphereFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRecoverGeometryWireframe.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRectilinearGridGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRectilinearGridPartitioner.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredAMRGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredAMRNeighbor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridPartitioner.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredNeighbor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredPointsGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkUnstructuredGridGeometryFilter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkAbstractGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkAttributeSmoothingFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkCompositeDataGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkDataSetRegionSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkDataSetSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkExplicitStructuredGridSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkHierarchicalDataSetGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkImageDataGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkImageDataToUniformGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkLinearToQuadraticCellsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkMarkBoundaryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkProjectSphereFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRecoverGeometryWireframe.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRectilinearGridGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRectilinearGridPartitioner.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredAMRGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredAMRNeighbor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridPartitioner.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredNeighbor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredPointsGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkUnstructuredGridGeometryFilter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkAbstractGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkAttributeSmoothingFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkCompositeDataGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkDataSetRegionSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkDataSetSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkExplicitStructuredGridSurfaceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkHierarchicalDataSetGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkImageDataGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkImageDataToUniformGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkLinearToQuadraticCellsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkMarkBoundaryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkProjectSphereFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRecoverGeometryWireframe.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRectilinearGridGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkRectilinearGridPartitioner.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredAMRGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredAMRNeighbor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridConnectivity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredGridPartitioner.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredNeighbor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkStructuredPointsGeometryFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/vtkUnstructuredGridGeometryFilter.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Geometry/vtkFiltersGeometryModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Geometry/vtkFiltersGeometryModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Geometry/vtkFiltersGeometryModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Geometry/vtkFiltersGeometryModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkFiltersGeometry" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Geometry/LICENSE")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Geometry/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
