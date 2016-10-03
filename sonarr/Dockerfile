# Base image to be used
FROM debian:wheezy

# Tweaked by me
MAINTAINER mark <norrkin@icloud.com>

# define what release we want to use
ENV sonarr_release 2.0.0.4230

# get Sonarr & its dependencies
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
  echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
  echo "deb http://apt.sonarr.tv/ master main" | tee -a /etc/apt/sources.list && \
  apt-get update -q && \
  apt-get install -qy mono-devel nzbdrone=${sonarr_release} mediainfo --no-install-recommends && \
  apt-get clean && apt-get autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Match user id running on host
RUN useradd -M -u 1030 -g 100 nzbdrone -s /bin/sh

# adding nzbdrone startup script
ADD start.sh /
# and setting execute permissions
RUN chmod +x /start.sh && chown nzbdrone:users /start.sh

# set more permissions
RUN chown -R nzbdrone:users /opt/NzbDrone
WORKDIR /opt/NzbDrone

EXPOSE 8989

CMD ["/start.sh"]
