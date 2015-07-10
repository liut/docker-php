# docker-php-fpm
A simple and small php-fpm+nginx docker for developing

current php version: 5.6.10

## Usage:

```
docker pull lcgc/php-fpm
docker run --name php-fpm -d -p 10080:80 -v $HOME/Sites:/var/www/htdocs -t lcgc/php-fpm
```

### testing

```
# linux
curl -v localhost:10080

# osx
curl -v 192.168.59.103:10080
```

### show ip
```
docker inspect -f "{{.NetworkSettings.IPAddress}}" php-fpm
```


