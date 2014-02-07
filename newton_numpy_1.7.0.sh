#!/bin/bash

################################################################################
# NumPy version 1.7.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="numpy"
VERSION="1.7.0"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load python/2.7.3
python setup.py build
python setup.py install --prefix=$APPDIR

module switch python/2.7.3 python/3.2.1
python3 setup.py build
python3 setup.py install --prefix=$APPDIR
