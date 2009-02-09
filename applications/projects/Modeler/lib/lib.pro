SOFA_DIR=../../../..
TEMPLATE = lib

include($${SOFA_DIR}/sofa.cfg)

TARGET = sofamodeler$$LIBSUFFIX
CONFIG += $$CONFIGLIBRARIES
# LIBS += -lsofasimulation$$LIBSUFFIX 
LIBS += $$SOFA_GUI_LIBS
LIBS += $$SOFA_LIBS
LIBS += $$SOFA_EXT_LIBS
INCLUDEPATH += $$SOFA_DIR/extlibs

SOURCES = SofaModeler.cpp \
          GraphModeler.cpp \
          AddPreset.cpp \
          ../../../sofa/gui/qt/SofaPluginManager.cpp

HEADERS = SofaModeler.h \
          GraphModeler.h \
          AddPreset.h \
          ../../../sofa/gui/qt/SofaPluginManager.h

contains (DEFINES, SOFA_QT4) {	

	  CONFIG += $$CONFIGLIBRARIES qt uic uic3
	  QT += qt3support xml
	  FORMS3 += Modeler.ui 
	  FORMS3 += DialogAddPreset.ui
        FORMS3 += ../../../sofa/gui/qt/PluginManager.ui                    
}
else {
	  CONFIG += $$CONFIGLIBRARIES qt
	  FORMS += Modeler.ui
	  FORMS += DialogAddPreset.ui
        FORMS += ../../../sofa/gui/qt/PluginManager.ui                    
}


#add local libraries to the modeler
!include(lib-local.cfg) {
}
