#!/bin/bash

################################################################################
# HDF5 version 1.6.10 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="hdf5"
VERSION="1.6.10"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR --enable-parallel --enable-shared CC=mpicc
make
make test
make install
