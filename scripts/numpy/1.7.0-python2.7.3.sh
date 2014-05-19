#!/bin/bash -e

################################################################################
# NumPy version 1.7.0-python2.7.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="numpy"
VERSION="1.7.0-python2.7.3"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load python/2.7.3
python setup.py build
python setup.py install --prefix=$APPDIR
