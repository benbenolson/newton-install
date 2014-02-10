#!/bin/bash

################################################################################
# BINUTILS version 2.22 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="binutils"
VERSION="2.22"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

CC=gcc ./configure --prefix=$APPDIR
make
make install
