# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "libproj-data" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/vtk-9.4/proj" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/proj.ini"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/world"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/other.extra"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/nad27"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/GL27"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/nad83"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/nad.lst"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/CH"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/ITRF2000"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/ITRF2008"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/ITRF2014"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/../share/vtk-9.4/proj/proj.db"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/deformation_model.schema.json"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/projjson.schema.json"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libproj/vtklibproj/data/triangulation.schema.json"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/ThirdParty/libproj/vtklibproj/data/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
