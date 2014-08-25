#!/bin/bash -e

################################################################################
# HDF5 version 1.8.9-gcc-serial INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   Patched a filename changed with cmake_patch.txt
################################################################################


patch -f < cmake_patch.txt
CC=gcc ./configure --prefix=$APPDIR --disable-parallel --enable-shared
make
make test
make install
