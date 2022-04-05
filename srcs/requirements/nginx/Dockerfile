FROM debian:buster

EXPOSE 443

RUN apt-get update
RUN apt-get -y install apt-utils nginx openssl

COPY conf/default ./
COPY conf/setup.sh ./

RUN chmod +x setup.sh
RUN /bin/bash setup.sh

CMD nginx -g "daemon off;"
