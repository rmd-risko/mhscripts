#!/bin/bash

if [ -z $1 ] || [ -z $2 ]; then
  echo 'Parameters not informed.'
  echo 'Use      ./script                       repository  port'
  echo 'Example: ./246-docker-container_pull.sh python:3.11 8085'
  exit 1
fi

docker --version
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker version return: $vDocker_return"
  exit $vDocker_return
fi

docker pull $1
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker return: $vDocker_return"
  exit $vDocker_return
fi

if [ -z $3 ]; then
  vContainerName=$(date +"%Y%m%d%H%M%S")
else
  vContainerName=$3
fi
echo "Container name: $vContainerName"

docker run -p $2:80 -d --name $vContainerName $1
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker return: $vDocker_return"
  exit $vDocker_return
fi

./242-docker-container_start.sh $vContainerName
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
fi

exit 0

