#!/bin/bash

################################################################################
# ffmpeg version 0.11.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="ffmpeg"
VERSION="0.11.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load yasm/1.1.0
module load gcc/4.8.1

./configure --prefix=$APPDIR
make install
