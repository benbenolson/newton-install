#!/bin/bash -e

################################################################################
# CMAKE version 3.1.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################


./configure --prefix=$APPDIR
make
make install
