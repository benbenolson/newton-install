#!/bin/bash

################################################################################
# PYTHON version 3.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="python"
VERSION="3.2.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR
make
make install
cd $APPDIR/bin
ln -s python3 python
