#!/bin/bash -e

################################################################################
# CMAKE version 2.8.8 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################


./configure --prefix=$APPDIR
make
make test
make install
