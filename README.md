# Para iniciar o projeto:

### Requirements:
Composer, Docker, Docker compose

### Installation:
1. Initialize Magento Project (docs: https://devdocs.magento.com/guides/v2.3/install-gde/composer.html)

```bash
composer config --global http-basic.repo.magento.com <key> <pwd>
composer create-project --ignore-platform-reqs --repository=https://repo.magento.com/ magento/project-community-edition magento
```

2. Run Docker environment:
```
sudo git clone https://github.com/araujoantonio/dockerize-magento2.git
sudo cp -r dockerize-magento2/. magento/
```

```bash
cd magento/
chmod +x bin/console
chmod +x bin/magento
sudo chmod -R 777 generated/
```


3. Run Installation
```bash
sudo bin/console install <hostname>

# example:
sudo bin/console isntall 192.168.1.100
```
3.1 If SSL certs creation fails:
```bash
set OPENSSL_CONF=c:/{path to openSSL}/bin/openssl.cfg
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout config/nginx/ssl/key.pem -out config/nginx/ssl/cert.pem
```

# Using the environment
Start the docker containers:

`bin/console start`

Stop the docker containers:

`bin/console stop`

Execute bin/magento inside the docker container:

`bin/console exec [arguments]`

For more information on how to use docker-compose visit: https://docs.docker.com/compose/

# Frequent erros
```
Deprecated Functionality: Function ReflectionType::__toString() is deprecated in
/var/www/html/vendor/zendframework/zend-code/src/Reflection/ParameterReflection
.php on line 84
```
PHP version isn't supported.

```bash
Class Magento\Framework\App\ResourceConnection\Proxy does not exist
```
Make sure that the folders have the right permissions.
