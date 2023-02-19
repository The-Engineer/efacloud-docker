FROM php:8.2-apache

RUN apt clean
RUN apt update && apt upgrade -y

# install extensions
RUN apt install -y libzip-dev zip libbz2-dev libpng-dev libxslt1-dev
RUN rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install zip
RUN docker-php-ext-install calendar exif gettext mysqli pdo_mysql sockets
RUN docker-php-ext-install bz2 gd xsl

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
# RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Enable apache modules
RUN a2enmod rewrite headers

# set apache dir as working dir
WORKDIR /var/www/html

# download efa installer
RUN curl https://www.efacloud.org/src/efacloud_install.zip --output efacloud_install.zip
RUN unzip efacloud_install.zip
RUN rm efacloud_install.zip

# set proper permissions on installer file
RUN chown -R www-data:www-data /var/www/html
