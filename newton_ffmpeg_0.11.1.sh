#!/bin/bash

################################################################################
# ffmpeg version 0.11.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="ffmpeg"
VERSION="0.11.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load yasm
module load gcc
./configure --prefix=$APPDIR
make install
