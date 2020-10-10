FROM ubuntu:latest
RUN apt-get update -y && apt-get upgrade -y 
RUN DEBIAN_FRONTEND=noninteractive apt-get install apache2 -y
RUN apt-get install php libapache2-mod-php php-mysql -y
RUN apt-get install zip -y
RUN apt-get install php7.4-xml -y
RUN rm /etc/apache2/apache2.conf
COPY apache2.conf /etc/apache2/
RUN a2enmod rewrite
USER root
ADD Academy-LMS /var/www/html/
RUN rm /var/www/html/index.html
RUN apt install libapache2-mod-php php-curl -y
EXPOSE 80
CMD apachectl -D FOREGROUND
