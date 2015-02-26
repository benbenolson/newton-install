#!/bin/bash -e

################################################################################
# OPENCV version 2.4.10 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load python/2.7.3-shared
module load numpy/1.7.0-python2.7.3
module load cmake/3.1.0
module load gcc/4.8.2

mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=$APPDIR \
      -D BUILD_OPENCV_PYTHON=ON \
      -D PYTHON_LIBRARY=$INSTALLDIR/python/2.7.3-shared/lib/libpython2.7.so \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D BUILD_EXAMPLES=ON \
      ..
make
make install
