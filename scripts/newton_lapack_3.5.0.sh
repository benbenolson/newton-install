#!/bin/bash

################################################################################
# LAPACK version 3.5.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="lapack"
VERSION="3.5.0"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

#First, build blas and lapack.
cd BLAS/SRC
make
cd ../..
make

#Now copy lapack and blas to their directory.
mkdir /data/apps/lapack
mkdir $APPDIR
cp blas_LINUX.a liblapack.a $APPDIR
