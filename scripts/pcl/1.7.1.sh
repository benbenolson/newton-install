#!/bin/bash -e

################################################################################
# PCL version 1.7.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load flann/1.8.4
module load vtk/5.8.0
module load boost/1.46.1
module load eigen/3.2.1
module load cmake/2.8.8

mkdir build
cd build

# Define the locations of the Boost libraries
BOOST_ROOT="$INSTALLDIR/boost/1.46.1"
BOOST_INCLUDE="$BOOST_ROOT/include/boost-1_46_1"
BOOST_LIBDIR="$BOOST_ROOT/lib"
BOOST_DATE_TIME="$BOOST_ROOT/lib/libboost_date_time-gcc44-mt.so"
BOOST_FILESYSTEM="$BOOST_ROOT/lib/libboost_filesystem-gcc44-mt.so"
BOOST_SYSTEM="$BOOST_ROOT/lib/libboost_system-gcc44-mt.so"
BOOST_THREAD="$BOOST_ROOT/lib/libboost_thread-gcc44-mt.so"

# Define the locations of the FLANN library
FLANN_ROOT="$INSTALLDIR/flann/1.8.4"
FLANN_LIBRARY="$FLANN_ROOT/lib/libflann.so"
FLANN_INCLUDE_DIR="$FLANN_ROOT/include"

cmake -DBoost_DATE_TIME_LIBRARY=$BOOST_DATE_TIME \
      -DBoost_DATE_TIME_LIBRARY_DEBUG=$BOOST_DATE_TIME \
      -DBoost_DATE_TIME_LIBRARY_RELEASE=$BOOST_DATE_TIME \
      -DBoost_FILESYSTEM_LIBRARY=$BOOST_FILESYSTEM \
      -DBoost_FILESYSTEM_LIBRARY_DEBUG=$BOOST_FILESYSTEM \
      -DBoost_FILESYSTEM_LIBRARY_RELEASE=$BOOST_FILESYSTEM \
      -DBoost_INCLUDE_DIR=$BOOST_INCLUDE \
      -DBoost_LIBRARY_DIRS=$BOOST_LIBDIR \
      -DBoost_SYSTEM_LIBRARY=$BOOST_SYSTEM \
      -DBoost_SYSTEM_LIBRARY_DEBUG=$BOOST_SYSTEM \
      -DBoost_SYSTEM_LIBRARY_RELEASE=$BOOST_SYSTEM \
      -DBoost_THREAD_LIBRARY=$BOOST_THREAD \
      -DBoost_THREAD_LIBRARY_DEBUG=$BOOST_THREAD \
      -DBoost_THREAD_LIBRARY_RELEASE=$BOOST_THREAD \
      -DFLANN_LIBRARY=$FLANN_LIBRARY \
      -DFLANN_INCLUDE_DIR=$FLANN_INCLUDE_DIR \
      -DCMAKE_INSTALL_PREFIX=$APPDIR \
      ..
#ccmake ..
make -j 8
make install
