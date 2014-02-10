#!/bin/bash

################################################################################
# SQLITE version 3.7.6.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="sqlite"
VERSION="3.7.6.3"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR
make
make install
