#!/bin/bash

################################################################################
# PYTHON version 2.7.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="python"
VERSION="2.7.3"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix="$APPDIR"
make
make test
make install
