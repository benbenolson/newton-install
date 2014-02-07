#!/bin/bash

################################################################################
# OPENMPI version 1.6.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="openmpi"
VERSION="1.6.3"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load intel-compilers
./configure --prefix=$APPDIR-intel-psm --with-psm --with-sge=yes CC=icc CXX=icpc F77=ifort FC=ifort
make -j 8
make check
make install
