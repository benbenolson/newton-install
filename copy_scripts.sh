#!/bin/bash

for filename in `ls | grep newton`
do
  cp $filename/newton_install.sh $filename.sh
done
