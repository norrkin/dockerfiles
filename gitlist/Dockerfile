# Base image to use
FROM alpine:latest

# Tweaked by me
LABEL maintainer "mark <norrkin@icloud.com>"

# Install packages
RUN apk add --update nginx php5-fpm php5-ctype php5-json bash git && \
	rm -rf /var/cache/apk/* /tmp/*

# nginx
COPY config/nginx.conf /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/sites-available && \
	mkdir /etc/nginx/sites-enabled
ADD config/default.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/ && \
	mkdir -p /srv/www/ && chown nginx:nginx /srv/www/
ADD index.html /srv/www/

# gitlist setup
ADD https://s3.amazonaws.com/gitlist/gitlist-master.tar.gz /srv/www/
RUN cd /srv/www/; tar -zxvf gitlist-master.tar.gz && rm gitlist-master.tar.gz && \
	chmod -R 777 /srv/www/ && \
	cd /srv/www/gitlist/; mkdir cache; chmod 777 cache
ADD config/config.ini /srv/www/gitlist/
RUN chmod 777 /srv/www/gitlist/config.ini; chmod 775 /srv/www/ && \
# Match user id with running host. (For mapped git repo)
	adduser -H -u 1026 -g 100 mark -S -D /sbin/nologin

# copy startup script
COPY start.sh /

VOLUME /volume1/repo/

EXPOSE 80

CMD ["/start.sh"]


# Commands to build & deploy this docker container
#
## Build image
# sudo docker build -t gitlist .
#
#
## Deploy container - edit host path i.e. /path/on/host:/var/lib/mysql
# sudo docker run --name gitlist -v /volume1/repo/:/volume1/repo/ -p 8054:80 -d gitlist
#
## Attach to container
# sudo docker exec -it gitlist bash
