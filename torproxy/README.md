## Tor

A socks5 container for routing traffic through Tor.

#### Build commands
 
*Build image;*

    $ sudo docker build -t torproxy .

*Deploy container;*

    $ sudo docker run -d --name torproxy --restart always -v /etc/localtime:/etc/localtime:ro -p 9050:9050 torproxy

