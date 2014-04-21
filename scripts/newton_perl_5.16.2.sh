#!/bin/bash

################################################################################
# PERL version 5.16.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="perl"
VERSION="5.16.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./Configure -des -Dprefix=$APPDIR
make test
make install
