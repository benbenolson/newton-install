#!/bin/bash

################################################################################
# OPENMPI version 1.4.3-pgi-psm INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="openmpi"
VERSION="1.4.3-pgi-psm"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

#Install with PGI compilers
module switch intel-compilers pgi
./configure --prefix=$APPDIR-pgi-psm --with-psm --with-sge=yes CC=pgcc CXX=pgCC F77=pgfortran FC=pgfortran
make -j 8
make check
make install
