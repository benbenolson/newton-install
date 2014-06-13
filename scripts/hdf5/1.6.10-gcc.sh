#!/bin/bash -e

################################################################################
# HDF5 version 1.6.10-gcc INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load openmpi/1.4.3-gcc-psm
#module switch openmpi openmpi/1.4.3-gcc-psm

./configure --prefix=$APPDIR --enable-parallel --enable-shared CC=mpicc
make
make test
make install
