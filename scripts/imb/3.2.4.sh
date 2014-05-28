#!/bin/bash -e

################################################################################# ELMER version  INSTALL SCRIPT
# IMB version 3.2.4 for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################


cd src
make clean
make all CC=mpicc
cd ..
mkdir -p $APPDIR
cp -rf * $APPDIR
