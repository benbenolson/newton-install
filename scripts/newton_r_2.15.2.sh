#!/bin/bash

################################################################################
# R version 2.15.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="r"
VERSION="2.15.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR
make -j 8
make check
make install
