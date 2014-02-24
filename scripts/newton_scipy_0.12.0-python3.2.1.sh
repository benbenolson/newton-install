#!/bin/bash

################################################################################
# SCIPY version 0.12.0-python3.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="scipy"
VERSION="0.12.0-python3.2.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

#Load the newest Intel compilers
module switch intel-compilers intel-compilers/2013.1

#Use the correct version of MKL
export BLAS="$INSTALLDIR/intel/2013.1/mkl/lib/intel64/libmkl_core.a"
export LAPACK="$BLAS"

#Compile the python3 version
module switch python  python/3.2.1
module switch numpy numpy/1.7.0-python3.2.1
python setup.py build
python setup.py install --prefix=$APPDIR
