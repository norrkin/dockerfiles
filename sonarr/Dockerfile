# Base image to be used
FROM debian:jessie

# Tweaked by me
LABEL maintainer "mark <norrkin@icloud.com>"

# Define what release we want to use
ENV sonarr_release 2.0.0.4928

# Adding nzbdrone startup script
ADD start.sh /

# Get sonarr & its dependencies
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/debian jessie main" | tee /etc/apt/sources.list.d/mono-official.list && \

    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
    echo "deb http://apt.sonarr.tv/ master main" | tee -a /etc/apt/sources.list && \
    apt-get update -q && \
    apt-get install -qy mono-devel nzbdrone=${sonarr_release} mediainfo --no-install-recommends && \
    apt-get autoremove && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
# Match user id with host
    useradd -M -u 1030 -g 100 nzbdrone -s /bin/sh && \
# And set execute permissions
    chmod +x /start.sh && chown nzbdrone:users /start.sh && \
    chown -R nzbdrone:users /opt/NzbDrone

# Set working directory
WORKDIR /opt/NzbDrone

# Open sonarr port
EXPOSE 8989

# Start sonarr
CMD ["/start.sh"]