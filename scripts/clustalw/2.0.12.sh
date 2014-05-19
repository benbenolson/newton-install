#!/bin/bash -e

################################################################################
# clustalw version 2.0.12 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

APPNAME="clustalw"
VERSION="2.0.12"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR CC=icc CFLAGS=-O3 CXX=icpc CXXFLAGS=-O3
make
make install
