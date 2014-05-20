#!/bin/bash -e

################################################################################
# BOOST version 1.51 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="boost"
VERSION="1.51"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./bootstrap.sh --prefix=/$APPDIR
./b2 install --prefix=$APPDIR