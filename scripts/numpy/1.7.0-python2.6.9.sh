#!/bin/bash -e

################################################################################
# NumPy version 1.7.0-python2.6.9 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load python/2.6.9
python setup.py build
python setup.py install --prefix=$APPDIR
