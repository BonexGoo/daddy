TARGET = logger
TEMPLATE = app

QT_ENABLE_GRAPHICS = ok #ok #no
QT_ADD_PLUGINS_FIREBASE = no #ok #no
QT_PACKAGE_RPATH = no #ok #no

!include(../../Boss2D/project/boss2d.pri) {
    error("Couldn't find the boss2d.pri file...")
}

!include(../../daddy/project/daddy.pri) {
    error("Couldn't find the daddy.pri file...")
}

INCLUDEPATH += ../source
HEADERS += ../source/boss_config.h
SOURCES += ../source/logger.cpp
HEADERS += ../source/logger.hpp
SOURCES += ../source/main.cpp
SOURCES += ../source/resource.cpp
HEADERS += ../source/resource.hpp

SOURCES += ../source/view/cmd_view.cpp
HEADERS += ../source/view/cmd_view.hpp
SOURCES += ../source/view/tree_view.cpp
HEADERS += ../source/view/tree_view.hpp
SOURCES += ../source/view/webcmd_view.cpp
HEADERS += ../source/view/webcmd_view.hpp

SOURCES += ../source/tree/tree_element.cpp
HEADERS += ../source/tree/tree_element.hpp
SOURCES += ../source/tree/tree_group.cpp
HEADERS += ../source/tree/tree_group.hpp
SOURCES += ../source/tree/tree_value.cpp
HEADERS += ../source/tree/tree_value.hpp

ASSETS_IMAGE.files += ../assets/image
ASSETS_IMAGE.path = /assets

win32{
    RC_ICONS += ../common/windows/main.ico
}

macx{
    QMAKE_BUNDLE_DATA += ASSETS_IMAGE
    QMAKE_INFO_PLIST = $$PWD/../common/macx/Info.plist
    QMAKE_ASSET_CATALOGS += $$PWD/../common/macx/Assets.xcassets
    QMAKE_ASSET_CATALOGS_APP_ICON = AppIcon
}

ios{
    QMAKE_BUNDLE_DATA += ASSETS_IMAGE
    QMAKE_INFO_PLIST = $$PWD/../common/ios/Info.plist
    QMAKE_ASSET_CATALOGS += $$PWD/../common/ios/Assets.xcassets
    QMAKE_ASSET_CATALOGS_APP_ICON = AppIcon
}

android{
    INSTALLS += ASSETS_IMAGE
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/../common/android
}
