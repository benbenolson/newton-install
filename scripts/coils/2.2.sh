#!/bin/bash -e

################################################################################
# COILS version 2.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


icc -O2 -I. -o ncoils-osf ncoils.c read_matrix.c -lm
EXITSTATUS=$?
mkdir -p $APPDIR
cp -af * $APPDIR

exit $EXITSTATUS
