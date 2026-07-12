#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

apt -y purge --no-install-recommends mariadb-server
vAPTpurge_return=$?
if [ $vAPTpurge_return -ne 0 ]; then
  exit $vAPTpurge_return
fi

apt -y autoremove
vAPTautoremove_return=$?
if [ $vAPTautoremove_return -ne 0 ]; then
  exit $vAPTautoremove_return
fi

echo 'Ok, MariaDB Server has been purged.'

exit 0

