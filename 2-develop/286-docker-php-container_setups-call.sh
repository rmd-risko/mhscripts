#!/bin/bash

if [ -z $1 ]; then
  echo 'Parameter with container name not informed.'
  echo 'Use      ./script                                  container'
  echo 'Example: ./286-docker-php-container_setups-call.sh php84deb12_20260724'
  exit 1
fi

./282-docker-container_start.sh $1
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
else
  echo 'Container started...'
fi

echo 'chegou em baixo'

