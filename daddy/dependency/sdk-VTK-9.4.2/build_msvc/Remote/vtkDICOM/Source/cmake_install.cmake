# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkDICOM-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkDICOM-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkDICOM-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkDICOM-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkDICOM-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkDICOM-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkDICOM-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkDICOM-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkDICOM-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkDICOM-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMetaData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictionary.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFilePath.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFile.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFileDirectory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMTag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMTagPath.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMVR.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMVM.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCharacterSet.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCharacterSetTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDataElement.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictHash.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictEntry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictPrivate.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDirectory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFileSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMImageCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSCGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCTGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMRGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMParser.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCompiler.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSliceSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSequence.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMReferenceCount.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUtilities.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUtilitiesUIDTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMValue.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMAlgorithm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMLookupTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMApplyPalette.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMApplyRescale.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMToRAS.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCTRectifier.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMetaDataAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUIDGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIHeader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkScancoCTReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMConfig.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMModule.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMetaData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictionary.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFilePath.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFile.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFileDirectory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMTag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMTagPath.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMVR.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMVM.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCharacterSet.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCharacterSetTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDataElement.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictHash.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictEntry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictPrivate.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDirectory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFileSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMImageCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSCGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCTGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMRGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMParser.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCompiler.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSliceSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSequence.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMReferenceCount.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUtilities.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUtilitiesUIDTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMValue.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMAlgorithm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMLookupTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMApplyPalette.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMApplyRescale.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMToRAS.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCTRectifier.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMetaDataAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUIDGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIHeader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkScancoCTReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMConfig.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMModule.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMetaData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictionary.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFilePath.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFile.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFileDirectory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMTag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMTagPath.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMVR.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMVM.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCharacterSet.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCharacterSetTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDataElement.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictHash.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictEntry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictPrivate.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDirectory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFileSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMImageCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSCGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCTGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMRGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMParser.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCompiler.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSliceSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSequence.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMReferenceCount.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUtilities.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUtilitiesUIDTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMValue.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMAlgorithm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMLookupTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMApplyPalette.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMApplyRescale.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMToRAS.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCTRectifier.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMetaDataAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUIDGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIHeader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkScancoCTReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMConfig.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMModule.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMetaData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictionary.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFilePath.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFile.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFileDirectory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMTag.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMTagPath.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMVR.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMVM.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCharacterSet.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCharacterSetTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDataElement.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictHash.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictEntry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDictPrivate.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMDirectory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMFileSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMImageCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSCGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCTGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMRGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMParser.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCompiler.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSliceSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSequence.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMItem.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMSorter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMReferenceCount.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUtilities.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUtilitiesUIDTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMValue.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMAlgorithm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMLookupTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMApplyPalette.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMApplyRescale.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMToRAS.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMCTRectifier.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMMetaDataAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkDICOMUIDGenerator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIHeader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkNIFTIWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Source/vtkScancoCTReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMConfig.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMModule.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/vtkDICOMModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkDICOM" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Remote/vtkDICOM/Copyright.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Remote/vtkDICOM/Source/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
