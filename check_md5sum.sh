#!/bin/bash
read -p "Enter path for control: "  pathcheck
if [ ! -d $pathcheck ]
   then
      echo "Erorr Directory not found"
      exit 1
fi
read -p "Enter path for result file: " pathresult
mkdir -p  "$pathresult"
name_file=$pathresult/$(basename $pathcheck)-"md5-sum.txt"

for var in  "$pathcheck"/*
  do
    if [ -f "$var" ];
	then
	  echo  "file name - " $var
	  md5sum "$var" >> "$name_file"
    fi
  done
  echo "File with result - $name_file"