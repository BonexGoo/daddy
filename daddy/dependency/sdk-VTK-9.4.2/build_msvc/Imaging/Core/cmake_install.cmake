# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkImagingCore-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkImagingCore-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkImagingCore-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkImagingCore-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkImagingCore-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkImagingCore-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkImagingCore-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkImagingCore-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkImagingCore-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkImagingCore-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkAbstractImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkExtractVOI.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkGenericImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageAppendComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBlend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineCoefficients.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineInternals.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageCacheFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageCast.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageChangeInformation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageClip.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageConstantPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDataStreamer.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDecomposeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDifference.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageExtractComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageFlip.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageIterateFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMagnify.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMapToColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMask.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMirrorPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePadFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePermute.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePointDataIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePointIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageProbeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResample.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResize.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageReslice.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResliceToColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageShiftScale.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageShrink3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageSincInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilAlgorithm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageSSIM.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageThreshold.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageTranslateExtent.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageWrapPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkRTAnalyticSource.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkAbstractImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkExtractVOI.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkGenericImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageAppendComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBlend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineCoefficients.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineInternals.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageCacheFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageCast.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageChangeInformation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageClip.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageConstantPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDataStreamer.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDecomposeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDifference.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageExtractComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageFlip.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageIterateFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMagnify.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMapToColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMask.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMirrorPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePadFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePermute.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePointDataIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePointIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageProbeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResample.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResize.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageReslice.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResliceToColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageShiftScale.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageShrink3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageSincInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilAlgorithm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageSSIM.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageThreshold.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageTranslateExtent.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageWrapPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkRTAnalyticSource.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkAbstractImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkExtractVOI.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkGenericImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageAppendComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBlend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineCoefficients.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineInternals.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageCacheFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageCast.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageChangeInformation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageClip.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageConstantPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDataStreamer.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDecomposeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDifference.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageExtractComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageFlip.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageIterateFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMagnify.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMapToColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMask.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMirrorPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePadFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePermute.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePointDataIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePointIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageProbeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResample.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResize.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageReslice.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResliceToColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageShiftScale.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageShrink3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageSincInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilAlgorithm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageSSIM.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageThreshold.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageTranslateExtent.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageWrapPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkRTAnalyticSource.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkAbstractImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkExtractVOI.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkGenericImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageAppendComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBlend.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineCoefficients.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineInternals.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageBSplineInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageCacheFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageCast.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageChangeInformation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageClip.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageConstantPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDataStreamer.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDecomposeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageDifference.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageExtractComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageFlip.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageIterateFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMagnify.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMapToColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMask.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageMirrorPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePadFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePermute.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePointDataIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImagePointIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageProbeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResample.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResize.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageReslice.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageResliceToColors.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageShiftScale.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageShrink3D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageSincInterpolator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilAlgorithm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilIterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageStencilSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageSSIM.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageThreshold.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageTranslateExtent.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkImageWrapPad.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/vtkRTAnalyticSource.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Imaging/Core/vtkImagingCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Imaging/Core/vtkImagingCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Imaging/Core/vtkImagingCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Imaging/Core/vtkImagingCoreModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkImagingCore" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Imaging/Core/LICENSE")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Imaging/Core/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
