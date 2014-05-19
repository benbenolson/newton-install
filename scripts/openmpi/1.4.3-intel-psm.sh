#!/bin/bash -e

################################################################################
# OPENMPI version 1.4.3-intel-psm INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="openmpi"
VERSION="1.4.3-intel-psm"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

#Install with Intel compilers
./configure --prefix=$APPDIR-intel-psm --with-psm --with-sge=yes CC=icc CXX=icpc F77=ifort FC=ifort
make -j 8
make check
make install
