#!/bin/bash -e

################################################################################
# NWCHEM version 6.3 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load openmpi/1.4.3-intel-psm

export ARMCI_NETWORK=openib 
./contrib/distro-tools/build_nwchem

mkdir -p $APPDIR/bin $APPDIR/data
cp bin/LINUX64/nwchem $APPDIR/bin/
cp -r src/data $APPDIR
cp -r src/basis/libraries src/nwpw/libraryps $APPDIR/data

echo "nwchem_basis_library $APPDIR/data/libraries/"       > $APPDIR/data/default.nwchemrc
echo "nwchem_nwpw_library $APPDIR/data/libraryps/"        >> $APPDIR/data/default.nwchemrc
echo "ffield amber"                                     >> $APPDIR/data/default.nwchemrc
echo "amber_1 $APPDIR/data/amber_s/"                      >> $APPDIR/data/default.nwchemrc
echo "amber_2 $APPDIR/data/amber_q/"                      >> $APPDIR/data/default.nwchemrc
echo "amber_3 $APPDIR/data/amber_x/"                      >> $APPDIR/data/default.nwchemrc
echo "amber_4 $APPDIR/data/amber_u/"                      >> $APPDIR/data/default.nwchemrc
echo "spce    $APPDIR/data/solvents/spce.rst"             >> $APPDIR/data/default.nwchemrc
echo "charmm_s $APPDIR/data/charmm_s/"                    >> $APPDIR/data/default.nwchemrc
echo "charmm_x $APPDIR/data/charmm_x/"                    >> $APPDIR/data/default.nwchemrc

chmod -vR a+r,a+X $APPDIR
