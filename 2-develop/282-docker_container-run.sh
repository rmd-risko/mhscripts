#!/bin/bash

if [ -z $1 ]; then
  echo 'Parameter with container name not informed.'
  echo 'Use      ./script                      name'
  echo 'Example: ./282-docker_container-run.sh 20260723093800'
  exit 1
fi

docker --version
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker version return: $vDocker_return"
  exit $vDocker_return
fi

vDocker_inspect=$(docker inspect -f '{{.State.Running}}' $1)
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker inspect return: $vDocker_return"
  exit $vDocker_return
fi

if [ $vDocker_inspect == 'true' ]; then
  echo $1
  exit 0 
else
  docker start $1
  vDocker_return=$?
  exit $vDocker_return
fi

