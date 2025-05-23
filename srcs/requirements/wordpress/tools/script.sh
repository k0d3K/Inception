#!/bin/sh
set -e

# Working environment
mkdir -p /var/www/html
cd /var/www/html

# Use full path to wp
WP="/usr/local/bin/wp"

# Download and install WP-CLI if not already there
if [ ! -f $WP ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
fi

# Install WordPress if not already installed
if [ ! -f wp-config.php ]; then

  $WP core download --allow-root

  $WP config create \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass="$DB_PASSWORD" \
    --dbhost="mariadb" \
    --allow-root

  $WP core install \
    --url="$DOMAIN_NAME" \
    --title="inception" \
    --admin_user="$WP_USER" \
    --admin_password="$WP_PASS" \
    --admin_email="$WP_MAIL" \
    --allow-root

  $WP user create "$WP_USER2" "$WP_MAIL2" \
    --role=author \
    --user_pass="$WP_PASS2" \
    --allow-root

  $WP user set-role 2 editor --allow-root

  $WP theme install oceanwp --activate --allow-root

fi

exec "$@"
