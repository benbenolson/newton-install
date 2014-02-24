#!/bin/bash

################################################################################
# CGAL version 4.0.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="cgal"
VERSION="4.0.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load cmake/2.8.8

cmake . -DCMAKE_INSTALL_PREFIX=$APPDIR
make
make install
