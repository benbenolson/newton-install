#!/bin/bash

################################################################################
# PERL version 5.16.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="perl"
VERSION="5.16.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

echo ./Configure -des -Dprefix=$APPDIR
make test
make install
