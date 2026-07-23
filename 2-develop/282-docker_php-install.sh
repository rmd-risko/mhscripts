#!/bin/bash

if [ -z $1 ] || [ -z $2 ]; then
  echo 'Parameters not informed.'
  echo 'Use      ./script                version port'
  echo 'Example: ./282-docker_php-install.sh 8.4 8080'
  exit 1
fi

docker --version
vDocker_return=$?
if [ $vDocker_return -ne 0 ]; then
  echo "Error, Docker version return: $vAPTupdate_return"
  exit $vDocker_return
fi

echo $1
echo $2

#### olhar se os parâmetros estão preenchidos...
#### 8.4 


exit 0

