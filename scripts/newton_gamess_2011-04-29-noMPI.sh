#!/bin/bash

################################################################################
# GAMESS version 2011-04-29-noMPI INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="gamess"
VERSION="2011-04-29-noMPI"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

rm gamess.01.x

./config
./compall
./lked gamess 01
