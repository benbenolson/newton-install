#!/bin/bash -e

################################################################################
# GOTOBLAS2 version 1.13 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################


make BINARY=64 CC=icc FC=ifort
mkdir -p $APPDIR
cp -rf * $APPDIR
