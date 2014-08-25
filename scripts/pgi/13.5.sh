#!/bin/bash -e

################################################################################
# PGI version 13.5 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

echo Copying the files...
cp -r pgi $INSTALLDIR
echo CDing to the proper directory...
cd $APPDIR/linux86-64/13.5/bin
echo Running the makelocalrc script...
./makelocalrc $APPDIR/linux86-64/13.5/ -x
