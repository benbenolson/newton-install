#!/bin/bash -e

################################################################################
# PYTHON version 2.6.9 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix="$APPDIR"
make -j8
make install
