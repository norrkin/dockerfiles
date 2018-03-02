## SABnzbd

#### SABnzbd Docker container using Debian Stretch

Commands to build & deploy an SABnzbd container using Docker.

*Build image;*

    $ sudo docker build -t sabnzbd .

*Deploy container;*

    $ sudo docker run -tid --name sabnzbd -m 512m -v /volume1/downloads/SABnzbd/config:/datadir -v /volume1/downloads/SABnzbd:/download -p 9090:8080 -e UID=100 -e GID=100 sabnzbd