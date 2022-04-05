FROM debian:buster

ARG DB_ROOT_PWD
ARG DB_NAME
ARG DB_USR
ARG DB_PWD

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

# configure new database mysql
COPY conf/setup.sql ./

# change 127.0.0.1 to 0.0.0.0 to open all ports. Later, to connect wordpress
# to mysql I need it
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mysql start && mysql < setup.sql

CMD	/usr/bin/mysqld_safe