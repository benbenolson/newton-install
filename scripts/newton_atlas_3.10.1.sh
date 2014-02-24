#!/bin/bash

################################################################################
# ATLAS version 3.10.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="atlas"
VERSION="3.10.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

mkdir buildir
cd buildir
../configure --prefix=$INSTALLDIR/$APPNAME/$VERSION
make
make check
make install
