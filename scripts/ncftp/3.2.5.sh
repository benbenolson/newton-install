#!/bin/bash -e

################################################################################
# NCFTP version 3.2.5 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix=$APPDIR
make -j8
make install
