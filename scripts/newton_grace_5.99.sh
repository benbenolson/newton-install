#!/bin/bash

################################################################################
# GRACE version 5.99 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="grace"
VERSION="5.99"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR --enable-grace-home=$APPDIR --enable-netcdf --enable-jpegdrv --enable-pngdrv --enable-editres --enable-xmhtml --with-fftw --with-x

make
make install
cd $APPDIR/doc
mkdir man1
mv *.1 man1
cd ../bin
ln -s xmgrace-5.99.0 grace
ln -s xmgrace-5.99.0 xmgrace
ln -s xmgrace-5.99.0 gracebat
