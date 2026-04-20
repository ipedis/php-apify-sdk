FROM php:8.4-cli-alpine

RUN apk add --no-cache git unzip libxml2-dev oniguruma-dev libzip-dev linux-headers $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install dom xml mbstring zip \
    && apk del $PHPIZE_DEPS

COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer

WORKDIR /app