#!/bin/bash

################################################################################
# LIBEVENT version 2.0.21 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="libevent"
VERSION="2.0.21"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR
make
make install
