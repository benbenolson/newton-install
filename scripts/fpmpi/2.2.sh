#!/bin/bash -e

################################################################################
# FPMPI version 2.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################


module unload openmpi
module load openmpi/1.4.3-intel-psm

./configure --with-mpi=$INSTALLDIR/openmpi/1.4.3-intel-psm/bin --prefix=$APPDIR
make
make install
