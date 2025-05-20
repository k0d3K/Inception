#!/bin/sh
set -e

# Download and install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Install WordPress
wp core download --allow-root

wp config create \
  --dbname="$DB_NAME" \
  --dbuser="$DB_USER" \
  --dbpass="$DB_PASSWORD" \
  --dbhost="mariadb" \
  --allow-root

wp core install \
  --url="$DOMAIN_NAME" \
  --title="inception" \
  --admin_user="$WP_USER" \
  --admin_password="$WP_PASS" \
  --admin_email="$WP_MAIL" \
  --allow-root

wp user create "$WP_USER2" "$WP_MAIL2" \
  --role=author \
  --user_pass="$WP_PASS2" \
  --allow-root

wp user set-role 2 editor --allow-root

# Install and configure Redis
wp theme install astra --activate --allow-root
wp plugin install redis-cache --activate --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp plugin update --all --allow-root
wp redis enable --allow-root

exec "$@"