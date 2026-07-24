#!/bin/bash

if [ -z $1 ]; then
  echo 'Parameter with container name not informed.'
  echo 'Use      ./script                            name'
  echo 'Example: ./285-docker_php-container-setup.sh 20260723234500'
  exit 1
fi

docker --version
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker version return: $vDocker_return"
  exit $vDocker_return
fi


