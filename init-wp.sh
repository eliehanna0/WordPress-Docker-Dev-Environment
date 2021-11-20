#!/usr/bin/env bash
set -eu

cd /var/www/html/

until  wp config path ;
  do :
    echo "No wp-config.php found, waiting for wordpress to copy files, retrying in 10 seconds..."
		sleep 10;
  done

wp core install --path="/var/www/html" --url="http://localhost" --title="${WP_SITE_TITLE}" --admin_user="${WP_SITE_USERNAME}" --admin_password="${WP_SITE_PASSWORD}" --admin_email="${WP_SITE_EMAIL}"

exit 0;

