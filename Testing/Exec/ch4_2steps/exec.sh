#!/bin/bash

rm Pele3d.llvm.ex
rm PPreaction.txt 
rm timing.txt 
rm err.txt
if [[ -f "PPreaction.txt" ]]; then
    rm PPreaction.txt
fi
if [[ -f "log" ]]; then
    rm log
fi
 
# Find first eyypecutable name available
make COMP=llvm TPL
make COMP=llvm -j 8


execname=`find . -name "Pele*.ex" | head -1`
if [ -z "$execname" ]
then
    make COMP=llvm -j 8
    execname=`find . -name "Pele*.ex" | head -1`
fi


$execname inputs/inputs_aj
mv PPreaction.txt PPreaction_AJ.txt
$execname inputs/inputs_dd
mv PPreaction.txt PPreaction_DD.txt
python plot.py
