#!/bin/bash -e

################################################################################
# blast version 2.2.24 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

module unload intel-compilers
module load python/2.7.3
module load boost/1.46.1

cd c++
yes yes | ./configure --prefix=$APPDIR CC=gcc CXX=g++
make -j 8 
make install
