# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/vtk-9.4/hierarchy/VTK" TYPE FILE RENAME "vtkFiltersExtraction-hierarchy.txt" FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/vtk-9.4/hierarchy/VTK/vtkFiltersExtraction-hierarchy.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkFiltersExtraction-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkFiltersExtraction-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkFiltersExtraction-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkFiltersExtraction-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkFiltersExtraction-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkFiltersExtraction-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkFiltersExtraction-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkFiltersExtraction-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkBlockSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkConvertSelection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExpandMarkedElements.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractBlock.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractBlockUsingDataAssembly.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractCellsByType.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataArraysOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataSets.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractExodusGlobalTemporalVariables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractGeometry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractLevel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractParticlesOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractPolyDataGeometry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractRectilinearGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelectedArraysOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelectedRows.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractTensorComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractTimeSteps.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractUnstructuredGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractVectorComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkFrustumSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkHierarchicalDataExtractDataSets.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkHierarchicalDataExtractLevel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkLocationSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkProbeSelectedLocations.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkValueSelector.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkBlockSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkConvertSelection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExpandMarkedElements.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractBlock.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractBlockUsingDataAssembly.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractCellsByType.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataArraysOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataSets.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractExodusGlobalTemporalVariables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractGeometry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractLevel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractParticlesOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractPolyDataGeometry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractRectilinearGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelectedArraysOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelectedRows.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractTensorComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractTimeSteps.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractUnstructuredGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractVectorComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkFrustumSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkHierarchicalDataExtractDataSets.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkHierarchicalDataExtractLevel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkLocationSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkProbeSelectedLocations.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkValueSelector.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkBlockSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkConvertSelection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExpandMarkedElements.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractBlock.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractBlockUsingDataAssembly.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractCellsByType.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataArraysOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataSets.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractExodusGlobalTemporalVariables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractGeometry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractLevel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractParticlesOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractPolyDataGeometry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractRectilinearGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelectedArraysOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelectedRows.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractTensorComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractTimeSteps.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractUnstructuredGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractVectorComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkFrustumSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkHierarchicalDataExtractDataSets.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkHierarchicalDataExtractLevel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkLocationSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkProbeSelectedLocations.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkValueSelector.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkBlockSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkConvertSelection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExpandMarkedElements.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractBlock.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractBlockUsingDataAssembly.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractCellsByType.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataArraysOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractDataSets.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractExodusGlobalTemporalVariables.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractGeometry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractLevel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractParticlesOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractPolyDataGeometry.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractRectilinearGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelectedArraysOverTime.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelectedRows.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractSelection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractTensorComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractTimeSteps.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractUnstructuredGrid.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkExtractVectorComponents.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkFrustumSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkHierarchicalDataExtractDataSets.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkHierarchicalDataExtractLevel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkLocationSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkProbeSelectedLocations.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkSelector.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/vtkValueSelector.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Extraction/vtkFiltersExtractionModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Extraction/vtkFiltersExtractionModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Extraction/vtkFiltersExtractionModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Extraction/vtkFiltersExtractionModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkFiltersExtraction" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Filters/Extraction/LICENSE")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Filters/Extraction/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
