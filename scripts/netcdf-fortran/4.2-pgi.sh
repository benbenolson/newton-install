#!/bin/bash -e

################################################################################
# NETCDF version 4.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load pgi/13.5
module load netcdf/4.2.1-pgi

NETCDFDIR="$INSTALLDIR/netcdf/4.2.1-pgi"

CC="pgcc" FC="pgf90" CPPFLAGS="-I$NETCDFDIR/include" LDFLAGS="-L$NETCDFDIR/lib -lnetcdf" LD_LIBRARY_PATH="$NETCDFDIR/lib" ./configure --prefix=$APPDIR
make
make check
make install
