#!/bin/bash

if [ -z $1 ]; then
  echo 'Parameter with container name not informed.'
  echo 'Use      ./script                         name'
  echo 'Example: ./283-docker_container-remove.sh php84deb12_20260724'
  exit 1
fi

docker --version
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker version return: $vDocker_return"
  exit $vDocker_return
fi

docker rm -f $1
vDocker_return=$?
exit $vDocker_return

