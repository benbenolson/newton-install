#!/bin/bash -e

################################################################################
# ROOT version 5.34.14 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load gsl/1.15
module load fftw/3.2.2
./configure linuxx8664icc \
            --prefix=$APPDIR \
            --with-gsl-incdir=$INSTALLDIR/gsl/1.15/include/gsl  \
            --with-gsl-libdir=$INSTALLDIR/gsl/1.15/lib \
            --enable-fftw3 --enable-minuit2 --enable-mathmore --enable-x11 \
            --with-fftw3-libdir=$INSTALLDIR/fftw/3.2.2-test/lib \
            --with-fftw3-incdir=$INSTALLDIR/fftw/3.2.2-test/include
make
make install
