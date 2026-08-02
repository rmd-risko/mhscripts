#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

## Get OS variables in file /etc/os-release  
source /etc/os-release
echo "Debian version codename: $VERSION_CODENAME"
echo "Debian version number: $VERSION_ID"

echo 'Cleaning: /etc/apt/sources.list'
echo '' > /etc/apt/sources.list

rm -fv /etc/apt/sources.list.d/*

apt update
vAPTupdate_return=$?
if [ $vAPTupdate_return -eq 0 ]; then
  echo 'APT update success.'
else
  echo "Error, APT update return is: $vAPTupdate_return"
  exit $vAPTupdate_return
fi

exit 0

