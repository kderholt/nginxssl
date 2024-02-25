from nginx:alpine AS nginx

COPY . /tmp

RUN mkdir /srv/webroot
RUN mkdir /config
RUN mkdir /etc/nginx/sites/

RUN apk add bash
RUN apk add certbot
RUN apk add perl
RUN apk add build-base libffi-dev openssl-dev py-pip
RUN pip install cryptography==38.0.3

RUN mv /tmp/templates/default.conf /etc/nginx/conf.d/default.conf
RUN mv /tmp/templates/template.conf /config/nginxtemplate.conf
RUN mv /tmp/certbot/letsencrypt.conf /config/letsencrypt.conf
RUN mv /tmp/certbot/setupDomain.pl /config/setupDomain.pl
RUN mv /tmp/certbot/createCert.sh /docker-entrypoint.d/40-createCert.sh

RUN chmod 755 /config/setupDomain.pl
RUN chmod 755 /docker-entrypoint.d/40-createCert.sh
