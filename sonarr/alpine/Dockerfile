FROM alpine:latest

MAINTAINER mark <norrkin@icloud.com>

ENV MONO_VERSION 4.2.2.30-r1

# get mono
RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk -U upgrade && \
  apk add --no-cache mono ca-certificates && \
  rm /tmp/* && \
  rm -rf /tmp/src && \
  rm -rf /var/cache/apk/*

# get libmediainfo


RUN wget http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz -O NzbDrone.master.tar.gz && \
  tar xzvf NzbDrone.master.tar.gz && \
  rm NzbDrone.master.tar.gz

# Match user id with running host. (For mapped svn repo)
RUN adduser -H -u 102 -g 100 nzbdrone -S -D /sbin/nologin

ADD start.sh /
RUN chmod +x /start.sh

EXPOSE 8989

CMD ["/start.sh"]


# Build commands
# sudo docker build -t sonarr .
#
# Run container commands
# sudo docker run -tid --name sonarr --link sabnzbd:sabnzbd -p 8989:8989 -v /dev/rtc0:/dev/rtc:ro -v /volume1/downloads/Sonarr/config:/config -v /volume1/media/video/tv:/volume1/media/video/tv -e PUID=102 -e PGID=100 sonarr
#
#
# Attach to container
# sudo docker exec -it sonarr /bin/sh
