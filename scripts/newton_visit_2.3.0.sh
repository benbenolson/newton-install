#!/bin/bash

################################################################################
# VISIT version 2.3.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

APPNAME="visit"
VERSION="2.3.0"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"
OPENMPIVERSION="1.4.3-gcc-psm"
OPENMPIDIR="$INSTALLDIR/openmpi/$OPENMPIVERSION"

module load cmake
module unload openmpi
module load openmpi/1.4.3-gcc-psm

#First, checkout the build_visit script.
svn cat http://portal.nersc.gov/svn/visit/trunk/src/svn_bin/build_visit > build_visit
chmod 755 build_visit

#Now, safely make the installation directories and copy VisIt into it.
mkdir $INSTALLDIR/$APPNAME
mkdir $APPDIR
cp -rf * $APPDIR
cd $APPDIR
mkdir 3rdparty

#Now run the build_visit script
yes yes | env PAR_INCLUDE="-I$OPENMPIDIR/include" PAR_COMPILER="$OPENMPIDIR/bin/mpic++" ./build_visit --console --thirdparty-path 3rdparty/ --parallel --silo --makeflags '-j 4'
