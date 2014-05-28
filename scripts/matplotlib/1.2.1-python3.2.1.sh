#!/bin/bash -e

################################################################################
# MATPLOTLIB version 1.2.1-python3.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


module unload python
module unload numpy
module load python/3.2.1
module load numpy/1.7.0-python3.2.1
python setup.py install --prefix=$APPDIR
