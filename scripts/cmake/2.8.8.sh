#!/bin/bash -e

################################################################################
# CMAKE version 2.8.8 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

APPNAME="cmake"
VERSION="2.8.8"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR
make
make test
make install
