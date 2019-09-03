FROM a2way/docker_base-php-fpm-laravel:v1.4.0 as builder
WORKDIR /app
COPY ./src/composer.json ./src/composer.lock /app/
RUN composer install --ignore-platform-reqs --no-autoloader --no-dev

FROM a2way/docker_base-php-fpm-laravel:v1.4.0
WORKDIR /app
COPY --chown=www-data:www-data --from=builder /app/vendor/ /app/vendor/
COPY --chown=www-data:www-data ./src /app
RUN composer dump-autoload
