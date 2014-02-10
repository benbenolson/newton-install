#!/bin/bash

################################################################################
# FGSL version 0.9.4 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   Deleted parameter "-p" after command "cp" in Makefile
################################################################################

APPNAME="fgsl"
VERSION="0.9.4"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load gcc
module load gsl

./configure --prefix $APPDIR --gsl $INSTALLDIR/gsl/1.15 --bits 64
cp newton_install/Makefile .
make
make test
make install
chmod -R 755 $APPDIR
