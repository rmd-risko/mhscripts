#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

apt update
vAPTupdate_return=$?
if [ $vAPTupdate_return -eq 0 ]; then
  echo 'APT update success...'
else
  echo "Error, APT update return is: $vAPTupdate_return"
  exit $vAPTupdate_return
fi

## Get OS variables in file /etc/os-release  
source /etc/os-release
echo $PRETTY_NAME
echo "Version codename: $VERSION_CODENAME"
echo "Version number: $VERSION_ID"


exit 0

