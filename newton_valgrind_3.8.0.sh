#!/bin/bash

################################################################################
# VALGRIND version 3.8.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="valgrind"
VERSION="3.8.0"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR --with-mpicc=mpicc --enable-only64bit
make check
make install
