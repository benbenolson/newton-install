#!/bin/bash -e

################################################################################
# blast version 2.2.24 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="blast"
VERSION="2.2.24"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module unload intel-compilers
module unload python
module load intel-compilers/2013.1
module load python/2.7.3
module load boost

cd c++
yes yes | ./configure --prefix=$APPDIR CC=icc CXX=icpc
make > make.log
make check
make install
mkdir $APPDIR
make install
cd $APPDIR
wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/snapshot/2010-09-13/makeblastdb-linux64
mv makeblastdb makeblastdb.orig
mv makeblastdb-linux64 makeblastdb
