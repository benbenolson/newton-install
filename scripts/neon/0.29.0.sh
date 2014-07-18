#!/bin/bash -e

################################################################################
# NEON version 0.29.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


./configure --prefix=$APPDIR --with-ssl=openssl
make
#make check appears to never end
make install
