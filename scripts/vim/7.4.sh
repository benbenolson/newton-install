#!/bin/bash -e

################################################################################
# VIM version 7.4 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix=$APPDIR
make -j8
make install
