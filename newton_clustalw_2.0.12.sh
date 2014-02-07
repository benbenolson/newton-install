#!/bin/bash

################################################################################
# clustalw version 2.0.12 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="clustalw"
VERSION="2.0.12"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load intel-compilers

./configure --prefix=$APPDIR CC=icc CFLAGS=-O3 CXX=icpc CXXFLAGS=-O3
make
make install
