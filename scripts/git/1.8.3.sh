#!/bin/bash -e

################################################################################
# GIT version 1.8.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


make clean
make configure
./configure --prefix=$APPDIR
make all
make install
