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

apt -y install apt-transport-https
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install software-properties-common
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

exit 0

