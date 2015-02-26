#!/bin/bash -e

################################################################################
# MPICH version 3.1.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix=$APPDIR
make -j8
make install
