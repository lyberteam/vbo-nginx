FROM nginx:latest

MAINTAINER Vendor="lyberteam" Description="This is a new nginx image"

RUN echo "Europe/Kiev" > /etc/timezone




LABEL version="1.0"

#RUN apt-get update && apt-get install -y mc nano

RUN usermod -u 1000 www-data

#CMD ["nginx"]

RUN mkdir -p /etc/service/nginx
ADD start.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

RUN mkdir -p /var/www
RUN mkdir -p /var/lib/nginx/cache

EXPOSE 80
# EXPOSE 443

RUN  dpkg-reconfigure -f noninteractive tzdata

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
