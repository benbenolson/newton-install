#!/bin/bash -e

################################################################################
# QIIME version 1.80 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

cd qiime-deploy
python qiime-deploy.py $APPDIR -f ../qiime-deploy-conf/qiime-1.8.0/qiime.conf --force-remove-failed-dirs || true
