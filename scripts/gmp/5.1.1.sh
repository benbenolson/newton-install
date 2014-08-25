#!/bin/bash -e

################################################################################
# GMP version 5.1.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix=$APPDIR --enable-cxx
make
make check
make install
