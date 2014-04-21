#!/bin/bash

################################################################################
# FLUKA version 2010.2pre INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="fluka"
VERSION="2010.2pre"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

make clean
mkdir -p $APPDIR
export FLUPRO=$PWD
make
EXITSTATUS=$?
cp -rf * $APPDIR

exit $EXITSTATUS
