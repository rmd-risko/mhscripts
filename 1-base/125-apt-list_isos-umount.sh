#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

#clean apt to offline...
#list and umount all isos mounted...

