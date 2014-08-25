#!/bin/bash -e

################################################################################
# VISIT version 2.7.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

OPENMPIVERSION="1.4.3-gcc-psm"
OPENMPIDIR="$INSTALLDIR/openmpi/$OPENMPIVERSION"

module unload openmpi
module load openmpi/1.4.3-gcc-psm

#mkdir 3rdparty

# Now run the build_visit script
yes yes | env PAR_INCLUDE="-I$OPENMPIDIR/include" PAR_COMPILER="$OPENMPIDIR/bin/mpic++" ./build_visit --console --thirdparty-path 3rdparty/ --parallel --silo --makeflags '-j 4'

# Create the binary package to install
cd visit2.7.2/src
make package
tar xf visit2_7_2.linux-x86_64.tar.gz
mkdir -p $APPDIR
cp -arf visit2_7_2.linux-x86_64/* $APPDIR
chmod -R o+rx $APPDIR
