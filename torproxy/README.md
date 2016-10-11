## Tor

A socks5 container for routing traffic through Tor.

#### Build commands
 
*Build image;*

    $ sudo docker build -t torproxy .

*Deploy container;*

    $ sudo docker run -d --name torproxy --restart always -v /etc/localtime:/etc/localtime:ro -p 9050:9050 torproxy

\*Tor exit node is specified within the *torrc.default* config file, currently set to `ExitNodes {GB}`.  If you do not wish to have this set comment out the line.