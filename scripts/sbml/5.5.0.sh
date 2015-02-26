#!/bin/bash -e

################################################################################
# SBML version 5.5.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix=$APPDIR --with-matlab
make -j8
make install
