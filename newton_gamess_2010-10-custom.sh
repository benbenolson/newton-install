#!/bin/bash

################################################################################
# GAMESS version 2010-10 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   Manually wrote the configuration file "install.info".
################################################################################

APPNAME="gamess"
VERSION="2010-10"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module switch openmpi openmpi/1.4.3-gcc-psm

rm gamess.01.x

export GMS_MKL_VERNO="11"

cp newton_install/install.info .
./compall
./lked gamess 01
