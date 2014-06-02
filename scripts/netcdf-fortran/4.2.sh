#!/bin/bash -e

################################################################################
# NETCDF version 4.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


module load netcdf/4.2.1-intel

CC="icc" FC="ifort" CPPFLAGS="-I$APPDIR/include" LDFLAGS="-L$APPDIR/lib -lnetcdf" LD_LIBRARY_PATH="$APPDIR/lib" ./configure --prefix=$APPDIR
make
make check
make install
