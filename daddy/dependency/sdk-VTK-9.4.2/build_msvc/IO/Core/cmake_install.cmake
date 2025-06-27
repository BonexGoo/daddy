# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkIOCore-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkIOCore-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkIOCore-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkIOCore-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkIOCore-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkIOCore-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkIOCore-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkIOCore-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkIOCore-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkIOCore-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUpdateCellsV8toV9.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkAbstractParticleWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkAbstractPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkASCIITextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64InputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64OutputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64Utilities.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkDataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkDelimitedTextWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkFileResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkGlobFileNames.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkInputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkJavaScriptDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkLZ4DataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkLZMADataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkMemoryResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkOutputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkResourceParser.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkSortFileNames.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkTextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkTextCodecFactory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkURI.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkURILoader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUTF16TextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUTF8TextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkZLibDataCompressor.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUpdateCellsV8toV9.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkAbstractParticleWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkAbstractPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkASCIITextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64InputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64OutputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64Utilities.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkDataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkDelimitedTextWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkFileResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkGlobFileNames.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkInputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkJavaScriptDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkLZ4DataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkLZMADataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkMemoryResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkOutputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkResourceParser.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkSortFileNames.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkTextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkTextCodecFactory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkURI.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkURILoader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUTF16TextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUTF8TextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkZLibDataCompressor.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUpdateCellsV8toV9.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkAbstractParticleWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkAbstractPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkASCIITextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64InputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64OutputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64Utilities.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkDataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkDelimitedTextWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkFileResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkGlobFileNames.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkInputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkJavaScriptDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkLZ4DataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkLZMADataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkMemoryResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkOutputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkResourceParser.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkSortFileNames.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkTextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkTextCodecFactory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkURI.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkURILoader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUTF16TextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUTF8TextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkZLibDataCompressor.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUpdateCellsV8toV9.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkAbstractParticleWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkAbstractPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkArrayWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkASCIITextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64InputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64OutputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkBase64Utilities.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkDataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkDelimitedTextWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkFileResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkGlobFileNames.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkInputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkJavaScriptDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkLZ4DataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkLZMADataCompressor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkMemoryResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkOutputStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkResourceParser.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkResourceStream.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkSortFileNames.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkTextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkTextCodecFactory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkURI.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkURILoader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUTF16TextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkUTF8TextCodec.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/vtkZLibDataCompressor.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Core/vtkIOCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Core/vtkIOCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Core/vtkIOCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Core/vtkIOCoreModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkIOCore" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/Core/LICENSE")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/Core/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
