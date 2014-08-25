#!/bin/bash -e

################################################################################
# HTSeq version 0.5.4p5 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   none
################################################################################

module load matplotlib/1.2.1-python2.7.3
module load numpy/1.7.0-python2.7.3

export DEST=$INSTALLDIR/htseq/0.5.4p5
export PYTHONPATH=${PYTHONPATH}:$DEST/lib/python2.7/site-packages/

mkdir -p $DEST
python setup.py build
python setup.py install --prefix=$DEST

