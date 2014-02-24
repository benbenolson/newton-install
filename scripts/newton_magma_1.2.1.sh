#!/bin/bash

################################################################################
# MAGMA version 1.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   Makefile.internal: changed "prefix ?= ./install" to "prefix = $(APPDIR)
#   make.inc: copied make.inc.int64 to make.inc; changed CUDADIR to $(CUDADIR)
################################################################################

APPNAME="magma"
VERSION="1.2.1"
export APPDIR="$INSTALLDIR/$APPNAME/$VERSION"
CUDAVERSION="4.2"
MKLVERSION="11.1.072"

export NEWTON_CUDADIR="$INSTALLDIR/cuda/$CUDAVERSION/toolkit"
export MKLDIR="$INSTALLDIR/intel/$MKLVERSION/mkl"

module load cuda/4.2

make
make install
cat ./lib/pkgconfig/magma.pc.in | sed -e s:\__PREFIX:"$APPDIR": | sed -e s:\__LIBEXT:"-L$MKLDIR/lib/em64t -L$NEWTON_CUDADIR/lib64 -lmkl_gf_ilp64 -lmkl_gnu_thread -lmkl_core -lpthread -lcublas -lm -fopenmp": > $APPDIR/lib/pkgconfig/magma.pc
make
