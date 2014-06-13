#!/bin/bash -e

################################################################################
# LAMMPS version 13May14 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################


module load gcc/4.8.2 #To avoid an incompatibility issue with GCC 4.8.1
module load fftw/2.1.5
module load openmpi/1.4.3-intel-psm

cd src
make yes-standard
make no-gpu no-meam no-poems no-reax no-voronoi no-kim
make openmpi CC=mpicc FFT_INC="-DFFT_FFTW -I$INSTALLDIR/fftw/2.1.5/include" FFT_PATH="-L$INSTALLDIR/fftw/2.1.5/lib"
mkdir -p $APPDIR
cp lmp_openmpi $APPDIR
cd $APPDIR
ln -s lmp_openmpi lmp

