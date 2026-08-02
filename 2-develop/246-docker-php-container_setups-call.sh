#!/bin/bash

if [ -z $1 ]; then
  echo 'Parameter with container name not informed.'
  echo 'Use      ./script                                  container'
  echo 'Example: ./246-docker-php-container_setups-call.sh php84deb12_20260724'
  exit 1
fi

./244-docker-container_script-exec.sh $1 ../1-base/102-apt-list_fill.sh
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
fi

./244-docker-container_script-exec.sh $1 ../1-base/111-tty-tools-essential_install.sh
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
fi

docker exec $1 docker-php-ext-install mysqli
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo "Error, failed execute '$2' into container..."
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
else
  echo "Script successfully executed into '$1'."
fi

docker stop $1
./242-docker-container_start.sh $1
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
else
  echo 'Container started...'
fi

./244-docker-container_script-exec.sh $1 247-docker-php-container_internal-setup.sh
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
fi

exit 0

