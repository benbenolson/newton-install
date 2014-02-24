#!/bin/bash

################################################################################
# PETSC version 3.3-p4 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="petsc"
VERSION="3.3-p4"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR --with-blas-lapack-dir=$INSTALLDIR/intel/2011.5.220/mkl/lib/intel64 --with-hypre=1 --with-hypre-dir=$INSTALLDIR/hypre/2.8.0b --with-valgrind-dir=$INSTALLDIR/valgrind/3.8.0/

make PETSC_DIR=`pwd` PETSC_ARCH=arch-linux2-c-debug all
make PETSC_DIR=`pwd` PETSC_ARCH=arch-linux2-c-debug install
