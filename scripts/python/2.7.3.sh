#!/bin/bash -e

################################################################################
# PYTHON version 2.7.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


make clean
./configure --prefix="$APPDIR"
make
make install
