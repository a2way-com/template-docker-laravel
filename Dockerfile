FROM a2way/docker_base-php-fpm-laravel:v1.4.0
ARG UID
ARG GID
RUN apk --update add sudo shadow composer
RUN usermod -u $UID www-data && groupmod -g $GID www-data
RUN echo "www-data ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
