#!/bin/bash

################################################################################
# BIOPYTHON version 1.58 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="biopython"
VERSION="1.58"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

#Compile the python2 version
module unload python
module unload numpy
module load numpy/1.7.0-python2.7.3
module load python/2.7.3

python setup.py build
python setup.py install --prefix=$APPDIR

