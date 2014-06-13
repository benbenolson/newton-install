#!/bin/bash -e

################################################################################
# NETCDF version 1.3.0-parallel INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

OPENMPIVERSION="1.4.3-intel-psm"
OPENMPIDIR="$INSTALLDIR/openmpi/$OPENMPIVERSION"

module load openmpi/$OPENMPIVERSION

CC="icc" FC="ifort" F77="ifort" FFLAGS="-assume no2underscores" ./configure --prefix=$APPDIR --with-mpi=$OPENMPIDIR --enable-fortran
make
make check
make install
