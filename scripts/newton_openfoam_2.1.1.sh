#!/bin/bash

################################################################################
# OPENFOAM version 2.1.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="openfoam"
VERSION="2.1.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

#copy all the files to the installation directory and go there
mkdir -p $APPDIR
cp *.tgz $APPDIR
cd $APPDIR

#Now untar the source files
tar xf ThirdParty-$VERSION.tgz
tar xf OpenFOAM-$VERSION.tgz

#Source openfoam's environment script
export FOAM_INST_DIR=$APPDIR
foamDotFile=$FOAM_INST_DIR/OpenFOAM-2.1.1/etc/bashrc
[ -f $foamDotFile ] && . $foamDotFile

#Check the environment
bash $APPDIR/OpenFOAM-2.1.1/bin/foamSystemCheck
bash $APPDIR/OpenFOAM-2.1.1/Allwmake
