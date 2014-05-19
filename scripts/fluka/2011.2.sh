#!/bin/bash -e

################################################################################
# FLUKA version 2011.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="fluka"
VERSION="2011.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

make clean
mkdir -p $APPDIR
export FLUPRO=$PWD
make
EXITSTATUS=$?
cp -rf * $APPDIR

exit $EXITSTATUS
