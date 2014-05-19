#!/bin/bash -e

################################################################################
# GPT version 3.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################
APPNAME="gpt"
VERSION="3.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

export GPT_LOCATION=$APPDIR
./build_gpt
