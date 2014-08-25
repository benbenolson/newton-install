#!/bin/bash -e

################################################################################
# octave version 3.6.4 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

export CC="icc"
export CXX="icc"
export F77="ifort"
export CFLAGS="-O3 -fPIC -DMKL_LP64"
export CPPFLAGS="-I$MKLROOT/include -I$MKLROOT/include/fftw"
export LDFLAGS="-L$MKLROOT/lib/intel64 -L$MKLROOT/../compiler/lib/intel64"
export LD_LIBRARY_PATH="$MKLROOT/lib/intel64:$MKLROOT/../compiler/lib/intel64:$LD_LIBRARY_PATH"

./configure --prefix=$APPDIR \
            --with-blas="-Wl,--start-group -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -Wl,--end-group -liomp5 -lpthread" \
            --with-lapack="-Wl,--start-group -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -Wl,--end-group -liomp5 -lpthread" \
            --without-curl \
            --enable-docs=no

make -j8
make check
make install
