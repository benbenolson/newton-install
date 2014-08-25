#!/bin/csh 

################################################################################
# Gaussian g09 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

module load pgi/13.5

mkdir -p $APPDIR
cp -a * $APPDIR
cd $APPDIR/..
setenv g09root `pwd`
cd $APPDIR
bsd/install
source bsd/g09.login
bsd/bldg09
chgrp -R newton $APPDIR

