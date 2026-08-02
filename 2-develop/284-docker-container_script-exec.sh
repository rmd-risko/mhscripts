#!/bin/bash

if [ -z $1 ]; then
  echo 'Parameter with container name not informed.'
  echo 'Use      ./script                              name'
  echo 'Example: ./284-docker-container_script-exec.sh php84deb12_20260724'
  exit 1
fi

./282-docker_container-start.sh $1
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo 'Error, container not started.'
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
else
  echo 'Container started...'
fi

vInternalSetupFilename=286-docker-php-container_internal-setup.sh
#if [ ! -e $vInternalSetupFilename ]; then
#  echo "Script '$vInternalSetupFilename' not exists."
#  exit 1
#fi

docker cp $vInternalSetupFilename $1:/var/www
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo "Error, failed to copy '$vInternalSetupFilename' file to container..."
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
else
  echo "Script '$vInternalSetupFilename' copied..."
fi

docker exec $1 /var/www/$vInternalSetupFilename
vContainer_return=$?
if [ $vContainer_return -ne 0 ]; then
  echo "Error, failed execute '$vInternalSetupFilename' into container..."
  echo "Docker return: $vContainer_return"
  exit $vContainer_return
else
  echo "Script successfully executed into '$1'."
fi

exit 0

