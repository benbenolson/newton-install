#!/bin/bash

################################################################################
# XCRYSDEN version 1.5.60 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   Added Make.newton to the ./system directory
################################################################################

module load tcltk/8.6.2
module load fftw/3.2.2

cp ./system/Make.newton ./Make.sys
make -j8 all
prefix="$APPDIR" make install
