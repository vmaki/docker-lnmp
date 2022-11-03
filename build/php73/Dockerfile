FROM php:7.3-fpm

#时区
ENV TZ Asia/Shanghai
RUN date -R

WORKDIR /var/www/html

RUN apt-get update --fix-missing && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libzip-dev  \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include/jpeg \
    && docker-php-ext-install gd mysqli opcache pdo_mysql gd zip

RUN pecl install redis-4.0.1 \
    && pecl install swoole-4.2.13 \
    && pecl install mongodb-1.5.3 \
    && docker-php-ext-enable redis swoole mongodb

RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# clear
RUN rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /var/lib/sessions \
    && chmod o=rwx -R /var/lib/sessions

CMD ["php-fpm"]