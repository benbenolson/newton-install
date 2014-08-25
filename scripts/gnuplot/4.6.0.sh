#!/bin/bash -e

################################################################################
# GNUPLOT version 4.6.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################


./configure --prefix=$APPDIR
make
make install
