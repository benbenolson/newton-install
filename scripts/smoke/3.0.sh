#!/bin/bash -e

################################################################################
# SMOKE version 3.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

export SMK_HOME=$APPDIR
mkdir -p $APPDIR
csh smoke_install.csh
