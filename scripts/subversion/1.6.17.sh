#!/bin/bash -e

################################################################################
# SUBVERSION version 1.6.17 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

SQLITEDIR="$INSTALLDIR/sqlite/3.7.6.3"
NEONDIR="$INSTALLDIR/neon/0.30.0"

./configure --prefix=$APPDIR --with-sqlite=$SQLITEDIR --with-ssl --with-neon=$NEONDIR
make -j 8
make check
make install
