#!/bin/bash -e

################################################################################
# MUMmer version 3.23 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

mkdir -p $APPDIR
cp -ar * $APPDIR
cd $APPDIR

make check
make install
