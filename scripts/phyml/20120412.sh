#!/bin/bash -e

################################################################################
# PHYML version 20120412 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix=$APPDIR
make
make install
