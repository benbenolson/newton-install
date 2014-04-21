#!/bin/bash

################################################################################
# HMMER version 3.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="hmmer"
VERSION="3.0"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR --enable-sse --enable-mpi --enable-threads CC=icc CFLAGS=-O3 MPICC=mpicc
make
make check
make install
