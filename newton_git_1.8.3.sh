#!/bin/bash

################################################################################
# GIT version 1.8.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="git"
VERSION="1.8.3"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

make clean
make configure
./configure --prefix=$APPDIR
make all
make install
