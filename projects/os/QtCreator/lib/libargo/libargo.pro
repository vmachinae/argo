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
#   File: libargo.pro
#
# Author: $author$
#   Date: 12/24/2021
#
# os specific QtCreator project .pro file for framework argo static library libargo
########################################################################
#
# Debug: argo/build/os/QtCreator/Debug/lib/libargo
# Release: argo/build/os/QtCreator/Release/lib/libargo
# Profile: argo/build/os/QtCreator/Profile/lib/libargo
#
include(../../../../../build/QtCreator/argo.pri)
include(../../../../QtCreator/argo.pri)
include(../../argo.pri)
include(../../../../QtCreator/lib/libargo/libargo.pri)

TARGET = $${libargo_TARGET}
TEMPLATE = $${libargo_TEMPLATE}
CONFIG += $${libargo_CONFIG}

########################################################################
# INCLUDEPATH
#
INCLUDEPATH += \
$${libargo_INCLUDEPATH} \

# DEFINES
# 
DEFINES += \
$${libargo_DEFINES} \

########################################################################
# OBJECTIVE_HEADERS
#
OBJECTIVE_HEADERS += \
$${libargo_OBJECTIVE_HEADERS} \

# OBJECTIVE_SOURCES
#
OBJECTIVE_SOURCES += \
$${libargo_OBJECTIVE_SOURCES} \

########################################################################
# HEADERS
#
HEADERS += \
$${libargo_HEADERS} \
$${libargo_OBJECTIVE_HEADERS} \

# SOURCES
#
SOURCES += \
$${libargo_SOURCES} \

########################################################################

