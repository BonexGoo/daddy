# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkFiltersPoints-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkFiltersPoints-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkFiltersPoints-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkFiltersPoints-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkFiltersPoints-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkFiltersPoints-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkFiltersPoints-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkFiltersPoints-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkFiltersPoints-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkFiltersPoints-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkBoundedPointSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkConnectedPointsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkConvertToPointCloud.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkDensifyPointCloudFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkEllipsoidalGaussianKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkEuclideanClusterExtraction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractEnclosedPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractHierarchicalBins.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractPointCloudPiece.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkFitImplicitFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkGaussianKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkGeneralizedKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkHierarchicalBinningFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkInterpolationKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkLinearKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkMaskPointsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPCACurvatureEstimation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPCANormalEstimation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointCloudFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointDensityFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointInterpolator2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointOccupancyFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointSmoothingFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPoissonDiskSampler.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkProbabilisticVoronoiKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkProjectPointsToPlane.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkRadiusOutlierRemoval.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHCubicKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHQuarticKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHQuinticKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkShepardKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSignedDistance.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkStatisticalOutlierRemoval.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkUnsignedDistance.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkVoronoiKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkVoxelGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkWendlandQuinticKernel.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkBoundedPointSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkConnectedPointsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkConvertToPointCloud.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkDensifyPointCloudFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkEllipsoidalGaussianKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkEuclideanClusterExtraction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractEnclosedPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractHierarchicalBins.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractPointCloudPiece.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkFitImplicitFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkGaussianKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkGeneralizedKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkHierarchicalBinningFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkInterpolationKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkLinearKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkMaskPointsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPCACurvatureEstimation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPCANormalEstimation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointCloudFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointDensityFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointInterpolator2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointOccupancyFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointSmoothingFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPoissonDiskSampler.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkProbabilisticVoronoiKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkProjectPointsToPlane.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkRadiusOutlierRemoval.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHCubicKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHQuarticKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHQuinticKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkShepardKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSignedDistance.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkStatisticalOutlierRemoval.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkUnsignedDistance.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkVoronoiKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkVoxelGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkWendlandQuinticKernel.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkBoundedPointSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkConnectedPointsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkConvertToPointCloud.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkDensifyPointCloudFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkEllipsoidalGaussianKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkEuclideanClusterExtraction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractEnclosedPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractHierarchicalBins.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractPointCloudPiece.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkFitImplicitFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkGaussianKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkGeneralizedKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkHierarchicalBinningFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkInterpolationKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkLinearKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkMaskPointsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPCACurvatureEstimation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPCANormalEstimation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointCloudFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointDensityFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointInterpolator2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointOccupancyFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointSmoothingFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPoissonDiskSampler.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkProbabilisticVoronoiKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkProjectPointsToPlane.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkRadiusOutlierRemoval.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHCubicKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHQuarticKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHQuinticKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkShepardKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSignedDistance.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkStatisticalOutlierRemoval.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkUnsignedDistance.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkVoronoiKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkVoxelGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkWendlandQuinticKernel.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkBoundedPointSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkConnectedPointsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkConvertToPointCloud.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkDensifyPointCloudFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkEllipsoidalGaussianKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkEuclideanClusterExtraction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractEnclosedPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractHierarchicalBins.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractPointCloudPiece.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractPoints.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkExtractSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkFitImplicitFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkGaussianKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkGeneralizedKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkHierarchicalBinningFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkInterpolationKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkLinearKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkMaskPointsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPCACurvatureEstimation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPCANormalEstimation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointCloudFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointDensityFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointInterpolator2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointOccupancyFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPointSmoothingFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkPoissonDiskSampler.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkProbabilisticVoronoiKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkProjectPointsToPlane.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkRadiusOutlierRemoval.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHCubicKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHQuarticKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSPHQuinticKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkShepardKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkSignedDistance.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkStatisticalOutlierRemoval.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkUnsignedDistance.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkVoronoiKernel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkVoxelGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Points/vtkWendlandQuinticKernel.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Points/vtkFiltersPointsModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Points/vtkFiltersPointsModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Points/vtkFiltersPointsModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Points/vtkFiltersPointsModule.h")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Points/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
