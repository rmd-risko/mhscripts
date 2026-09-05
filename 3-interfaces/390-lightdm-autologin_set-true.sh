#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

if [ ! -e /usr/bin/crudini ]; then
  echo 'Error, CrudINI is not installed.'
  exit 1
fi

crudini --set /etc/lightdm/lightdm.conf Seat:* autologin-user user
vCrudINI_return=$?
if [ $vCrudINI_return -eq 0 ]; then
  echo 'Set autologin config in: /etc/lightdm/lightdm.conf'
else
  echo 'Error, not set config in: /etc/lightdm/lightdm.conf'
  exit $vCrudINI_return
fi

exit 0

