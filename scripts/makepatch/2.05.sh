#!/bin/bash -e

################################################################################
# MAKEPATCH version 2.05 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="perl"
VERSION="5.16.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load perl/5.16.2

perl Makefile.PL
make
make install

