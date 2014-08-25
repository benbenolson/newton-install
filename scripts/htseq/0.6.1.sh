#!/bin/bash -e

################################################################################
# HTSeq version 1.6.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   none
################################################################################

module load matplotlib/1.2.1-python2.7.3
module load numpy/1.7.0-python2.7.3

export DEST=$INSTALLDIR/htseq/0.6.1
export PYTHONPATH=${PYTHONPATH}:$INSTALLDIR/htseq/0.6.1/lib/python2.7/site-packages/

python setup.py build
python setup.py install --prefix=$DEST

