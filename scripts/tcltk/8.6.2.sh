#!/bin/bash -e

################################################################################
# TCLtk version 8.6.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

# First compile tcl
cd tcl/unix
./configure --prefix=$APPDIR
make
make install

# Now compile tk against tcl
cd ../../tk/unix
./configure --prefix=$APPDIR --with-tcl="$APPDIR/lib"
make
make install
