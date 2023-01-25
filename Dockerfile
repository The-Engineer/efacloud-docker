FROM php:7.4-apache

RUN apt-get clean
RUN apt-get update

# install extensions
RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip
RUN docker-php-ext-install calendar exif gettext mysqli pdo_mysql sockets

# add efa installer
WORKDIR /var/www/html
COPY install.php .
