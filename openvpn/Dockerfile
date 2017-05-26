# Base image to be used
FROM alpine:3.6

# Tweaked by me
LABEL maintainer "mark <norrkin@icloud.com>"

# Evironment variables used in scripts
ENV openvpn=/opt/openvpn
ENV config=/opt/openvpn/openvpn.conf

# copy start script
COPY startopenvpn.sh /usr/local/bin/startopenvpn.sh

# set permissions
RUN chmod +x /usr/local/bin/startopenvpn.sh && \
# Install openvpn and dependencies
	apk update && apk add openvpn openssl && \
	rm -rf /var/cache/apk/* && rm -rf /tmp/* && \
# Create mount point
	mkdir -p ${openvpn} && \
# Output logging to stdout
	ln -sf /dev/stdout /var/log/openvpn.log

# Open port
EXPOSE 1194/udp

# Set working directory
WORKDIR ${openvpn}

# Start openvpn
CMD ["/usr/local/bin/startopenvpn.sh"]
