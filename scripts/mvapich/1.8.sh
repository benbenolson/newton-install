#!/bin/bash -e

################################################################################
# MVAPICH2 version 1.8 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix=/data/apps/mvapich2/1.8 --with-psm --with-sge=yes
make -j8
make install
