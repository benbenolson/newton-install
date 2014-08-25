#!/bin/bash -e

################################################################################
# Ruby version 2.1.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


./configure --prefix=$APPDIR
make
make test
make install

