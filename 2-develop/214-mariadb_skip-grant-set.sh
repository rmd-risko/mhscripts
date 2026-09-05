#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

if [ ! -e /usr/bin/crudini ]; then
  echo 'Error, CrudINI is not installed.'
  exit 1
fi

crudini --set /etc/mysql/mariadb.conf.d/50-server.cnf server skip-grant-tables true
vCrudINI_return=$?
if [ $vCrudINI_return -eq 0 ]; then
  echo 'Set skip-grant-tables to true in: /etc/mysql/mariadb.conf.d/50-server.cnf'
else
  echo 'Error, not set config in: /etc/mysql/mariadb.conf.d/50-server.cnf'
  exit $vCrudINI_return
fi

crudini --set /etc/mysql/mariadb.conf.d/50-server.cnf mysqld bind-address 0.0.0.0
vCrudINI_return=$?
if [ $vCrudINI_return -eq 0 ]; then
  echo 'Set bind-address to 0.0.0.0 in: /etc/mysql/mariadb.conf.d/50-server.cnf'
else
  echo 'Error, not set config in: /etc/mysql/mariadb.conf.d/50-server.cnf'
  exit $vCrudINI_return
fi

systemctl restart mariadb

if systemctl is-active --quiet mariadb; then
  echo 'MariaDB successfully started.'
else
  echo 'MariaDB restart fail, check the configuration.'
  exit 1
fi

exit 0

