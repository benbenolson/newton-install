#!/bin/bash

##################################################################
#                 MODULES 3.2.10 INSTALL SCRIPT
#                 to be used on UTK Newton only
#
# FILES WERE CHANGED FROM THE ORIGINAL SOURCE:
#   -changed "export -f module" to "export -f module > /dev/null"
#      in init/bash to avoid conflict with zsh
#   -added "export MANPATH=..." to init files
#   -various modulefile changes
##################################################################

APPNAME="Modules"
VERSION="3.2.10"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$INSTALLDIR
make
make check
make install

#Copy the init scripts from this tarball to the installation directory
mv $APPDIR/init $APPDIR/init.old
mkdir $APPDIR/init
cp -r init.newton/* $APPDIR/init
