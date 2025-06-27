# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkmetaio-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkmetaio-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkmetaio-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkmetaio-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkmetaio-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkmetaio-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkmetaio-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkmetaio-9.4.dll")
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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/vtkmetaio" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/localMetaConfiguration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaArrow.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaBlob.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaCommand.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaContour.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaDTITube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaEllipse.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaEvent.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaFEMObject.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaForm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaGaussian.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaGroup.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImage.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImageTypes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImageUtils.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaLandmark.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaLine.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaMesh.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaObject.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaScene.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTransform.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTubeGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTypes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaUtils.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaVesselTube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Utilities/MetaIO/vtkmetaio/metaIOConfig.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/vtkmetaio" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/localMetaConfiguration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaArrow.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaBlob.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaCommand.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaContour.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaDTITube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaEllipse.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaEvent.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaFEMObject.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaForm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaGaussian.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaGroup.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImage.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImageTypes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImageUtils.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaLandmark.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaLine.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaMesh.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaObject.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaScene.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTransform.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTubeGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTypes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaUtils.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaVesselTube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Utilities/MetaIO/vtkmetaio/metaIOConfig.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/vtkmetaio" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/localMetaConfiguration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaArrow.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaBlob.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaCommand.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaContour.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaDTITube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaEllipse.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaEvent.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaFEMObject.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaForm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaGaussian.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaGroup.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImage.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImageTypes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImageUtils.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaLandmark.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaLine.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaMesh.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaObject.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaScene.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTransform.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTubeGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTypes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaUtils.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaVesselTube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Utilities/MetaIO/vtkmetaio/metaIOConfig.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/vtkmetaio" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/localMetaConfiguration.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaArrow.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaBlob.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaCommand.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaContour.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaDTITube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaEllipse.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaEvent.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaFEMObject.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaForm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaGaussian.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaGroup.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImage.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImageTypes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaImageUtils.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaLandmark.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaLine.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaMesh.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaObject.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaScene.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaSurface.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTransform.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTubeGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaTypes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaUtils.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/MetaIO/vtkmetaio/metaVesselTube.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Utilities/MetaIO/vtkmetaio/metaIOConfig.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Utilities/MetaIO/vtkmetaio/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
