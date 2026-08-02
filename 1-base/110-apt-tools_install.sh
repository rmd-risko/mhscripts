#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

## Get OS variables in file /etc/os-release  
source /etc/os-release
echo $PRETTY_NAME
echo "Version codename: $VERSION_CODENAME"
echo "Version number: $VERSION_ID"

apt update
vAPTupdate_return=$?
if [ $vAPTupdate_return -eq 0 ]; then
  echo 'APT update success...'
else
  echo "Error, APT update return is: $vAPTupdate_return"
  exit $vAPTupdate_return
fi

apt -y install apt-transport-https
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

if [ $VERSION_ID -lt 13 ]; then
  apt -y install software-properties-common
  vAPTinstall_return=$?
  if [ $vAPTinstall_return -ne 0 ]; then
    exit $vAPTinstall_return
  fi
fi

exit 0

