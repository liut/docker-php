# docker-php
A simple and small php-fpm+nginx docker for developing

current php version: 7.2

## Build:

```sh
make 8.0 && make 8.0-tag

```

## Usage:

```
docker pull lcgc/php:7.2-bundle
docker run --name php-bundle -d -p 10080:80 -v $HOME/Sites:/var/www/htdocs -t lcgc/php:7.2-bundle
```

### testing

```
curl -v localhost:10080
```

### show ip
```
docker inspect -f "{{.NetworkSettings.IPAddress}}" php-bundle
```


