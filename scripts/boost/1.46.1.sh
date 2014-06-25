#!/bin/bash -e

################################################################################
# BOOST version 1.46.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./bootstrap.sh --prefix=$APPDIR
./bjam cxxflags=-fPIC --layout=versioned --build-type=complete --without-mpi -j 4 install
