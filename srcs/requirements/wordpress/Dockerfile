FROM	debian:bullseye

# Install PHP and extensions
RUN		apt update -y && apt upgrade -y && apt install -y curl php-fpm php-mysqli

# Setup rights
RUN		mkdir -p /run/php && chown www-data:www-data /run/php

# Setup config
COPY	./config/www.conf /etc/php/7.4/fpm/pool.d
WORKDIR	/var/www/html

# Copy the script
COPY	./tools/script.sh .
RUN		chmod +x script.sh

# Expose port 9000
EXPOSE	9000

# Launch WordPress
ENTRYPOINT ["/var/www/html/script.sh"]
CMD ["php-fpm7.4", "-F"]
