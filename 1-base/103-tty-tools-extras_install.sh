#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

apt -y install dbus
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install sudo adduser passwd
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install vim
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install dialog
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install mc
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install pv
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install htop
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

exit 0

