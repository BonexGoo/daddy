# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkIOXML-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkIOXML-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkIOXML-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkIOXML-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkIOXML-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkIOXML-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkIOXML-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkIOXML-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkIOXML-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkIOXML-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkRTXMLPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLCompositeDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLCompositeDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLFileReadTester.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLGenericDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataFileConverter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHyperTreeGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHyperTreeGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLImageDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLImageDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiBlockDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiBlockDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiGroupDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPHyperTreeGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPImageDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPStructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPUnstructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPartitionedDataSetCollectionReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPartitionedDataSetReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPolyDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLRectilinearGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLTableWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUniformGridAMRReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUniformGridAMRWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriterBase.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriterC.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkRTXMLPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLCompositeDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLCompositeDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLFileReadTester.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLGenericDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataFileConverter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHyperTreeGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHyperTreeGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLImageDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLImageDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiBlockDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiBlockDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiGroupDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPHyperTreeGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPImageDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPStructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPUnstructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPartitionedDataSetCollectionReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPartitionedDataSetReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPolyDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLRectilinearGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLTableWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUniformGridAMRReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUniformGridAMRWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriterBase.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriterC.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkRTXMLPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLCompositeDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLCompositeDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLFileReadTester.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLGenericDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataFileConverter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHyperTreeGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHyperTreeGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLImageDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLImageDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiBlockDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiBlockDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiGroupDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPHyperTreeGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPImageDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPStructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPUnstructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPartitionedDataSetCollectionReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPartitionedDataSetReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPolyDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLRectilinearGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLTableWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUniformGridAMRReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUniformGridAMRWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriterBase.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriterC.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkRTXMLPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLCompositeDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLCompositeDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataObjectWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLDataSetWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLFileReadTester.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLGenericDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataFileConverter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalBoxDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHierarchicalDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHyperTreeGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLHyperTreeGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLImageDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLImageDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiBlockDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiBlockDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLMultiGroupDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPDataObjectReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPHyperTreeGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPImageDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPStructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPUnstructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPartitionedDataSetCollectionReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPartitionedDataSetReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPolyDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLPolyDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLRectilinearGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLRectilinearGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLStructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLTableReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLTableWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUniformGridAMRReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUniformGridAMRWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredDataReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredDataWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredGridReader.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLUnstructuredGridWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriterBase.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/IO/XML/vtkXMLWriterC.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/XML/vtkIOXMLModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/XML/vtkIOXMLModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/XML/vtkIOXMLModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/XML/vtkIOXMLModule.h")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/IO/XML/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
