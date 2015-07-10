FROM alpine:3.2
MAINTAINER Eagle Liut <eagle@dantin.me>

RUN apk --update add \
  nginx \
  php-fpm \
  php-json \
  php-ctype \
  && rm -rf /var/cache/apk/*

RUN sed -i "s|listen = .*|listen = /var/run/php5-fpm.sock|g" /etc/php/php-fpm.conf \
 && sed -i "s|;listen.owner = .*|listen.owner = nobody|g" /etc/php/php-fpm.conf \
 && sed -i "s|;listen.group = .*|listen.group = nobody|g" /etc/php/php-fpm.conf

ADD etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD etc/nginx/host.default /etc/nginx/sites-available/default

RUN mkdir -p /etc/nginx/sites-enabled \
 && ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

ADD index.html /var/www/htdocs/
ADD start.sh /start.sh

VOLUME ["/var/www", "/etc/nginx/conf.d", "/etc/nginx/certs"]

EXPOSE 80

CMD ["/start.sh"]
