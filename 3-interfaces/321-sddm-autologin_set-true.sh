#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

if [ ! -e /usr/bin/crudini ]; then
  echo 'Error, CrudINI is not installed.'
  exit 1
fi

# Set autologin user for SDDM
# SDDM enables autologin when the [Autologin] User is set
crudini --set /etc/sddm.conf Autologin User user
vCrudINI_return=$?
if [ $vCrudINI_return -eq 0 ]; then
  echo 'Set autologin config in: /etc/sddm.conf'
else
  echo 'Error, not set config in: /etc/sddm.conf'
  exit $vCrudINI_return
fi

exit 0
