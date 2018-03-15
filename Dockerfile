FROM phusion/baseimage

RUN apt-get -qq update
RUN apt-get -qq install wget
RUN apt-get -qq install unzip
RUN apt-get -qq -y install php libapache2-mod-php php-mcrypt php-mysql

RUN apt-get -qq install apache2 -y

#RUN wget https://github.com/Frecuencio/sqlbuddy-php7/archive/master.zip        #https://github.com/calvinlough/sqlbuddy/raw/gh-pages/sqlbuddy.zip
#RUN unzip sqlbuddy.zip -d /var/www/html/sqlbuddy
RUN mkdir /var/www/html/sqlbuddy
ADD sqlbuddy /var/www/html/sqlbuddy

RUN chmod -R 775 /var/www/html/sqlbuddy/

RUN /etc/init.d/apache2 start

EXPOSE 80

CMD apachectl -D FOREGROUND
