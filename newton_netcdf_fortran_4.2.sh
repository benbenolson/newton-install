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

module load netcdf/4.2.1
CC="icc" FC="ifort" CPPFLAGS="-I$APPDIR/include" LDFLAGS="-L$APPDIR/lib -lnetcdf" LD_LIBRARY_PATH="$APPDIR/lib" ./configure --prefix=$APPDIR
make
make check
make install
