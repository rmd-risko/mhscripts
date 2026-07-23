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

apt -y install python3 python3-dev libpython3-dev
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

apt -y install python3-pyxattr
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

python3 -c 'print("Hello Python3!!")'
vPythonExec_return=$?
if [ $vPythonExec_return -ne 0 ]; then
  echo "Error, APT update return is: $vAPTupdate_return"
  exit $vPythonExec_return
fi
python3 --version

exit 0

