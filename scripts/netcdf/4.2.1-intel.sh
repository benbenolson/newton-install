#!/bin/bash -e

################################################################################
# NETCDF version 4.2.1-intel INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="netcdf"
VERSION="4.2.1-intel"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"
HDF5VERSION=1.8.9-gcc-serial
HDF5DIR="$INSTALLDIR/hdf5/$HDF5VERSION"

module load hdf5/1.8.9-gcc-serial

CPPFLAGS=-I$HDF5DIR/include LDFLAGS=-L$HDF5DIR/lib ./configure --prefix=$APPDIR
make -j4 && make check && make install
