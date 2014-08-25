#!/bin/bash -e

################################################################################
# EMACS version 23.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################


./configure --prefix=$APPDIR --with-gif=no
make -j 8
make install
