FROM debian:latest

RUN apt-get update
RUN apt-get install -y apache2 nodejs npm
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY ./front/dist/front/browser/* /var/www/html/
COPY ./angular-apache.conf /etc/apache2/sites-available/000-default.conf

RUN a2ensite 000-default.conf

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]