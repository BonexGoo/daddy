# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/QtQuick/qml

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/qml/Debug/VTK.9.4" TYPE MODULE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/Debug/VTK.9.4/qmlvtkplugin.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/qml/Release/VTK.9.4" TYPE MODULE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/Release/VTK.9.4/qmlvtkplugin.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/qml/MinSizeRel/VTK.9.4" TYPE MODULE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/MinSizeRel/VTK.9.4/qmlvtkplugin.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/qml/RelWithDebInfo/VTK.9.4" TYPE MODULE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/RelWithDebInfo/VTK.9.4/qmlvtkplugin.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/qml/Debug/VTK.9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/Debug/VTK.9.4/qmldir"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/Debug/VTK.9.4/plugins.qmltypes"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/qml/Release/VTK.9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/Release/VTK.9.4/qmldir"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/Release/VTK.9.4/plugins.qmltypes"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/qml/MinSizeRel/VTK.9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/MinSizeRel/VTK.9.4/qmldir"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/MinSizeRel/VTK.9.4/plugins.qmltypes"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/qml/RelWithDebInfo/VTK.9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/RelWithDebInfo/VTK.9.4/qmldir"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/qml/RelWithDebInfo/VTK.9.4/plugins.qmltypes"
      )
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/GUISupport/QtQuick/qml/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
