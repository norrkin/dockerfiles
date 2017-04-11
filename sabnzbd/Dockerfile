# Base image to be used
FROM debian:jessie

# Tweaked by me
MAINTAINER mark <norrkin@icloud.com>

# Define what release we want to use
ENV SABNZBD_VERSION 2.0.0
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Create user and group for SABnzbd
RUN groupadd -o -g 100 sabnzbd && useradd -o -M -u 100 -g 100 -d /sabnzbd sabnzbd

# Install dependencies
RUN sed -i "s/ main$/ main contrib non-free/" /etc/apt/sources.list && \
    echo "deb http://ppa.launchpad.net/jcfp/sab-addons/ubuntu xenial main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F13930B14BB9F05F && \
    apt-get update -q && \
    apt-get install -qy curl ca-certificates python-cheetah python-openssl python-sabyenc libgomp1 git unzip unrar p7zip-full build-essential automake

# Build SABnzbd & par2cmdline (multithreaded)
RUN curl -o /tmp/sabnzbd.tar.gz https://codeload.github.com/sabnzbd/sabnzbd/tar.gz/${SABNZBD_VERSION} && \
    tar xzf /tmp/sabnzbd.tar.gz && \
    mv sabnzbd-* sabnzbd && \
    chown -R sabnzbd: sabnzbd && \
    git clone https://github.com/jkansanen/par2cmdline-mt.git /tmp/par2cmdline-mt && \
    cd /tmp/par2cmdline-mt && \
    aclocal && \
    automake --add-missing && \
    autoconf && \
    ./configure && \
    make && \
    make install && \
    apt-get -y remove curl build-essential automake && \
    apt-get -y autoremove && apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add SABnzbd init script
ADD sabnzbd.sh /sabnzbd.sh
RUN chmod 755 /sabnzbd.sh

# Define container settings
VOLUME ["/datadir", "/download"]
# Set working directory
WORKDIR /sabnzbd

# Open port
EXPOSE 8080

# Start SABnzbd
CMD ["/sabnzbd.sh"]
