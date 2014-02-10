#!/bin/bash

################################################################################
# GLOBUS TOOLKIT version 5.2.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="globus"
VERSION="5.2.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load perl

cpan Archive/Tar.pm

which perl

./configure prefix=$APPDIR
export INC=/data/apps/perl/5.16.2/lib/5.16.2
make
make install
