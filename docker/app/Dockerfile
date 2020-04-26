FROM php:7.3-apache

# Подключаем модуль Apache Rewrite
RUN cd /etc/apache2/mods-enabled && ln -s ../mods-available/rewrite.load

# Устанавливаем требуемые разширения PHP
# -- GD
# RUN apt-get update && \
#    apt-get install -y libfreetype6-dev && \
#    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ && \
#    docker-php-ext-install -j$(nproc) gd
# -- mysql
# RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:ondrej/php
RUN docker-php-ext-install mysqli
RUN apt-get update && apt-get install -y mc 
# php7.0-mysql 
# php7.0-mysqli
# && docker-php-ext-install -j$(nproc) mysql pdo_mysql

# RUN apt-get update && apt-get install -y mc

ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini
# ADD htaccess /var/www/html/.htaccess
