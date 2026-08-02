#!/bin/bash

if [ -z $1 ]; then
  echo 'Parameter with container name not informed.'
  echo 'Use      ./script                                  container'
  echo 'Example: ./286-docker-php-container_setups-call.sh php84deb12_20260724'
  exit 1
fi

./284-docker-container_script-exec.sh $1 ../1-base/122-apt-list_fill.sh
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
fi

echo 'cu1'

./284-docker-container_script-exec.sh $1 ../1-base/101-tty-tools-essential_install.sh
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
fi


./284-docker-container_script-exec.sh $1 287-docker-php-container_internal-setup.sh
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
fi

echo 'chegou em baixo'

