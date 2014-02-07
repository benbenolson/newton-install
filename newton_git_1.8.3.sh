#!/bin/bash

################################################################################
# GIT version 1.8.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

INSTALLDIR="/data/apps"
APPNAME="git"
VERSION="1.8.3"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

#Make the directories to install the docs to
#mkdir asciidoc
#mkdir xmlto

#Install asciidoc temporarily
#wget 'http://downloads.sourceforge.net/project/asciidoc/asciidoc/8.6.8/asciidoc-8.6.8.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fasciidoc%2F&ts=1369670414&use_mirror=hivelocity'
#unzip asciidoc-8.6.8.zip
#cd asciidoc-8.6.8
#autoconf
#./configure --prefix="`pwd`/../asciidoc"
#make
#make install

#Clean up after installing asciidoc
#cd ..
#rm -rf asciidoc-8.6.8
#rm asciidoc-8.6.8.zip

#Install xmlto temporarily
#wget --no-check-certificate https://fedorahosted.org/releases/x/m/xmlto/xmlto-0.0.25.tar.gz
#tar xf xmlto-0.0.25.tar.gz
#cd xmlto-0.0.25
#./configure --prefix="`pwd`/../xmlto"
#make
#make install

#Clean up after installing xmlto
#cd ..
#rm -rf xmlto-0.0.25
#rm xmlto-0.0.25.tar.gz

#Add the two temporary download bins to the PATH
#export PATH="$PATH:`pwd`/asciidoc/bin:`pwd`/xmlto/bin"

make clean
make configure
./configure --prefix=$APPDIR
make all
make install
