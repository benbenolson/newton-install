#!/bin/bash -e

################################################################################
# R version 2.15.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


./configure --prefix=$APPDIR
make -j 8
make check
make install
