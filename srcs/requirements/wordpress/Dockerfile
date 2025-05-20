FROM	debian:bullseye

#	Install php
RUN		apt update -y && apt ugrade -y && apt install curl php-fpm php-mysqli php-redis

#	Setup rigths to execute /run/php
RUN		mkdir -p /run/php && chown www-data:www-data /run/php
WORKDIR	/var/www/html

#	Copy the script and add righst to execute
COPY	./tools/script.sh .
RUN		chmod +x script.sh

#	Set port 9000 for nginx comunication
EXPOSE	9000

#	Launch wordpress
ENTRYPOINT ["/var/www/html/script.sh"]
CMD ["php-fpm7.4", "-F"]         