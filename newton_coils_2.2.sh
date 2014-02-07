#!/bin/bash

################################################################################
# COILS version 2.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="coils"
VERSION="2.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load intel-compilers

icc -O2 -I. -o ncoils-osf ncoils.c read_matrix.c -lm
mkdir -p $APPDIR
cp -rf * $APPDIR
