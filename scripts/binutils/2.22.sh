#!/bin/bash -e

################################################################################
# BINUTILS version 2.22 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


CC=gcc ./configure --prefix=$APPDIR
make
make install
