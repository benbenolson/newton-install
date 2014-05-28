#!/bin/bash -e

################################################################################
# PGI version 13.5 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


cp -r pgi $INSTALLDIR
cd $APPDIR/linux86-64/13.5/bin
./makelocalrc $APPDIR/linux86-64/13.5/ -x
