# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkInfovisCore-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkInfovisCore-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkInfovisCore-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkInfovisCore-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkInfovisCore-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkInfovisCore-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkInfovisCore-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkInfovisCore-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkInfovisCore-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkInfovisCore-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkAddMembershipArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkAdjacencyMatrixToEdgeTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkArrayNorm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkArrayToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkCollapseGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkCollapseVerticesByArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkContinuousScatterplot.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkDataObjectToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkDotProductSimilarity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkEdgeCenters.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExpandSelectedGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExtractSelectedGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExtractSelectedTree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGenerateIndexArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGraphHierarchicalBundleEdges.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGroupLeafVertices.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkKCoreDecomposition.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeColumns.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeGraphs.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMutableGraphHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkNetworkHierarchy.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkPipelineGraphSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkPruneTreeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRandomGraphSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkReduceTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRemoveHiddenData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRemoveIsolatedVertices.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkSparseArrayToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStreamGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStringToCategory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStringToNumeric.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToSparseArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToTreeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkThresholdGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkThresholdTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTransferAttributes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTransposeMatrix.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeDifferenceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeFieldAggregator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeLevelsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkVertexDegree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkWordCloud.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkAddMembershipArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkAdjacencyMatrixToEdgeTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkArrayNorm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkArrayToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkCollapseGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkCollapseVerticesByArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkContinuousScatterplot.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkDataObjectToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkDotProductSimilarity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkEdgeCenters.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExpandSelectedGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExtractSelectedGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExtractSelectedTree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGenerateIndexArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGraphHierarchicalBundleEdges.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGroupLeafVertices.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkKCoreDecomposition.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeColumns.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeGraphs.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMutableGraphHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkNetworkHierarchy.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkPipelineGraphSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkPruneTreeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRandomGraphSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkReduceTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRemoveHiddenData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRemoveIsolatedVertices.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkSparseArrayToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStreamGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStringToCategory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStringToNumeric.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToSparseArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToTreeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkThresholdGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkThresholdTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTransferAttributes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTransposeMatrix.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeDifferenceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeFieldAggregator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeLevelsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkVertexDegree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkWordCloud.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkAddMembershipArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkAdjacencyMatrixToEdgeTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkArrayNorm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkArrayToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkCollapseGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkCollapseVerticesByArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkContinuousScatterplot.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkDataObjectToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkDotProductSimilarity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkEdgeCenters.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExpandSelectedGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExtractSelectedGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExtractSelectedTree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGenerateIndexArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGraphHierarchicalBundleEdges.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGroupLeafVertices.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkKCoreDecomposition.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeColumns.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeGraphs.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMutableGraphHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkNetworkHierarchy.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkPipelineGraphSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkPruneTreeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRandomGraphSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkReduceTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRemoveHiddenData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRemoveIsolatedVertices.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkSparseArrayToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStreamGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStringToCategory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStringToNumeric.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToSparseArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToTreeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkThresholdGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkThresholdTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTransferAttributes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTransposeMatrix.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeDifferenceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeFieldAggregator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeLevelsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkVertexDegree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkWordCloud.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkAddMembershipArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkAdjacencyMatrixToEdgeTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkArrayNorm.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkArrayToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkCollapseGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkCollapseVerticesByArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkContinuousScatterplot.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkDataObjectToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkDotProductSimilarity.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkEdgeCenters.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExpandSelectedGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExtractSelectedGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkExtractSelectedTree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGenerateIndexArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGraphHierarchicalBundleEdges.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkGroupLeafVertices.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkKCoreDecomposition.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeColumns.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeGraphs.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMergeTables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkMutableGraphHelper.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkNetworkHierarchy.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkPipelineGraphSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkPruneTreeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRandomGraphSource.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkReduceTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRemoveHiddenData.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkRemoveIsolatedVertices.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkSparseArrayToTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStreamGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStringToCategory.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkStringToNumeric.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToSparseArray.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTableToTreeFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkThresholdGraph.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkThresholdTable.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTransferAttributes.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTransposeMatrix.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeDifferenceFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeFieldAggregator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkTreeLevelsFilter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkVertexDegree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/vtkWordCloud.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Infovis/Core/vtkInfovisCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Infovis/Core/vtkInfovisCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Infovis/Core/vtkInfovisCoreModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Infovis/Core/vtkInfovisCoreModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkInfovisCore" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Infovis/Core/LICENSE")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Infovis/Core/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
