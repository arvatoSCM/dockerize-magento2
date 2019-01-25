# Dockerize Magento 2

A composer package for dockerizing Magento 2

The composer package **arvatoscm/dockerize-magento2** deploys docker infrastructure defintion files such as [docker-compose.yml](docker-compose.yml) to your Magento 2 root folder and enables you to host your Magento 2 shops without having to install Apache/Nginx, MySQL or PHP on your system.

## Package Name

`swissup/dockerize-magento2`

## Software Requirements

For Linux users you must have a recent version of [docker](https://github.com/docker/docker/releases) and [docker-compose](https://github.com/docker/compose/releases) installed.

If you are a Mac or Windows user, use the [Docker Toolbox](https://www.docker.com/products/docker-toolbox).

## PreInstallation

```bash
 composer create-project --ignore-platform-reqs --repository-url=https://repo.magento.com/ magento/project-community-edition dockerize-magento2
```

```bash
 composer create-project --ignore-platform-reqs --repository-url=https://repo.magento.com/ magento/project-community-edition=2.2.0 magento2
```

## Installation

Add `swissup/dockerize-magento2` to your existing Magento 2 shop:

```bash
composer config repositories.swissup composer https://docs.swissuplabs.com/packages/

composer require --ignore-platform-reqs swissup/dockerize-magento2

composer config minimum-stability dev
composer require --ignore-platform-reqs swissup/dockerize-magento2:dev-develop --prefer-source

chmod +x bin/console
chmod +x vendor/bin/dockerizer
```

### PHP 7.1

```
docker build ./vendor/swissup/dockerize-magento2/config/php/7.1/ -t swissup/magento2-php:7.1
```

In [magento root]/docker-compose.yml replace

```diff
php:
    -image: arvato/magento2-php:latest
    +image: swissup/magento2-php:7.1
```

This will place some files in your Magento root:

- `docker-compose.yml`
The docker infrastructure definition
- `vendor/bin/dockerizer`
A utility script for controlling dockerized Magento projects
- `config`
A folder which contains the configuration files for PHP, Nginx and phpMyAdmin

Add to composer.json
```
"config": {
    "secure-http": false
}
```

```
  vendor/bin/dockerizer install <hostname>
  vendor/bin/dockerizer bash curl --silent --show-error https://getcomposer.org/installer | php
  vendor/bin/dockerizer bash php composer.phar update
  vendor/bin/dockerizer bin/magento sampledata:deploy
  vendor/bin/dockerizer bin/magento setup:upgrade
  vendor/bin/dockerizer bin/magento setup:di:compile

  docker exec -u 0 -ti "dockerizemagento2_php_1" bash
  #bin/magento --version
```

## Usage

`dockerize-magento2` comes with `vendor/bin/dockerizer` script that can be used to install Magento and to execute Magentos' bin/magento script inside the PHP docker container:

Trigger the Magento 2 installation process:

```bash
vendor/bin/dockerizer install <hostname>
vendor/bin/dockerizer install magento.local
```

Start the docker containers:

```bash
vendor/bin/dockerizer start
```

Stop the docker containers:

```bash
vendor/bin/dockerizer stop
```

Execute Magento CLI `bin/magento` inside the docker container:

```bash
vendor/bin/dockerizer bin/magento [arguments]
```

Run command inside the docker container:

```bash
vendor/bin/dockerizer bash [command]
```


Enter inside the docker container:

```bash
vendor/bin/dockerizer enter [php|web|phpmyadmin]
```

For more information on how to use docker-compose visit: https://docs.docker.com/compose/

## Configuration

The `install` action depends on some parameters such as usernames and passwords. We have put in some default values for you that will work for a quick test:

```
DATABASE_NAME=magento2dockerized
DATABASE_USER=magento
DATABASE_PASSWORD=enAVINa2
DATABASE_ROOT_PASSWORD=enAVINa2

ADMIN_USERNAME=admin
ADMIN_FIRSTNAME=John
ADMIN_LASTNAME=Doe
ADMIN_EMAIL=johndoe@example.com
ADMIN_PASSWORD=123654a

DEFAULT_LANGUAGE=en_US
DEFAULT_CURRENCY=EUR
DEFAULT_TIMEZONE=Europe/Kiev

BACKEND_FRONTNAME=management

```

If you want to use different parameters change the values in the [.env](.env) file to your needs.
After customizing the parameters just run trigger the installation with `vendor/bin/dockerizer install <hostname>`.

## Licensing

dockerize-magento2 is licensed under the Apache License, Version 2.0.
See [LICENSE](LICENSE) for the full license text.
