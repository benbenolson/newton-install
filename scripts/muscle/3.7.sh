#!/bin/bash -e

################################################################################
# muscle version 3.7 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

make
mkdir -p $APPDIR/bin
cp muscle $APPDIR/bin
