
TARGET = kirkoszkop-app
BUILD_ROOT=../..
COMPONENT_NAME=kirkoszkop
include($${BUILD_ROOT}/sdk/build/qmake/application.pri)

SOURCES += \
    main.cc

HEADERS += \
    init.h \
    setup.h \
    defs.h

RESOURCES += \
    kirkoszkop-app.qrc

LIBS += $$moduleDep(krono,calculo)
LIBS += $$moduleDep(astro,hora)
LIBS += $$moduleDep(astro,db)
LIBS += $$moduleDep(astro,controls)
LIBS += $$moduleDep(sdk,dox)
LIBS += $$moduleDep(sdk,hosting)
LIBS += $$moduleDep(sdk,controls)
LIBS += $$moduleDep(sdk,network)
LIBS += $$moduleDep(sdk,arch)

android: {
    ANDROID_EXTRA_LIBS += $$androidModuleBuildPath(sdk,arch)
    ANDROID_EXTRA_LIBS += $$androidModuleBuildPath(sdk,network)
    ANDROID_EXTRA_LIBS += $$androidModuleBuildPath(sdk,controls)
    ANDROID_EXTRA_LIBS += $$androidModuleBuildPath(sdk,hosting)
    ANDROID_EXTRA_LIBS += $$androidModuleBuildPath(sdk,dox)
    ANDROID_EXTRA_LIBS += $$androidModuleBuildPath(astro,controls)
    ANDROID_EXTRA_LIBS += $$androidModuleBuildPath(astro,db)
    ANDROID_EXTRA_LIBS += $$androidModuleBuildPath(astro,hora)
    ANDROID_EXTRA_LIBS += $$androidModuleBuildPath(krono,calculo)
}

QMAKE_EXTRA_TARGETS += $$object_dep_on_component_header(main)

include($${BUILD_ROOT}/astro/db/sweph/ephe/files.pri)
$$copySwephFile(sepl_18,se1)
