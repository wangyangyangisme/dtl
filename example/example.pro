include (../variables.pri)

TARGET=example
DESTDIR=../bin
TEMPLATE=app
LIBS += -lDTL
CONFIG += console

HEADERS += \
   CStringExample.h \
   DynamicIndexedViewExample.h \
   example.h \
   example_core.h \
   example_funcs.h \
   GlobalHandler.h \
   IndexedViewExample.h \
   range.h \
   ReadData.h \
   ReadDataNoMatches.h \
   ReadJoinedData.h \
   ShareConn.h \
   SimpleDynamicRead.h \
   SpecialQryExample.h \
   StoredProc.h \
   WriteData.h \

SOURCES += \
   CStringExample.cpp \
   DynamicIndexedViewExample.cpp \
   example.cpp \
   example_core.cpp \
   GlobalHandler.cpp \
   IndexedViewExample.cpp \
   main.cpp \
   range.cpp \
   ReadData.cpp \
   ReadDataNoMatches.cpp \
   ReadJoinedData.cpp \
   ShareConn.cpp \
   SimpleDynamicRead.cpp \
   SpecialQryExample.cpp \
   StoredProc.cpp \
   WriteData.cpp \

