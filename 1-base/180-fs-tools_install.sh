#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

## Get OS variables in file /etc/os-release  
source /etc/os-release
echo "Debian version codename: $VERSION_CODENAME"
echo "Debian version number: $VERSION_ID"

apt update
vAPTupdate_return=$?
if [ $vAPTupdate_return -eq 0 ]; then
  echo 'APT update success...'
else
  echo "Error, APT update return is: $vAPTupdate_return"
  exit $vAPTupdate_return
fi

apt -y install libext2fs2
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install ntfs-3g
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

if [ $VERSION_ID -lt 11 ]; then
  apt -y install exfat-fuse exfat-utils
else
  apt -y install exfat-fuse exfatprogs
fi;
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return;
fi;

apt -y install reiserfsprogs reiser4progs
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install xfsprogs xfsdump jfsutils
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install fdisk
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install gpart kpartx mtools dmraid
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install acl attr quota
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install disktype
vAPTinstall_return=$?;
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install libzip4 libminizip1 liblz1
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install zlib1g-dev libbz2-dev
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install rsync
vAPTinstall_return=$?;
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install jigdo-file
vAPTinstall_return=$?;
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

exit 0

