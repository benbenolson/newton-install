#!/bin/bash

################################################################################
# TMUX version 1.7 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="tmux"
VERSION="1.7"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load libevent/2.0.21
./configure --prefix=$APPDIR
make
make install
