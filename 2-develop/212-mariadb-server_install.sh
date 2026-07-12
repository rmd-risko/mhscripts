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

./210-mariadb-client_install.sh
vClientInstall_return=$?
if [ $vClientInstall_return -ne 0 ]; then
  exit $vClientInstall_return
fi

apt -y install mariadb-server
vAPTinstall_return=$?
if [ $vAPTinstall_return -ne 0 ]; then
  exit $vAPTinstall_return
fi

echo 'MariaDB Server successfully instaled.'

./214-mariadb-skip-grant_set-true.sh
vGrantSet_return=$?
if [ $vGrantSet_return -ne 0 ]; then
  exit $vGrantSet_return
fi

echo 'Connect example: mariadb -h localhost -u root -p'

exit 0

