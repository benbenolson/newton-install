#!/bin/bash

################################################################################
# R version 3.0.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="r"
VERSION="3.0.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR
make -j 8
make check
make install
