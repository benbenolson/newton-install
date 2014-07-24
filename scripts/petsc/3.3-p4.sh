#!/bin/bash -e

################################################################################
# PETSC version 3.3-p4 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load hypre/2.8.0b
module load valgrind/3.8.0
module load openmpi/1.4.3-intel-psm

LAPACK=$INSTALLDIR/intel/2011.5.220/mkl/lib/intel64
HYPRE=$INSTALLDIR/hypre/2.8.0b
VALGRIND=$INSTALLDIR/valgrind/3.8.0
MPI=$INSTALLDIR/openmpi/1.4.3-intel-psm

./configure --prefix=$APPDIR \
  --with-blas-lapack-dir=$LAPACK \
  --with-hypre=1 \
  --with-hypre-dir=$HYPRE \
  --with-valgrind-dir=$VALGRIND \
  --with-mpi-dir=$MPI

make PETSC_DIR=`pwd` PETSC_ARCH=arch-linux2-c-debug all
make PETSC_DIR=`pwd` PETSC_ARCH=arch-linux2-c-debug install
