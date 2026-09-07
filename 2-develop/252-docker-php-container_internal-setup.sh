#!/bin/bash

rm -rfv /var/www/html
mkdir -v /var/www/html
if [ ! -e /var/www/html ]; then
  echo "Error, directory '/var/www/html' can't be created."
  exit 1
fi

echo '<h1>Hello Apache!!</h1>' > /var/www/html/index.html
apache2 -v >> /var/www/html/index.html

echo '<?php phpinfo(); ?>' > /var/www/html/phpinfo.php

echo ''
echo 'To http access:'
echo 'http://localhost:80XX/index.html'
echo 'http://localhost:80XX/phpinfo.php'

exit 0

