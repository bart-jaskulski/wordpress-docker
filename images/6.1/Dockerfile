#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "write-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM wordpress:6.1

RUN usermod -u 1000 www-data

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libmcrypt-dev \
    libxml2-dev \
    sendmail \
    && pecl install xdebug mcrypt \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-enable pdo \
    && docker-php-ext-enable xdebug

COPY mhsendmail /usr/bin/mhsendmail
COPY php.ini /usr/local/etc/php/php.ini
# Remove default plugins.
RUN rm -r /usr/src/wordpress/wp-content/plugins/*
COPY wp-content /usr/src/wordpress/wp-content
