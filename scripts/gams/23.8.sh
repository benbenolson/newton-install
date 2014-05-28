#!/bin/bash -e

################################################################################
# GAMS version 23.8 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################


./linux_x64_64_sfx.exe
mkdir -p $APPDIR
cp -r gams23.8_linux_x64_64_sfx/* $APPDIR
