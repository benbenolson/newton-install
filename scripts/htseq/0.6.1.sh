#!/bin/bash -e

################################################################################
# HTSeq version 0.6.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   none
################################################################################

module load python/2.7.3
module load matplotlib/1.2.1-python2.7.3
module load numpy/1.7.0-python2.7.3

export DEST=$APPDIR
export PYTHONPATH="$PYTHONPATH:$APPDIR/lib/python2.7/site-packages/"

python setup.py build
python setup.py install --prefix=$DEST

