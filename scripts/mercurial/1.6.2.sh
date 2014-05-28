#!/bin/bash -e

################################################################################
# MERCURIAL version 1.6.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################


make PREFIX=$APPDIR all
make PREFIX=$APPDIR install
