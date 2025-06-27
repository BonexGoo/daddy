# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/vtkfast_float/vtkfast_float" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float/vtkfast_float/ascii_number.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float/vtkfast_float/bigint.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float/vtkfast_float/decimal_to_binary.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float/vtkfast_float/digit_comparison.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float/vtkfast_float/fast_float.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float/vtkfast_float/fast_table.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float/vtkfast_float/float_common.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float/vtkfast_float/parse_number.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float/vtkfast_float/simple_decimal_conversion.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/fast_float/vtkfast_float/vtkfast_float/vtkfast_float_mangle.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/ThirdParty/fast_float/vtkfast_float/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
