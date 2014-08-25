#!/bin/bash -e

################################################################################
# Maple version 18 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   - Put install executable file into tar file
#   
################################################################################

unset DISPLAY
./Maple18LinuxX64Installer.run --mode unattended --installdir $APPDIR --desktopshortcut 0 --licenseType network --serverName labslm3.utk.tennessee.edu --portNumber 27005 --enableUpdates 0 --unattendedmodeui minimal

