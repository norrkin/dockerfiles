## SABnzbd

#### SAB Docker container using Debian Jessie

Commands to build & deploy an SABnzbd container using Docker.

*Build image;*

    $ sudo docker build -t sabnzbd .

*Deploy container;*

    $ sudo docker run -tid --name sabnzbd -m 512m -v /volume1/downloads/SABnzbd/config:/datadir -v /volume1/downloads/SABnzbd:/downloads -p 9090:8080 -e SABNZBD_UID=100 -e SABNZBD_GID=100 sabnzbd
