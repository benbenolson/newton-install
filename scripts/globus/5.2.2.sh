#!/bin/bash -e

################################################################################
# GLOBUS version 5.2.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################

module load perl/5.16.2

# These are absolutely because the Globus build system is the worst thing ever
export PERL5LIB="$APPDIR/lib"
export PERLLIB="$APPDIR/lib"
export PATH="$PATH:$APPDIR/bin:$APPDIR/sbin"

# Finally do the normal build (GPT MUST be in the same directory as the rest of Globus)
./configure --prefix=$APPDIR --with-gptlocation=$APPDIR
make
make install
rm -rf $APPDIR/share/certificates
ln -s $APPDIR/../certificates $APPDIR/share/certificates

