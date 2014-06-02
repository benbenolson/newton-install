#!/bin/bash -e

################################################################################
# HMMER version 3.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################


./configure --prefix=$APPDIR --enable-sse --enable-mpi --enable-threads CC=icc CFLAGS=-O3 MPICC=mpicc
make
make check
make install
