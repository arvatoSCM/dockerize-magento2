FROM arvato/magento2-php:latest

MAINTAINER contact@vinaikopp.com

RUN apt-get update

RUN apt-get install -y mysql-client

WORKDIR /var/www/html/dev/tests/integration

ENTRYPOINT ["/usr/local/bin/php", "../../../vendor/bin/phpunit"]

CMD [""]
