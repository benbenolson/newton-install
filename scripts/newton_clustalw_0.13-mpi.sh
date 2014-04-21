#!/bin/bash

################################################################################
# clustalw version 0.13-mpi INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

APPNAME="clustalw"
VERSION="0.13-mpi"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

export CC=mpicc
export CXX=mpic++
export CFLAGS=-O3
export CXXFLAGS=-O3

make
EXITSTATUS=$?
make clean
mkdir -p $APPDIR
cp -af * $APPDIR
exit $EXITSTATUS
