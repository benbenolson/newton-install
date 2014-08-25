#!/bin/bash -e

################################################################################
# SQLITE version 3.7.6.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


./configure --prefix=$APPDIR
make
make install
