# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkRenderingVolume-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkRenderingVolume-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkRenderingVolume-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkRenderingVolume-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkRenderingVolume-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkRenderingVolume-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkRenderingVolume-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkRenderingVolume-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkRenderingVolume-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkRenderingVolume-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkBlockSortHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkEncodedGradientEstimator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkEncodedGradientShader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFiniteDifferenceGradientEstimator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointRayCastImage.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeGOHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeShadeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastMIPHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkGPUVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkMultiVolume.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkOSPRayVolumeInterface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkAnariVolumeInterface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkProjectedTetrahedraMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkRayCastImageDisplayHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkRecursiveSphereDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkSphericalDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridBunykRayCastFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridHomogeneousRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridLinearRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridPartialPreIntegration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridPreIntegration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeZSweepMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeOutlineSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumePicker.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeRayCastSpaceLeapingImageFilter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkBlockSortHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkEncodedGradientEstimator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkEncodedGradientShader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFiniteDifferenceGradientEstimator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointRayCastImage.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeGOHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeShadeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastMIPHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkGPUVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkMultiVolume.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkOSPRayVolumeInterface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkAnariVolumeInterface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkProjectedTetrahedraMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkRayCastImageDisplayHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkRecursiveSphereDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkSphericalDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridBunykRayCastFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridHomogeneousRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridLinearRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridPartialPreIntegration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridPreIntegration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeZSweepMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeOutlineSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumePicker.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeRayCastSpaceLeapingImageFilter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkBlockSortHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkEncodedGradientEstimator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkEncodedGradientShader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFiniteDifferenceGradientEstimator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointRayCastImage.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeGOHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeShadeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastMIPHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkGPUVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkMultiVolume.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkOSPRayVolumeInterface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkAnariVolumeInterface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkProjectedTetrahedraMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkRayCastImageDisplayHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkRecursiveSphereDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkSphericalDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridBunykRayCastFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridHomogeneousRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridLinearRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridPartialPreIntegration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridPreIntegration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeZSweepMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeOutlineSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumePicker.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeRayCastSpaceLeapingImageFilter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkBlockSortHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkEncodedGradientEstimator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkEncodedGradientShader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFiniteDifferenceGradientEstimator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointRayCastImage.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeGOHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeShadeHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkFixedPointVolumeRayCastMIPHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkGPUVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkMultiVolume.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkOSPRayVolumeInterface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkAnariVolumeInterface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkProjectedTetrahedraMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkRayCastImageDisplayHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkRecursiveSphereDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkSphericalDirectionEncoder.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridBunykRayCastFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridHomogeneousRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridLinearRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridPartialPreIntegration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridPreIntegration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastFunction.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeRayIntegrator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkUnstructuredGridVolumeZSweepMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeOutlineSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumePicker.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/vtkVolumeRayCastSpaceLeapingImageFilter.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/Volume/vtkRenderingVolumeModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/Volume/vtkRenderingVolumeModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/Volume/vtkRenderingVolumeModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/Volume/vtkRenderingVolumeModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkRenderingVolume" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/Volume/LICENSE")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/Volume/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
