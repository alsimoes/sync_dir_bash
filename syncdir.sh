#!/bin/bash

SPATH=$1
DPATH=$2

declare -a SFOLDERS
I=0
for l in $(ls -d $SPATH/*/)
do 
    SFOLDERS[I]=${l%%/};
    I+=1
done

for SFOLDER in "${SFOLDERS[@]}"
do
    DSIZE=$(du -sh $SFOLDER)
    echo "Reading --> $DSIZE"
    rsync -ahvtP --exclude-from 'exclusions.txt' $SFOLDER $DPATH/ 2> $DPATH/$(date +%Y%m%d-%H%M%S).txt
done

