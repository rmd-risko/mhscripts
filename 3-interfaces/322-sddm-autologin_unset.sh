#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

if [ ! -e /usr/bin/crudini ]; then
  echo 'Error, CrudINI is not installed.'
  exit 1
fi

# Remove the Autologin User (primary) and Autologin Session (best-effort) to disable autologin
crudini --del /etc/sddm.conf Autologin User
vCrudINI_return=$?

# Try to remove the Session entry too, but don't override the primary return code
crudini --del /etc/sddm.conf Autologin Session >/dev/null 2>&1 || true

if [ $vCrudINI_return -eq 0 ]; then
  echo 'Unset autologin config in: /etc/sddm.conf'
else
  echo 'Error, not unset config in: /etc/sddm.conf'
  exit $vCrudINI_return
fi

exit 0
