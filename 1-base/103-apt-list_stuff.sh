#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

## Get OS variables in file /etc/os-release  
source /etc/os-release
echo "Debian version codename: $VERSION_CODENAME"
echo "Debian version number: $VERSION_ID"

echo 'Rewriting: /etc/apt/sources.list'
echo '' > /etc/apt/sources.list

if [ $VERSION_ID -lt 12 ]; then
  echo "deb http://deb.debian.org/debian $VERSION_CODENAME main non-free contrib" >> /etc/apt/sources.list
else
  echo "deb http://deb.debian.org/debian $VERSION_CODENAME main non-free non-free-firmware contrib" >> /etc/apt/sources.list
fi

echo "deb http://security.debian.org/debian-security $VERSION_CODENAME-security main contrib non-free" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ $VERSION_CODENAME-updates main contrib non-free" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ $VERSION_CODENAME-backports main contrib non-free" >> /etc/apt/sources.list
echo '' >> /etc/apt/sources.list
cat /etc/apt/sources.list

apt update
vAPTupdate_return=$?
if [ $vAPTupdate_return -eq 0 ]; then
  echo 'APT update success.'
else
  echo "Error, APT update return is: $vAPTupdate_return"
  exit $vAPTupdate_return
fi

exit 0

