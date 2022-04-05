FROM alpine:3

EXPOSE 9000

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN apk add --update wget curl bash util-linux openrc mysql-client git\
					php \
					php-fpm \
					php-iconv \
					php-json \
					php-mysqli \
					php-phar

COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/html/wordpress

# download wp-cli to create and configure wordpress with new admin user
# and to listen to port 3306 wich is the default port of mysql
COPY conf/setup_wp-cli.sh ./

CMD	/bin/bash setup_wp-cli.sh