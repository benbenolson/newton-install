#!/bin/bash

################################################################################
# MERCURIAL version 1.6.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="mercurial"
VERSION="1.6.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

make PREFIX=$APPDIR all
make PREFIX=$APPDIR install
