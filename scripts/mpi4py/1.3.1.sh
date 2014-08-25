#!/bin/bash -e

################################################################################
# mpi4py version 1.3.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

module load openmpi/1.6.3-intel-psm

python setup.py build
python setup.py install --home=$APPDIR
cp -r demo docs $APPDIR
