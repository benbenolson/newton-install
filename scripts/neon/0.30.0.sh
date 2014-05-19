#!/bin/bash -e

################################################################################
# NEON version 0.30.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="neon"
VERSION="0.30.0"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR --with-ssl=openssl
make
make check
make install
