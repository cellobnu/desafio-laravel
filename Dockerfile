FROM php:7.3.12-fpm-alpine3.9

RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
RUN rm -rf /var/www/html


# WORKDIR /var/www/laravel
# RUN composer install
# RUN cp .env.example .env
# RUN php artisan key:generate
# RUN php artisan config:cache
# RUN php artisan migrate 

# COPY . /var/www
RUN ln -s public html

RUN chown -R www-data:www-data /var/www

EXPOSE 9000
ENTRYPOINT ["php-fpm"]