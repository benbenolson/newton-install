#!/bin/bash -e

################################################################################
# Migrate INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

module load openmpi/1.4.3-intel-psm

cd src
./configure
make
make thread
make mpis
mkdir -p $APPDIR
cp migrate-n migrate-n-mpi $APPDIR/

