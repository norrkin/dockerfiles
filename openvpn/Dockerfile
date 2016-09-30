# Base image to be used
FROM alpine:latest

# Tweaked by me
MAINTAINER mark <norrkin@icloud.com>

# Evironment variables used in scripts
ENV openvpn=/opt/openvpn
ENV config=/opt/openvpn/openvpn.conf

# copy start script
COPY startopenvpn.sh /usr/local/bin/startopenvpn.sh

# Install openvpn and dependencies
RUN apk add --update bash openvpn openssl && \
	rm -rf /var/cache/apk/* && \
	rm -rf /tmp/*

# Create mount point
RUN mkdir -p ${openvpn}

# Open port
EXPOSE 1194/udp

# Set working directory
WORKDIR ${openvpn}

# Output logging to stdout
RUN ln -sf /dev/stdout /var/log/openvpn.log

# Start openvpn
CMD ["/usr/local/bin/startopenvpn.sh"]
