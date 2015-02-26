#!/bin/bash -e

################################################################################
# SERF version 1.3.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

CURDIR=$PWD

#First build APR
cd apr
./configure --prefix="$CURDIR/apr-install"
make -j8
make install
cd ..

#Now build APU
cd apu
./configure --prefix="$CURDIR/apu-install" --with-apr="$CURDIR/apr-install"
make -j8
make install
cd ..

#Now finally build serf
cd serf
mkdir -p $APPDIR
../scons/scons.py APR="$CURDIR/apr-install" APU="$CURDIR/apu-install" PREFIX="$APPDIR"
../scons/scons.py install
