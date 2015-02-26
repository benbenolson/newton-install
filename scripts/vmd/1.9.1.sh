#!/bin/bash -e

################################################################################
# VMD version 1.9.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load netcdf/4.2.1-intel
export CC=icc
export CXX=icpc
export FC=ifort
export NETCDFINC="-I$INSTALLDIR/netcdf/4.2.1-intel/include"
export NETCDFLIB="-L$INSTALLDIR/netcdf/4.2.1-intel/lib"
export PLUGINDIR="$APPDIR/plugins"

cd plugins
make LINUXAMD64 -j8
make distrib
cd ..

cd vmd-1.9.1
ln -s $APPDIR/plugins plugins
./configure LINUXAMD64 --prefix=$APPDIR
make -j8
make install
cd ..
