#!/bin/bash

################################################################################
# ELMER version 6518 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="elmer"
VERSION="6518"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module switch intel-compilers intel-compilers/2013.1

export CC=icc
export CXX=icc
export FC=ifort
export F77=ifort
export CFLAGS=-fPIC
export CPPFLAGS=-fPIC
export FFLAGS=-fPIC

modules="matc umfpack mathlibs elmergrid meshgen2d eio hutiter fem" 
for m in $modules; do
  cd $m
  make clean
  make distclean
  ./configure --prefix=$APPDIR
  make
  make install
  cd .. 
done

