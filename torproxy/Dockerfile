# Base image to be used
FROM alpine:edge

# Tweaked by me
LABEL maintainer "mark <norrkin@icloud.com>"

# Get dependicies 
RUN apk update && apk add \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
    libressl2.4-libcrypto \
    libressl2.4-libssl \
    libevent && \
# Get tor
    apk --no-cache add \
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ tor && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* && \
    # Set permissions
    chown -R tor /etc/tor

# Copy tor config
COPY torrc.default /etc/tor/torrc.default

# set user
USER tor

# Open port
EXPOSE 9050

# Finally start tor
ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]
