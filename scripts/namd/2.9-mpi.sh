#!/bin/bash -e

################################################################################
# NAMD version 2.9-mpi INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

# Prepare the environment to build charm
module load openmpi/1.6.3-intel-psm
export MPICXX=mpicc

tar xf charm-6.4.0.tar
cd charm-6.4.0
./build charm++ mpi-linux-x86_64
