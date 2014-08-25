#!/bin/bash -e

################################################################################
# VTK version 5.8.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load cmake/2.8.8

mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=$APPDIR ..
make -j 8
make install
