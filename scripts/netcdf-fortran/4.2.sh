#!/bin/bash -e

################################################################################
# NETCDF-FORTRAN version 4.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load netcdf/4.2.1-intel

CC="icc" FC="ifort" ./configure --prefix=$APPDIR
make
make check
make install
