#!/bin/bash

if [ -z $1 ] || [ -z $2 ]; then
  echo 'Parameters not informed.'
  echo 'Use      ./script                          version port'
  echo 'Example: ./284-docker_php-container-install.sh 8.4 8080'
  exit 1
fi

docker --version
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker version return: $vDocker_return"
  exit $vDocker_return
fi

## Get OS variables in file /etc/os-release  
source /etc/os-release
echo "Debian version codename: $VERSION_CODENAME"

docker pull php:$1-apache-$VERSION_CODENAME
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker return: $vDocker_return"
  exit $vDocker_return
fi

vContainerName=$(date +"%Y%m%d%H%M%S")
echo "Container name: $vContainerName"

docker run -p $2:80 -d --name $vContainerName php:$1-apache-$VERSION_CODENAME
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker return: $vDocker_return"
  exit $vDocker_return
fi

./282-docker_container-run.sh $vContainerName
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
fi

exit 0

