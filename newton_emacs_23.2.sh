#!/bin/bash

################################################################################
# EMACS version 23.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

APPNAME="emacs"
VERSION="23.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR --with-gif=no
make -j 8
make install
