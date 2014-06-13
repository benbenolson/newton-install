#!/bin/bash -e

################################################################################# ELMER version  INSTALL SCRIPT
# IMB version 3.2.4 for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

module load openmpi/1.4.3-intel-psm

cd src
make clean
make all CC=mpicc
cd ..
mkdir -p $APPDIR
cp -rf * $APPDIR
