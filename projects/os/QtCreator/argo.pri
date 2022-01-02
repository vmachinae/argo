########################################################################
# Copyright (c) 1988-2021 $organization$
#
# This software is provided by the author and contributors ``as is''
# and any express or implied warranties, including, but not limited to,
# the implied warranties of merchantability and fitness for a particular
# purpose are disclaimed. In no event shall the author or contributors
# be liable for any direct, indirect, incidental, special, exemplary,
# or consequential damages (including, but not limited to, procurement
# of substitute goods or services; loss of use, data, or profits; or
# business interruption) however caused and on any theory of liability,
# whether in contract, strict liability, or tort (including negligence
# or otherwise) arising in any way out of the use of this software,
# even if advised of the possibility of such damage.
#
#   File: argo.pri
#
# Author: $author$
#   Date: 12/24/2021
#
# os specific QtCreator project .pri file for framework argo
########################################################################
# Depends: libjson;rostra;nadir;fila;crono;cifra;rete;stara

UNAME = $$system(uname)

contains(UNAME,Darwin) {
ARGO_OS = macosx
} else {
contains(UNAME,Linux) {
ARGO_OS = linux
} else {
ARGO_OS = windows
} # contains(UNAME,Linux)
} # contains(UNAME,Darwin)

contains(BUILD_OS,ARGO_OS) {
ARGO_BUILD = $${ARGO_OS}
} else {
ARGO_BUILD = $${BUILD_OS}
} # contains(BUILD_OS,ARGO_OS)

contains(BUILD_CPP_VERSION,10) {
CONFIG += c++0x
} else {
contains(BUILD_CPP_VERSION,98|03|11|14|17) {
CONFIG += c++$${BUILD_CPP_VERSION}
} else {
} # contains(BUILD_CPP_VERSION,98|03|11|14|17)
} # contains(BUILD_CPP_VERSION,10)

contains(ARGO_OS,macosx) {
} else {
contains(ARGO_OS,linux) {
QMAKE_CXXFLAGS += -fpermissive
} else {
contains(ARGO_OS,windows) {
} else {
} # contains(ARGO_OS,windows)
} # contains(ARGO_OS,linux)
} # contains(ARGO_OS,macosx)

