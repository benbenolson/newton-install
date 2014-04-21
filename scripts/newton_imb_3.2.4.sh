#!/bin/bash

################################################################################# ELMER version  INSTALL SCRIPT
# IMB version 3.2.4 for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="imb"
VERSION="3.2.3"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

cd src
make clean
make all CC=mpicc
cd ..
mkdir -p $APPDIR
cp -rf * $APPDIR
