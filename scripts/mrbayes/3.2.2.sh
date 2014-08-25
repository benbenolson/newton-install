#!/bin/bash -e

################################################################################
# mrbayes version 3.2.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

module load openmpi/1.6.3-intel-psm

cd src
autoconf
./configure --enable-mpi=yes --with-beagle=no --prefix=$APPDIR
make -j8

# We have to do this because MrBayes ignores all reasonable attempts to "make install" it
# to anything but /usr/local.
mkdir -p "$APPDIR/bin"
cp mb "$APPDIR/bin"
cd ..
cp -r examples $APPDIR
cp -r documentation $APPDIR
