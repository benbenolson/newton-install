#!/bin/csh 

################################################################################
# GaussView version 509 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

mkdir -p $APPDIR
cp -a * $APPDIR/
chgrp -R newton $APPDIR

