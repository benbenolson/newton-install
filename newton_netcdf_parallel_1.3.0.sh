#!/bin/bash

################################################################################
# NETCDF version 1.3.0-parallel INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="netcdf"
VERSION="1.3.0-parallel"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"
OPENMPIVERSION="1.4.3-intel-psm"
OPENMPIDIR="$INSTALLDIR/openmpi/$OPENMPIVERSION"

CC="icc" FC="ifort" F77="ifort" FFLAGS="-assume no2underscores" ./configure --prefix=$APPDIR --with-mpi="$OPENMPIDIR" --enable-fortran
make
make check
make install
