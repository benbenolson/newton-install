#!/bin/bash -e

################################################################################
# NumPy version 1.7.0-python3.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


module load python/3.2.1
python setup.py build
python setup.py install --prefix=$APPDIR
