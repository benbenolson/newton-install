#!/bin/bash -e

################################################################################
# GHC version 7.6.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="ghc"
VERSION="7.6.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"
PLAT="x86_64-unknown-linux-gnu"

./configure --prefix=$APPDIR
make
make install
