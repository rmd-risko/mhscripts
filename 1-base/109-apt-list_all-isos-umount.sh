#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo 'Error, this script need be run as root.'
  exit 1
fi

#list and umount all isos mounted...
#clean apt to offline... running apt clean

