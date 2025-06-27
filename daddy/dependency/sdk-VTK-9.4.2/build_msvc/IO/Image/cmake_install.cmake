# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkIOImage-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkIOImage-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkIOImage-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkIOImage-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkIOImage-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkIOImage-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkIOImage-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkIOImage-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkIOImage-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkIOImage-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkBMPReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkBMPWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkDEMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkDICOMImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkGESignaReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkHDRReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageExport.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageImport.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageImportExecutive.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2Collection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2Factory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJPEGReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJPEGWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJSONImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMedicalImageProperties.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMedicalImageReader2.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMetaImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMetaImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMRCReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageHeader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNrrdReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkOMETIFFReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNGReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNGWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNMWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPostScriptWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkSEPReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkSLCReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTGAReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTIFFReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTIFFWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkVolume16Reader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkVolumeReader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkBMPReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkBMPWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkDEMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkDICOMImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkGESignaReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkHDRReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageExport.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageImport.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageImportExecutive.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2Collection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2Factory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJPEGReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJPEGWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJSONImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMedicalImageProperties.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMedicalImageReader2.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMetaImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMetaImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMRCReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageHeader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNrrdReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkOMETIFFReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNGReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNGWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNMWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPostScriptWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkSEPReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkSLCReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTGAReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTIFFReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTIFFWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkVolume16Reader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkVolumeReader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkBMPReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkBMPWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkDEMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkDICOMImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkGESignaReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkHDRReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageExport.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageImport.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageImportExecutive.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2Collection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2Factory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJPEGReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJPEGWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJSONImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMedicalImageProperties.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMedicalImageReader2.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMetaImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMetaImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMRCReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageHeader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNrrdReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkOMETIFFReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNGReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNGWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNMWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPostScriptWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkSEPReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkSLCReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTGAReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTIFFReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTIFFWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkVolume16Reader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkVolumeReader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkBMPReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkBMPWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkDEMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkDICOMImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkGESignaReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkHDRReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageExport.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageImport.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageImportExecutive.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2Collection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageReader2Factory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJPEGReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJPEGWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkJSONImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMedicalImageProperties.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMedicalImageReader2.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMetaImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMetaImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkMRCReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageHeader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNIFTIImageWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkNrrdReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkOMETIFFReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNGReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNGWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPNMWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkPostScriptWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkSEPReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkSLCReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTGAReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTIFFReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkTIFFWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkVolume16Reader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Image/vtkVolumeReader.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Image/vtkIOImageModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Image/vtkIOImageModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Image/vtkIOImageModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Image/vtkIOImageModule.h")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Image/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
