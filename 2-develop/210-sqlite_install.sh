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

apt -y install sqlite3 libsqlite3-dev
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

if [ ! -e /usr/lib/libsqlite3.so ]; then
  if [ -e /usr/lib/x86_64-linux-gnu/libsqlite3.so.0 ]; then
    echo 'Linking lib...'
    ln -sv /usr/lib/x86_64-linux-gnu/libsqlite3.so.0 /usr/lib/libsqlite3.so
  elif [ -e /usr/lib/i386-linux-gnu/libsqlite3.so.0 ]; then
    echo 'Linking lib...'
    ln -sv /usr/lib/i386-linux-gnu/libsqlite3.so.0 /usr/lib/libsqlite3.so
  fi
else
  ls -lha /usr/lib/libsqlite3.so
fi

if [ ! -e /usr/lib/libsqlite3.so ]; then
  echo 'Failed to link /usr/lib/libsqlite3.so'
  exit 1
fi 

exit 0