########################################################################
# libjson
LIBJSON_THIRDPARTY_PKG_MAKE_BLD = $${LIBJSON_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
LIBJSON_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${LIBJSON_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
LIBJSON_THIRDPARTY_PKG_BLD = $${LIBJSON_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
LIBJSON_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${LIBJSON_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
LIBJSON_PKG_BLD = $${OTHER_BLD}/$${LIBJSON_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
LIBJSON_PRJ_BLD = $${OTHER_BLD}/$${LIBJSON_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
#LIBJSON_LIB = $${LIBJSON_THIRDPARTY_PKG_MAKE_BLD}/lib
#LIBJSON_LIB = $${LIBJSON_THIRDPARTY_PRJ_MAKE_BLD}/lib
#LIBJSON_LIB = $${LIBJSON_THIRDPARTY_PKG_BLD}/lib
LIBJSON_LIB = $${LIBJSON_THIRDPARTY_PRJ_BLD}/lib
#LIBJSON_LIB = $${LIBJSON_PKG_BLD}/lib
#LIBJSON_LIB = $${LIBJSON_PRJ_BLD}/lib
#LIBJSON_LIB = $${ARGO_LIB}

# libjson LIBS
#
libjson_LIBS += \
-L$${LIBJSON_LIB}/lib$${LIBJSON_LIB_NAME} \
-l$${LIBJSON_LIB_NAME} \


########################################################################
# rostra
ROSTRA_THIRDPARTY_PKG_MAKE_BLD = $${ROSTRA_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
ROSTRA_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${ROSTRA_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
ROSTRA_THIRDPARTY_PKG_BLD = $${ROSTRA_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
ROSTRA_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${ROSTRA_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
ROSTRA_PKG_BLD = $${OTHER_BLD}/$${ROSTRA_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
ROSTRA_PRJ_BLD = $${OTHER_BLD}/$${ROSTRA_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
#ROSTRA_LIB = $${ROSTRA_THIRDPARTY_PKG_MAKE_BLD}/lib
#ROSTRA_LIB = $${ROSTRA_THIRDPARTY_PRJ_MAKE_BLD}/lib
#ROSTRA_LIB = $${ROSTRA_THIRDPARTY_PKG_BLD}/lib
#ROSTRA_LIB = $${ROSTRA_THIRDPARTY_PRJ_BLD}/lib
ROSTRA_LIB = $${ROSTRA_PKG_BLD}/lib
#ROSTRA_LIB = $${ROSTRA_PRJ_BLD}/lib
#ROSTRA_LIB = $${ARGO_LIB}
ROSTRA_LIB_NAME = $${ROSTRA_NAME}

# rostra LIBS
#
rostra_LIBS += \
-L$${ROSTRA_LIB}/lib$${ROSTRA_LIB_NAME} \
-l$${ROSTRA_LIB_NAME} \


########################################################################
# nadir
NADIR_THIRDPARTY_PKG_MAKE_BLD = $${NADIR_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
NADIR_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${NADIR_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
NADIR_THIRDPARTY_PKG_BLD = $${NADIR_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
NADIR_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${NADIR_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
NADIR_PKG_BLD = $${OTHER_BLD}/$${NADIR_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
NADIR_PRJ_BLD = $${OTHER_BLD}/$${NADIR_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
#NADIR_LIB = $${NADIR_THIRDPARTY_PKG_MAKE_BLD}/lib
#NADIR_LIB = $${NADIR_THIRDPARTY_PRJ_MAKE_BLD}/lib
#NADIR_LIB = $${NADIR_THIRDPARTY_PKG_BLD}/lib
#NADIR_LIB = $${NADIR_THIRDPARTY_PRJ_BLD}/lib
NADIR_LIB = $${NADIR_PKG_BLD}/lib
#NADIR_LIB = $${NADIR_PRJ_BLD}/lib
#NADIR_LIB = $${ARGO_LIB}
NADIR_LIB_NAME = $${NADIR_NAME}

# nadir LIBS
#
nadir_LIBS += \
-L$${NADIR_LIB}/lib$${NADIR_LIB_NAME} \
-l$${NADIR_LIB_NAME} \


########################################################################
# fila
FILA_THIRDPARTY_PKG_MAKE_BLD = $${FILA_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
FILA_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${FILA_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
FILA_THIRDPARTY_PKG_BLD = $${FILA_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
FILA_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${FILA_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
FILA_PKG_BLD = $${OTHER_BLD}/$${FILA_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
FILA_PRJ_BLD = $${OTHER_BLD}/$${FILA_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
#FILA_LIB = $${FILA_THIRDPARTY_PKG_MAKE_BLD}/lib
#FILA_LIB = $${FILA_THIRDPARTY_PRJ_MAKE_BLD}/lib
#FILA_LIB = $${FILA_THIRDPARTY_PKG_BLD}/lib
#FILA_LIB = $${FILA_THIRDPARTY_PRJ_BLD}/lib
FILA_LIB = $${FILA_PKG_BLD}/lib
#FILA_LIB = $${FILA_PRJ_BLD}/lib
#FILA_LIB = $${ARGO_LIB}
FILA_LIB_NAME = $${FILA_NAME}

# fila LIBS
#
fila_LIBS += \
-L$${FILA_LIB}/lib$${FILA_LIB_NAME} \
-l$${FILA_LIB_NAME} \


########################################################################
# crono
CRONO_THIRDPARTY_PKG_MAKE_BLD = $${CRONO_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
CRONO_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${CRONO_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
CRONO_THIRDPARTY_PKG_BLD = $${CRONO_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
CRONO_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${CRONO_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
CRONO_PKG_BLD = $${OTHER_BLD}/$${CRONO_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
CRONO_PRJ_BLD = $${OTHER_BLD}/$${CRONO_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
#CRONO_LIB = $${CRONO_THIRDPARTY_PKG_MAKE_BLD}/lib
#CRONO_LIB = $${CRONO_THIRDPARTY_PRJ_MAKE_BLD}/lib
#CRONO_LIB = $${CRONO_THIRDPARTY_PKG_BLD}/lib
#CRONO_LIB = $${CRONO_THIRDPARTY_PRJ_BLD}/lib
CRONO_LIB = $${CRONO_PKG_BLD}/lib
#CRONO_LIB = $${CRONO_PRJ_BLD}/lib
#CRONO_LIB = $${ARGO_LIB}
CRONO_LIB_NAME = $${CRONO_NAME}

# crono LIBS
#
crono_LIBS += \
-L$${CRONO_LIB}/lib$${CRONO_LIB_NAME} \
-l$${CRONO_LIB_NAME} \


########################################################################
# cifra
CIFRA_THIRDPARTY_PKG_MAKE_BLD = $${CIFRA_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
CIFRA_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${CIFRA_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
CIFRA_THIRDPARTY_PKG_BLD = $${CIFRA_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
CIFRA_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${CIFRA_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
CIFRA_PKG_BLD = $${OTHER_BLD}/$${CIFRA_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
CIFRA_PRJ_BLD = $${OTHER_BLD}/$${CIFRA_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
#CIFRA_LIB = $${CIFRA_THIRDPARTY_PKG_MAKE_BLD}/lib
#CIFRA_LIB = $${CIFRA_THIRDPARTY_PRJ_MAKE_BLD}/lib
#CIFRA_LIB = $${CIFRA_THIRDPARTY_PKG_BLD}/lib
#CIFRA_LIB = $${CIFRA_THIRDPARTY_PRJ_BLD}/lib
CIFRA_LIB = $${CIFRA_PKG_BLD}/lib
#CIFRA_LIB = $${CIFRA_PRJ_BLD}/lib
#CIFRA_LIB = $${ARGO_LIB}
CIFRA_LIB_NAME = $${CIFRA_NAME}

# cifra LIBS
#
cifra_LIBS += \
-L$${CIFRA_LIB}/lib$${CIFRA_LIB_NAME} \
-l$${CIFRA_LIB_NAME} \


########################################################################
# rete
RETE_THIRDPARTY_PKG_MAKE_BLD = $${RETE_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
RETE_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${RETE_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
RETE_THIRDPARTY_PKG_BLD = $${RETE_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
RETE_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${RETE_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
RETE_PKG_BLD = $${OTHER_BLD}/$${RETE_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
RETE_PRJ_BLD = $${OTHER_BLD}/$${RETE_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
#RETE_LIB = $${RETE_THIRDPARTY_PKG_MAKE_BLD}/lib
#RETE_LIB = $${RETE_THIRDPARTY_PRJ_MAKE_BLD}/lib
#RETE_LIB = $${RETE_THIRDPARTY_PKG_BLD}/lib
#RETE_LIB = $${RETE_THIRDPARTY_PRJ_BLD}/lib
RETE_LIB = $${RETE_PKG_BLD}/lib
#RETE_LIB = $${RETE_PRJ_BLD}/lib
#RETE_LIB = $${ARGO_LIB}
RETE_LIB_NAME = $${RETE_NAME}

# rete LIBS
#
rete_LIBS += \
-L$${RETE_LIB}/lib$${RETE_LIB_NAME} \
-l$${RETE_LIB_NAME} \


########################################################################
# stara
STARA_THIRDPARTY_PKG_MAKE_BLD = $${STARA_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
STARA_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${STARA_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/$${BUILD_CONFIG}
STARA_THIRDPARTY_PKG_BLD = $${STARA_THIRDPARTY_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
STARA_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${STARA_THIRDPARTY_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
STARA_PKG_BLD = $${OTHER_BLD}/$${STARA_PKG}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
STARA_PRJ_BLD = $${OTHER_BLD}/$${STARA_PRJ}/build/$${ARGO_BUILD}/QtCreator/$${BUILD_CONFIG}
#STARA_LIB = $${STARA_THIRDPARTY_PKG_MAKE_BLD}/lib
#STARA_LIB = $${STARA_THIRDPARTY_PRJ_MAKE_BLD}/lib
#STARA_LIB = $${STARA_THIRDPARTY_PKG_BLD}/lib
#STARA_LIB = $${STARA_THIRDPARTY_PRJ_BLD}/lib
STARA_LIB = $${STARA_PKG_BLD}/lib
#STARA_LIB = $${STARA_PRJ_BLD}/lib
#STARA_LIB = $${ARGO_LIB}
STARA_LIB_NAME = $${STARA_NAME}

# stara LIBS
#
stara_LIBS += \
-L$${STARA_LIB}/lib$${STARA_LIB_NAME} \
-l$${STARA_LIB_NAME} \

########################################################################
# argo

# argo INCLUDEPATH
#
argo_INCLUDEPATH += \

# argo DEFINES
#
argo_DEFINES += \

# argo LIBS
#
argo_LIBS += \
$${stara_LIBS} \
$${rete_LIBS} \
$${cifra_LIBS} \
$${crono_LIBS} \
$${fila_LIBS} \
$${nadir_LIBS} \
$${rostra_LIBS} \
$${libjson_LIBS} \
$${build_argo_LIBS} \

contains(ARGO_OS,macosx|linux) {
argo_LIBS += \
-lpthread \
-ldl
} else {
} # contains(ARGO_OS,macosx|linux)

contains(ARGO_OS,linux) {
argo_LIBS += \
-lrt
} else {
} # contains(ARGO_OS,linux)


