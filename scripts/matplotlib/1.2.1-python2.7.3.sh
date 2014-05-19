#!/bin/bash -e

################################################################################
# MATPLOTLIB version 1.2.1-python2.7.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="matplotlib"
VERSION="1.2.1-python2.7.3"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module unload python
module unload numpy
module load python/2.7.3
module load numpy/1.7.0-python2.7.3
python setup.py install --prefix=$APPDIR
