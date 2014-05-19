#!/bin/bash -e

################################################################################
# YASM version 1.1.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="yasm"
VERSION="1.1.0"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR
make
make install
