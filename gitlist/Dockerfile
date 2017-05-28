# base image to use
FROM alpine:3.6

# tweaked by me
LABEL maintainer "mark <norrkin@icloud.com>"

# copy nginx config & start script
COPY etc /etc
COPY supervisord.ini /etc/supervisor.d/supervisord.ini
COPY entrypoint.sh /usr/bin/entrypoint.sh

# install packages
RUN apk update && apk add --no-cache curl nginx php5-fpm php5-ctype php5-json git supervisor && \
# gitlist setup
	curl -Lk https://s3.amazonaws.com/gitlist/gitlist-master.tar.gz -o /tmp/gitlist.tar.gz && \
	mkdir -p /srv/gitlist && \
	tar -zxvf /tmp/gitlist.tar.gz -C /srv/ && \
	cp /etc/config.ini /srv/gitlist && \
	chmod -R 775 /srv/gitlist && \
	mkdir -p /srv/gitlist/cache && \
	chmod 777 /srv/gitlist/cache && \
# match user id with running host. (For mapped git repo)
	adduser -H -u 1026 -g 100 mark -S -D /sbin/nologin && \
# set excute permissions on start script	
	chmod +x /usr/bin/entrypoint.sh && \
# tidy up
	apk del curl && \
	rm -r /srv/gitlist/.git && \
	rm -rf /var/cache/apk/* /tmp/*

VOLUME /repo/

EXPOSE 80

CMD ["/usr/bin/entrypoint.sh"]


# Commands to build & deploy this docker container
#
## Build image
# sudo docker build -t gitlist .
#
#
## Deploy container - edit host path i.e. /path/on/host:/var/lib/mysql
# sudo docker run --name gitlist -v /volume1/repo/:/repo/ -p 8054:80 -d gitlist
#
## Attach to container
# sudo docker exec -it gitlist bash
