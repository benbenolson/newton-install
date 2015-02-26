#!/bin/bash -e

################################################################################
# QT version 4.3.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

yes yes | ./configure --prefix=$APPDIR -qt-xcb -opensource -platform linux-g++-32
make -j8
make install
