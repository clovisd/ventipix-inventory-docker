FROM php:8.2-apache

RUN apt-get -y update

RUN apt-get install -y libjpeg62-turbo libjpeg62-turbo-dev libjpeg-dev
RUN apt-get install -y libicu-dev libzip-dev zlib1g-dev libpng-dev libgd3 libwebp-dev libfreetype-dev

# Install and Configure Intl
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-enable intl

# Install and Configure Zip
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip
RUN docker-php-ext-enable zip

# Install and Configure GD
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-install gd
RUN docker-php-ext-enable gd

# Install and Configure Mysql
RUN docker-php-ext-configure mysqli
RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli
RUN docker-php-ext-configure pdo_mysql
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable pdo_mysql

# Install and COnfigure OpenSSL (for SSL Emails) [NOT NEEDED]
# RUN docker-php-ext-configure sendmail
# RUN docker-php-ext-install sendmail
# RUN docker-php-ext-enable sendmail

# ioncube loader
RUN curl -fSL 'http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz' -o ioncube.tar.gz \
    && mkdir -p ioncube \
    && tar -xf ioncube.tar.gz -C ioncube --strip-components=1 \
    && rm ioncube.tar.gz \
    && mv ioncube/ioncube_loader_lin_8.2.so /var/www/ioncube_loader_lin_8.2.so \
    && rm -r ioncube

# phpini
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN echo "zend_extension = /var/www/ioncube_loader_lin_8.2.so" >> "$PHP_INI_DIR/php.ini"
RUN echo "upload_max_filesize = 256M" >> "$PHP_INI_DIR/php.ini"
RUN echo "memory_limit = 256M" >> "$PHP_INI_DIR/php.ini"

# apache
RUN a2enmod rewrite
