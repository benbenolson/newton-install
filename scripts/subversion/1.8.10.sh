#!/bin/bash -e

################################################################################
# SUBVERSION version 1.8.10 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   Added sqlite-amalgamation
################################################################################

module load neon/0.29.0

./configure --prefix=$APPDIR --with-ssl --with-neon=$NEON_INSTALLDIR
make -j 4
make check
make install
