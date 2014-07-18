#!/bin/bash -e

################################################################################
# NETCDF version 1.3.0-parallel INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

OPENMPIDIR="$INSTALLDIR/openmpi/1.4.3-intel-psm"

module load openmpi/1.4.3-intel-psm

CC="icc" FC="ifort" F77="ifort" FFLAGS="-assume no2underscores" ./configure --prefix=$APPDIR --with-mpi=$OPENMPIDIR --enable-fortran
make
make install
