# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkRenderingVolumeOpenGL2-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkRenderingVolumeOpenGL2-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkRenderingVolumeOpenGL2-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkRenderingVolumeOpenGL2-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkRenderingVolumeOpenGL2-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkRenderingVolumeOpenGL2-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkRenderingVolumeOpenGL2-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkRenderingVolumeOpenGL2-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkRenderingVolumeOpenGL2-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkRenderingVolumeOpenGL2-9.4.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTables.txx")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTables.txx")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTables.txx")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTables.txx")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkMultiBlockUnstructuredGridVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkMultiBlockVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLGPUVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLProjectedTetrahedraMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLRayCastImageDisplayHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkSmartVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkVolumeTexture.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkMultiBlockUnstructuredGridVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkMultiBlockVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLGPUVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLProjectedTetrahedraMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLRayCastImageDisplayHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkSmartVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkVolumeTexture.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkMultiBlockUnstructuredGridVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkMultiBlockVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLGPUVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLProjectedTetrahedraMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLRayCastImageDisplayHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkSmartVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkVolumeTexture.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkMultiBlockUnstructuredGridVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkMultiBlockVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLGPUVolumeRayCastMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLProjectedTetrahedraMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLRayCastImageDisplayHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkSmartVolumeMapper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkVolumeTexture.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeGradientOpacityTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeMaskGradientOpacityTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeMaskTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeOpacityTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeRGBTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkVolumeInputHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/VolumeOpenGL2/vtkRenderingVolumeOpenGL2Module.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeGradientOpacityTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeMaskGradientOpacityTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeMaskTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeOpacityTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeRGBTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkVolumeInputHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/VolumeOpenGL2/vtkRenderingVolumeOpenGL2Module.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeGradientOpacityTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeMaskGradientOpacityTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeMaskTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeOpacityTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeRGBTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkVolumeInputHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/VolumeOpenGL2/vtkRenderingVolumeOpenGL2Module.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeGradientOpacityTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeMaskGradientOpacityTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeMaskTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeOpacityTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeRGBTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeTransferFunction2D.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkVolumeInputHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Rendering/VolumeOpenGL2/vtkOpenGLVolumeLookupTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/VolumeOpenGL2/vtkRenderingVolumeOpenGL2Module.h"
      )
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Rendering/VolumeOpenGL2/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
