#!/bin/bash -e

################################################################################
# PERL version 5.16.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


./Configure -des -Dprefix=$APPDIR
make test
make install
