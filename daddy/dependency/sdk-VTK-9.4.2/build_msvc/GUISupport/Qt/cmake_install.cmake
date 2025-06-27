# Install script for directory: D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt

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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Debug/vtkGUISupportQt-9.4d.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/Release/vtkGUISupportQt-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/MinSizeRel/vtkGUISupportQt-9.4.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/lib/RelWithDebInfo/vtkGUISupportQt-9.4.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Debug/vtkGUISupportQt-9.4d.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/Release/vtkGUISupportQt-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/MinSizeRel/vtkGUISupportQt-9.4.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/bin/RelWithDebInfo/vtkGUISupportQt-9.4.dll")
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
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKRenderWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKWin32Header.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QFilterTreeProxyModel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKApplication.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKInteractor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKInteractorAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLNativeWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLStereoWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLWindow.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKRenderWindowAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKTableModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkEventQtSlotConnect.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetTexture.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtAbstractModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtAnnotationLayersModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtConnection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtDebugLeaksModel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtDebugLeaksView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtTableModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtTreeModelAdapter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKRenderWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKWin32Header.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QFilterTreeProxyModel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKApplication.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKInteractor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKInteractorAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLNativeWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLStereoWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLWindow.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKRenderWindowAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKTableModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkEventQtSlotConnect.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetTexture.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtAbstractModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtAnnotationLayersModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtConnection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtDebugLeaksModel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtDebugLeaksView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtTableModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtTreeModelAdapter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKRenderWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKWin32Header.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QFilterTreeProxyModel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKApplication.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKInteractor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKInteractorAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLNativeWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLStereoWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLWindow.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKRenderWindowAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKTableModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkEventQtSlotConnect.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetTexture.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtAbstractModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtAnnotationLayersModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtConnection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtDebugLeaksModel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtDebugLeaksView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtTableModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtTreeModelAdapter.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKRenderWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKWin32Header.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QFilterTreeProxyModel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKApplication.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKInteractor.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKInteractorAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLNativeWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLStereoWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKOpenGLWindow.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKRenderWindowAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/QVTKTableModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkEventQtSlotConnect.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetRepresentation.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetTexture.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQWidgetWidget.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtAbstractModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtAnnotationLayersModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtConnection.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtDebugLeaksModel.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtDebugLeaksView.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtTableModelAdapter.h"
      "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/vtkQtTreeModelAdapter.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/GUISupport/Qt/vtkGUISupportQtModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/GUISupport/Qt/vtkGUISupportQtModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/GUISupport/Qt/vtkGUISupportQtModule.h")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-9.4" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/GUISupport/Qt/vtkGUISupportQtModule.h")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/VTK/vtkGUISupportQt" TYPE FILE FILES "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/GUISupport/Qt/LICENSE")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/sdk-VTK-9.4.2/build_msvc/GUISupport/Qt/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
