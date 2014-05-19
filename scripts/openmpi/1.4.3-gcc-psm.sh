#!/bin/bash -e

################################################################################
# OPENMPI version 1.4.3-gcc-psm INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="openmpi"
VERSION="1.4.3-gcc-psm"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

#Install with GCC compilers
module unload intel-compilers
./configure --prefix=$APPDIR-gcc-psm --with-psm --with-sge=yes
make -j 8
make check
make install
