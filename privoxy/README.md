## Privoxy

An HTTP proxy using Socks5 to filter traffic through Tor.

#### Build commands

*Build image;*

    $ sudo docker build -t privoxy .

*Deploy Container;*

    $ sudo docker run -d --name privoxy -v /etc/localtime:/etc/localtime:ro --link torproxy:torproxy -p 8118:8118 privoxy

*Browser Configuration;*

Change browser proxy to docker.host:8118 and check via https://check.torproject.org/ that the tor proxy is working.

