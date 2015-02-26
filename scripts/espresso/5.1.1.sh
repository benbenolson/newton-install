#!/bin/bash -e

################################################################################
# Quantum Espresso version 5.1.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load openmpi/1.4.3-intel-psm

./configure --prefix=$APPDIR
make all
make install
