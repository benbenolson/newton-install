#!/bin/bash -e

################################################################################
# PYTHON version 2.7.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="python"
VERSION="2.7.3"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

make clean
./configure --prefix="$APPDIR"
make
make install
