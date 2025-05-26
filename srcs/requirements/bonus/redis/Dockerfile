FROM	debian:bullseye

#	Install redis-server
RUN		apt-get update -y && apt-get upgrade -y && apt install -y redis-server

#	Setup config
RUN		echo "maxmemory 256mb" >> /etc/redis/redis.conf
RUN		echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
RUN		sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis/redis.conf

#	Launch service
CMD		["redis-server",  "--protected-mode", "no"]