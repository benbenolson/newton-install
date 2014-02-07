#!/bin/bash

################################################################################
# NETCDF version 4.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="netcdf"
VERSION="4.2.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"
HDF5VERSION=1.8.9-gcc-serial
HDF5DIR="$INSTALLDIR/hdf5/$HDF5VERSION"

module load hdf5/$HDF5VERSION
CPPFLAGS=-I$HDF5DIR/include LDFLAGS=-L$HDF5DIR/lib ./configure --prefix=$APPDIR
make
make check
make install
