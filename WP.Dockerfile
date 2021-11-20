#
# Install WordPress Image
#

FROM wordpress:latest

#
# Setup Xdebug
#
COPY conf/ /usr/local/etc/php/conf.d/
RUN pecl install xdebug && docker-php-ext-enable xdebug

#
# Install wp-cli and dependencies
#
RUN apt update \
 && apt install -y  wget default-mysql-client  \
 && apt clean

RUN apt-get update \
    && apt-get install -y \
    && curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp

ENV WP_CLI_ALLOW_ROOT = true

CMD ["apache2-foreground"]