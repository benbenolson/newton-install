#!/bin/bash -e

################################################################################
# FLUKA version 2011.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################


make clean
mkdir -p $APPDIR
export FLUPRO=$PWD
make
EXITSTATUS=$?
cp -rf * $APPDIR

exit $EXITSTATUS
