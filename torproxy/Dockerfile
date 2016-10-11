# Base image to be used
FROM alpine:latest

# Tweaked by me
MAINTAINER mark <norrkin@icloud.com>

# Get tor from alpine testing repo
RUN apk --no-cache add --repository http://dl-4.alpinelinux.org/alpine/edge/community/ tor && \
	rm -rf /var/cache/apk/* && \
	rm -rf /tmp/*

# Copy tor config
COPY torrc.default /etc/tor/torrc.default

# Set permissions
RUN chown -R tor /etc/tor

# Open port
EXPOSE 9050

# Finally start tor
ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]
