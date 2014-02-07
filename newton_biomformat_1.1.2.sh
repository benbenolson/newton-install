#!/bin/bash

################################################################################
# BIOM_FORMAT version 1.1.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="biomformat"
VERSION="1.1.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module unload python
module unload numpy
module load python/2.7.3
module load numpy/1.7.0-python2.7.3
python setup.py install
