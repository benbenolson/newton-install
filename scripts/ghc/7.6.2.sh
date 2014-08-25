#!/bin/bash -e

################################################################################
# GHC version 7.6.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

PLAT="x86_64-unknown-linux-gnu"

./configure --prefix=$APPDIR
make install
