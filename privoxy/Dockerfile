# Base image to be used
FROM alpine:latest

# Tweaked by me
MAINTAINER mark <norrkin@icloud.com>

# Install privoxy
RUN apk update && apk --no-cache add \
    privoxy \
    && rm -rf /var/cache/apk/*

# Expose http port
EXPOSE 8118

# Copy in our privoxy config file
COPY privoxy.conf /etc/privoxy/config

# Make sure files are owned by privoxy user
RUN chown -R privoxy /etc/privoxy

# Start things
ENTRYPOINT [ "privoxy", "--no-daemon" ]
CMD [ "/etc/privoxy/config" ]