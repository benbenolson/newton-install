#!/bin/bash -e

################################################################################
# SCIPY version 0.12.0-python2.7.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

#Load the newest Intel compilers
module unload intel-compilers
module load intel-compilers/2013.1
module load python/2.7.3
module load numpy/1.7.0-python2.7.3

#Use the correct version of MKL
export BLAS="$INSTALLDIR/intel/2013.1/mkl/lib/intel64/libmkl_core.a"
export LAPACK="$BLAS"

#Compile the python2 version
python setup.py build
python setup.py install --prefix=$APPDIR
