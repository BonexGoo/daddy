# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree

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
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/octree" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_cursor.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_iterator.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_node.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_path.txx"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/octree" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_cursor.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_iterator.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_node.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_path.txx"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/octree" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_cursor.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_iterator.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_node.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_path.txx"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/octree" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_cursor.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_iterator.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_node.txx"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_path.txx"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/octree" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_cursor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_iterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_node.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_path.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/octree" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_cursor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_iterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_node.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_path.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/octree" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_cursor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_iterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_node.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_path.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/octree" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_cursor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_iterator.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_node.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/Utilities/octree/octree/octree_path.h"
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
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/Utilities/octree/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
