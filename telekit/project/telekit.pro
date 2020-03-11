TARGET = telekit
TEMPLATE = app

!include(../../daddy/project/daddy.pri) {
    error("Couldn't find the daddy.pri file...")
}

TOPPATH = $$PWD/../source
SOURCES += $$TOPPATH/telekit.cpp
