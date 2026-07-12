#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

source /etc/os-release
vVersionCodename=$VERSION_CODENAME
echo "Debian version codename: $vVersionCodename"
vVersionNumber=$VERSION_ID
echo "Debian version number: $vVersionNumber"

echo 'Rewriting: /etc/apt/sources.list'
echo '' > /etc/apt/sources.list

if [ "$vVersionNumber" -lt "12" ]; then
  echo "deb http://deb.debian.org/debian $vVersionCodename main non-free contrib" >> /etc/apt/sources.list
else
  echo "deb http://deb.debian.org/debian $vVersionCodename main non-free non-free-firmware contrib" >> /etc/apt/sources.list
fi

echo '' >> /etc/apt/sources.list
#cat /etc/apt/sources.list

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

