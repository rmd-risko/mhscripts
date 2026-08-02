#!/bin/bash

if [ -z $1 ] || [ -z $2 ]; then
  echo 'Parameters not informed.'
  echo 'Use      ./script                              container           file'
  echo 'Example: ./244-docker-container_script-exec.sh php84deb12_20260724 247-docker-php-container_internal-setup.sh'
  exit 1
fi

./242-docker-container_start.sh $1
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
else
  echo 'Container started...'
fi

if [ ! -e $2 ]; then
  echo "Error, file '$2' not exists."
  exit 1
fi

docker cp $2 $1:/var/www
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo "Error, failed to copy '$2' file to container..."
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
else
  echo "Script '$2' copied..."
fi

docker exec $1 /var/www/$(basename $2)
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo "Error, failed execute '$2' into container..."
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
else
  echo "Script successfully executed into '$1'."
fi

exit 0

