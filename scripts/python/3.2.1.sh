#!/bin/bash -e

################################################################################
# PYTHON version 3.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


./configure --prefix=$APPDIR
make
make install
cd $APPDIR/bin
ln -s python3 python
