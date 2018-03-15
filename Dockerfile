FROM phusion/baseimage

RUN apt-get -qq update
RUN apt-get -qq install wget
RUN apt-get -qq install unzip
RUN apt-get -qq -y install php libapache2-mod-php php-mcrypt php-mysql

RUN apt-get -qq install apache2 -y

# install and run sqlbuddy [this version works with php7]
RUN mkdir /var/www/html/sqlbuddy
ADD sqlbuddy /var/www/html/sqlbuddy

RUN chmod -R 775 /var/www/html/sqlbuddy/

RUN /etc/init.d/apache2 start

EXPOSE 80

CMD apachectl -D FOREGROUND
