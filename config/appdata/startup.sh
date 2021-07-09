#!/bin/sh
#
# Set the correct file permissions for Magento 2

while true;
do
  chgrp -R 33 /var/www
  chmod -R g+rs /var/www

  chmod -R ug+rws /var/www/html/pub/errors
  chmod -R ug+rws /var/www/html/pub/static
  chmod -R ug+rws /var/www/html/pub/media
  chmod -R ug+rws /var/www/html/app/etc
  chmod -R ug+rws /var/www/html/var
  chmod -R ug+rws /var/www/html/generated

  chmod ug+x /var/www/html/bin/magento

  sleep 60
done
