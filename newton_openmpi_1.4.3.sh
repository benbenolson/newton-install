#!/bin/bash

################################################################################
# OPENMPI version 1.4.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="openmpi"
VERSION="1.4.3"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

#Install with Intel compilers
module load intel-compilers
./configure --prefix=$APPDIR-intel-psm --with-psm --with-sge=yes CC=icc CXX=icpc F77=ifort FC=ifort
make -j 8
make check
make install

make distclean

#Install with GCC compilers
module unload intel-compilers
./configure --prefix=$APPDIR-gcc-psm --with-psm --with-sge=yes
make -j 8
make check
make install

make distclean

#Install with PGI compilers
module unload intel-compilers
module load pgi
./configure --prefix=$APPDIR-pgi-psm --with-psm --with-sge=yes CC=pgcc CXX=pgCC F77=pgfortran FC=pgfortran
make -j 8
make check
make install
