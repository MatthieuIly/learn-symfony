# phpfpm Service
FROM php:8.1-fpm-alpine3.16

# Apk install
RUN apk add --no-cache $PHPIZE_DEPS

RUN pecl install xdebug-3.1.5
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.log=/var/log/xdebug.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN touch /var/log/xdebug.log
RUN chmod 666 /var/log/xdebug.log

# Install pdo
#RUN docker-php-ext-install pdo_mysql

# Symfony CLI
#RUN wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

WORKDIR /var/www/html

COPY composer.json composer.lock composer.phar ./
COPY . .
RUN php composer.phar install
CMD [ "php-fpm" ]
