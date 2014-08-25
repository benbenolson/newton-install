#!/bin/bash -e

################################################################################
# LXML version 3.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


module load python/2.7.3
module load numpy/1.7.0-python2.7.3

python setup.py install
mkdir -p $APPDIR
