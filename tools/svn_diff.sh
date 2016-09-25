#!/bin/bash

function usage() 
{
    echo "Usage: dir [exclude_dir_1 [exclude_dir_2] ...]"
}

if [ $# -lt 1 ]; then
    usage
    exit -1
fi

diff_dir=$1

cmd="find $diff_dir -maxdepth 1"

nIndex=2
while [ $nIndex -le $# ]; do
    cmd=$(echo $cmd "| grep -vw ${!nIndex}")
    nIndex=$(expr $nIndex + 1) 
done

cmd=$(echo $cmd "| grep -v \"^.$\" | xargs svn diff") 

echo $cmd | bash
