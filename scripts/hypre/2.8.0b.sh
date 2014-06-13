#!/bin/bash -e

################################################################################
# HYPRE version 2.8.0b INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load openmpi/1.4.3-intel-psm

cd src
./configure --prefix=$APPDIR --with-MPI --with-openmp --with-blas --with-lapack --with-lapack-lib-dirs=$INSTALLDIR/intel/2011.5.220/mkl/lib/intel64/ --with-blas-lib-dirs=$INSTALLDIR/intel/2011.5.220/mkl/lib/intel64/ CC=mpicc CXX=mpicxx F77=mpif77
make install
