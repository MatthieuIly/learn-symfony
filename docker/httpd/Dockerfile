FROM httpd:alpine3.16

#RUN apt-get update && apt-get install -y apache2
#RUN a2enmod proxy_fcgi
RUN apk add apache2-proxy

ENV APACHE_LOG_DIR=/usr/local/apache2/logs
RUN mkdir /var/www/html

COPY ./conf/000-default.conf /usr/local/apache2/conf/extra/000-default.conf
COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf

CMD ["httpd-foreground"]
