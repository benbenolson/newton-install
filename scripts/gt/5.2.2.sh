#!/bin/bash -e

################################################################################
# GLOBUS TOOLKIT version 5.2.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


module load perl/5.16.2

cpan Archive/Tar.pm

./configure prefix=$APPDIR
export INC=/data/apps/perl/5.16.2/lib/5.16.2
make
make install
