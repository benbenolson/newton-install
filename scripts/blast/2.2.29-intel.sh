#!/bin/bash -e

################################################################################
# blast version 2.2.24 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

module unload intel-compilers
module load intel-compilers/2013.1
module load python/2.7.3
module load boost/1.46.1

cd c++
yes yes | ./configure --prefix=$APPDIR CC=icc CXX=icpc
make -j 8
make check
make install
mkdir -p $APPDIR
cd $APPDIR
wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/snapshot/2010-09-13/makeblastdb-linux64
mv makeblastdb makeblastdb.orig
mv makeblastdb-linux64 makeblastdb
