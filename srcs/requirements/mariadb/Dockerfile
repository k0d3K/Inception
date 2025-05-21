FROM	debian:bullseye

#	Install php
RUN		apt update -y && apt upgrade -y && apt install -y mariadb-server mariadb-client gettext-base

#	Copy the mariadb config
COPY	./config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#	Setup mariadb executable envirnement
RUN	mkdir ./entrypoint-initdb.d
#	Copy SQL template file
COPY	./tools/init.sql.template /entrypoint-initdb.d
#	Create a runtime directory and add cahnge ownership to the mysql user
RUN	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

#	Copy the script and add righst to execute
COPY	./tools/entrypoint.sh ./
RUN		chmod +x entrypoint.sh

#	Set port 3306 (default)
EXPOSE	3306

#	Launch mariadb
ENTRYPOINT ["./entrypoint.sh"]
CMD ["mysqld"]