#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
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

if [ ! -e /opt/harbour/core ]; then
  echo 'Harbour successfully removed.'
else
  echo 'Failed to remove /opt/harbour/core'
  exit 1
fi 

exit 0

