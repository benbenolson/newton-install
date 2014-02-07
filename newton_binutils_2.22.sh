#!/bin/bash

################################################################################
# BINUTILS version 2.22 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="binutils"
VERSION="2.22"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

CC=gcc ./configure --prefix=$INSTALLDIR/$APPNAME/$VERSION
make
make install
