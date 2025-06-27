# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/ThirdParty/libharu/vtklibharu/src/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4/vtklibharu/include" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_types.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_consts.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_version.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_annotation.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_catalog.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_conf.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_destination.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_doc.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_encoder.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_encrypt.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_encryptdict.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_error.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_ext_gstate.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_font.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_fontdef.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_gstate.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_image.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_info.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_list.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_mmgr.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_objects.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_outline.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_pages.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_page_label.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_streams.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_u3d.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_utils.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_pdfa.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_3dmeasure.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/hpdf_exdata.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/ThirdParty/libharu/vtklibharu/include/vtk_haru_mangle.h"
    "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/ThirdParty/libharu/vtklibharu/include/hpdf_config.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/ThirdParty/libharu/vtklibharu/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
