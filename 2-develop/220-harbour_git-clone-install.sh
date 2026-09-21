#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

harbour -build
vHarbour_return=$?
if [ $vHarbour_return -eq 0 ]; then
  echo 'Harbour already configured.'
  exit 0
fi

if [ ! -e /opt/harbour ]; then
  mkdir /opt/harbour
fi
if [ ! -e /opt/harbour ]; then
  echo '/opt/harbour can not be created.'
  exit 1
fi

rm -v /usr/local/bin/harbour
rm -v /usr/local/bin/hbi18n
rm -v /usr/local/bin/hbnetio
rm -v /usr/local/bin/hbrun
rm -v /usr/local/bin/hbformat
rm -v /usr/local/bin/hbmk2
rm -v /usr/local/bin/hbpp
rm -v /usr/local/bin/hbtest

rm -rfv /opt/harbour/core

cd /opt/harbour
git clone https://github.com/harbour/core.git
vGit_return=$?
if [ $vGit_return -ne 0 ]; then
  echo "Git clone return: $vGit_return"
  exit $vGit_return
fi

cd /opt/harbour/core
make
vMake_return=$?
if [ $vMake_return -ne 0 ]; then
  echo "Make return: $vMake_return"
  exit $vMake_return
fi

ln -sv /opt/harbour/core/bin/linux/gcc/harbour /usr/local/bin/harbour
ln -sv /opt/harbour/core/bin/linux/gcc/hbi18n /usr/local/bin/hbi18n
ln -sv /opt/harbour/core/bin/linux/gcc/hbnetio /usr/local/bin/hbnetio
ln -sv /opt/harbour/core/bin/linux/gcc/hbrun /usr/local/bin/hbrun
ln -sv /opt/harbour/core/bin/linux/gcc/hbformat /usr/local/bin/hbformat
ln -sv /opt/harbour/core/bin/linux/gcc/hbmk2 /usr/local/bin/hbmk2
ln -sv /opt/harbour/core/bin/linux/gcc/hbpp /usr/local/bin/hbpp
ln -sv /opt/harbour/core/bin/linux/gcc/hbtest /usr/local/bin/hbtest

harbour -build
vHarbour_return=$?
if [ $vHarbour_return -eq 0 ]; then
  echo 'Harbour successfully instaled.'
else
  echo "Error, Harbour return is: $vHarbour_return"
  exit $vHarbour_return
fi

exit 0
