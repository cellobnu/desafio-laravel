FROM php:7.3.12-fpm-alpine3.9

RUN apk add --no-cache openssl bash mysql-client 
RUN docker-php-ext-install pdo pdo_mysql

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
RUN rm -rf /var/www/html

# USER root                                                                                  
# RUN chmod +x /var/www/.docker/entrypoint.sh

# WORKDIR /var/www/laravel
# RUN composer install
# RUN cp .env.example .env
# RUN php artisan key:generate
# RUN php artisan config:cache
# RUN php artisan migrate 

# COPY . /var/www

RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www/storage

RUN ln -s public html

# RUN usermod -u 1000 www-dat
# RUN find storage bootstrap/cache public -type f -exec chmod o+w {} \;
# RUN find storage bootstrap/cache public -type d -exec chmod o+wx {} \;
# RUN chmod o-w public/index.php

EXPOSE 9000