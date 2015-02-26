#!/bin/bash -e

################################################################################
# PYTHON version 2.7.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix="$APPDIR" --enable-shared
make
make install

export PATH="$APPDIR/bin:$PATH"
export INCLUDE="$APPDIR/include/python2.7:$INCLUDE"

cd docutils_0.11
./setup.py install
