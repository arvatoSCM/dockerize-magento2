# Change Log
All notable changes to this project will be [documented](http://keepachangelog.com/) in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Fixed
- Fix the nginx config to support versioned assets

## [v1.2.0] - 2017-01-12

### Changed
- Replace config/env.sh with a regular Docker Compose .env file

### Added
- Add support for versioned assets that have made the default with Magento 2.1.3 (see: [magento/magento2 issue #7820](https://github.com/magento/magento2/issues/7820))

## [v1.1.0]

### Added
- Add support for lets encrypt

### Changed
- Use the pre-built arvato/magento2-php docker image for a faster setup (see: https://hub.docker.com/r/arvato/magento2-php/)

## v1.0.0
### Added
- Initial version of the Docker Compose control script (bin/console) and required configuration files for Nginx, PHP and MySQL
