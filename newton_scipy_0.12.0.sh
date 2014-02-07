#!/bin/bash

################################################################################
# SCIPY version 0.12.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="scipy"
VERSION="0.12.0"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

#Load the newest Intel compilers
module unload intel-compilers
module load intel-compilers/2013.1

#Use the correct version of MKL
export BLAS="/data/apps/intel/2013.1/mkl/lib/intel64/libmkl_core.a"
export LAPACK="$BLAS"

#Compile the python2 version
module unload python
module unload numpy
module load python/2.7.3
module load numpy/1.7.0-python2.7.3
python setup.py build
python setup.py install --prefix=$APPDIR

#Compile the python3 version
module unload python
module unload numpy
module load python/3.2.1
module load numpy/1.7.0-python3.2.1
python setup.py build
python setup.py install --prefix=$APPDIR
