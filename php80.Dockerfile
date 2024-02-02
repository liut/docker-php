FROM alpine:3.16
MAINTAINER Eagle Liut <eagle@dantin.me>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
	&& apk --update add \
	bash \
	ca-certificates \
	git \
  php8-ctype \
  php8-curl \
  php8-dom \
  php8-fpm \
  php8-gd \
  php8-iconv \
  php8-json \
  php8-ldap \
  php8-pgsql \
  php8-pdo_mysql \
  php8-pdo_pgsql \
  php8-mysqli \
  php8-zlib \
  php8-pecl-swoole \
  php8-pecl-protobuf \
  grpc \
  composer \
  && rm -rf /var/cache/apk/*

RUN set -eux; \
  apk add --no-cache --virtual .build-deps \
    build-base \
    php8-dev \
    php8-pear \
    grpc-dev \
    linux-headers \
    && cd /tmp \
    && wget -O grpc.tgz https://codeload.github.com/grpc/grpc/tar.gz/refs/tags/v1.46.7 \
    && tar zxf grpc.tgz && cd grpc-1.46.7/src/php/ext/grpc \
    && phpize8 && ./configure --prefix=/usr --with-php-config=php-config8 --enable-grpc=/usr \
    && make && make install \
    && echo "extension=grpc.so" > /etc/php8/conf.d/grpc.ini \
    && cd /tmp && ls . && rm -rf grpc-* && rm /tmp/grpc.tgz \
  ; \
  apk del .build-deps; \
  rm -rf /var/cache/apk/*

EXPOSE 9000
