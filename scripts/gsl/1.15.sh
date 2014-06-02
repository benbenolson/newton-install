#!/bin/bash -e

################################################################################
# GSL version 1.15 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


./configure --prefix=$APPDIR
make -j8
make check
make install
