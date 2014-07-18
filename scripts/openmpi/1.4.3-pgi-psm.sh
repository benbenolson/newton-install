#!/bin/bash -e

################################################################################
# OPENMPI version 1.4.3-pgi-psm INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

#Install with PGI compilers
module unload intel-compilers
module load pgi/13.5

./configure --prefix=$APPDIR --with-psm --with-sge=yes CC=pgcc CXX=pgCC F77=pgfortran FC=pgfortran
make -j 8
make check
make install
