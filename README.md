# Para iniciar o projeto:

### Requisitos:
PHP(disponível através do XAMPP, MAMPP), Composer, Docker, Docker-compose, openssl (já disponível através do CMDer)

### Processo de instalação:
1. Iniciar o projeto com Magento (docs: https://devdocs.magento.com/guides/v2.3/install-gde/composer.html)

```bash
composer config --global http-basic.repo.magento.com <key> <pwd>
composer create-project --ignore-platform-reqs --repository=https://repo.magento.com/ magento/project-community-edition magento
```

2. Instalar as ferramentas para rodar docker:
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


3. Rodar a instalação
```bash
sudo bin/console install <hostname>
```
3.1 Caso o processo de criar as chaves não funcione, criar as chaves usando o openssl
Usando CMDER o path do openssl é o seguinte:

```bash
set OPENSSL_CONF=c:/{path to openSSL}/bin/openssl.cfg
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout config/nginx/ssl/key.pem -out config/nginx/ssl/cert.pem
```

# Usando o ambiente
Start the docker containers:

`bin/console start`

Stop the docker containers:

`bin/console stop`

Execute bin/magento inside the docker container:

`bin/console exec [arguments]`

For more information on how to use docker-compose visit: https://docs.docker.com/compose/

# Possíveis erros e como corrigí-los
```
Deprecated Functionality: Function ReflectionType::__toString() is deprecated in
/var/www/html/vendor/zendframework/zend-code/src/Reflection/ParameterReflection
.php on line 84
```
A versão do PHP está na 7.4, que não é suportada pelo magento, fazer downgrade para versão 7.3

```bash
Class Magento\Framework\App\ResourceConnection\Proxy does not exist
```
Conceder permissão para a pasta do magento `sudo chmod -R 777 magento/` 

```bash

```