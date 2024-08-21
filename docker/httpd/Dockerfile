FROM php:8.2-apache

ARG WITH_XDEBUG=false

RUN apt-get update

#Apache2
RUN a2enmod rewrite && a2enmod ssl
COPY ./000-default.conf /etc/apache2/sites-available

#Composer
RUN apt-get update -y \
    && cd /opt \
    && curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php \
    && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

#Start xdebug
COPY ./xdebug.ini /opt
RUN if [ $WITH_XDEBUG = true ]; then \
        pecl install xdebug; \
        docker-php-ext-enable xdebug; \
        cp /opt/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini; \
    fi
RUN rm /opt/xdebug.ini
#End xdebug

RUN apt-get install zip unzip libzip-dev -y
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN pecl install redis && docker-php-ext-enable redis

#Update
RUN apt-get update -y
