#!/bin/bash

################################################################################
# JAVA version 1.7u7 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="java"
VERSION="1.7u7"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

mkdir -p $APPDIR
rm -rf $APPDIR/*
cp -rf * $APPDIR
