#!/bin/bash -e

################################################################################
# JAVA version jdk1.6.0_25_x64 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="java"
VERSION="jdk1.6.0_25_x64"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

mkdir -p $APPDIR
rm -rf $APPDIR/*
cp -rf * $APPDIR
