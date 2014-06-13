#!/bin/bash -e

################################################################################
# HDF5 version 1.6.10 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load openmpi/1.4.3-intel-psm

./configure --prefix=$APPDIR --enable-parallel --enable-shared CC=mpicc
make
make test
make install
