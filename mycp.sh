#!/bin/bash
set -e

if [[ -z $2 ]]
then
  echo "Bed comand"
  exit 1
else
filename=$(basename "$1")
dname=$(dirname "$2")
mkdir -p "$dname"
echo "Copying $1 to $dname/$filename"
cp "$1" "$dname/$filename"
fi