#!/bin/bash -e

################################################################################
# LIBEVENT version 2.0.21 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


./configure --prefix=$APPDIR
make
make install
