#!/bin/bash -e

################################################################################
# Wine version 1.1.27 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

./configure --prefix=$APPDIR --enable-win64
make depend
make -j2
make install

