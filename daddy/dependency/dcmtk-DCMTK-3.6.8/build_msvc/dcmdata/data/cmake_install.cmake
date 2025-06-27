# Install script for directory: D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/dcmdata/data

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files/DCMTK")
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

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/dicom.dic;C:/Program Files/DCMTK/share/dcmtk-3.6.8/acrnema.dic;C:/Program Files/DCMTK/share/dcmtk-3.6.8/private.dic;C:/Program Files/DCMTK/share/dcmtk-3.6.8/diconde.dic;C:/Program Files/DCMTK/share/dcmtk-3.6.8/dcm2xml.dtd;C:/Program Files/DCMTK/share/dcmtk-3.6.8/dumppat.txt;C:/Program Files/DCMTK/share/dcmtk-3.6.8/SC.dump;C:/Program Files/DCMTK/share/dcmtk-3.6.8/VLP.dump")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/dcmdata/data/dicom.dic"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/dcmdata/data/acrnema.dic"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/dcmdata/data/private.dic"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/dcmdata/data/diconde.dic"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/dcmdata/data/dcm2xml.dtd"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/dcmdata/data/dumppat.txt"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/dcmdata/data/SC.dump"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/dcmdata/data/VLP.dump"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/build_msvc/dcmdata/data/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
