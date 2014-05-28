#!/bin/bash -e

################################################################################
# NETCDF version 4.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

HDF5DIR="$INSTALLDIR/hdf5/$HDF5VERSION"

module load hdf5/1.8.9-gcc-serial

CC=pgcc FC=pgf90 CPPFLAGS=-I$HDF5DIR/include LDFLAGS=-L$HDF5DIR/lib ./configure --prefix=$APPDIR
make -j4 && make check && make install
