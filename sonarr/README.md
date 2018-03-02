## Sonarr

#### Sonarr Docker container using Debian Stretch base image.
\**To-do;* need to look into using Alpine, debian image is rather big due to mono.

Commands to build & deploy an [Sonarr](https://sonarr.tv) container using Docker.

*Build image;*

    $ sudo docker build -t sonarr .

*Run container;*

\*Following command sets max memory and links to an existing SABnzbd instance.

    $ sudo docker run -tid -m 256m --name sonarr --link sabnzbd:sabnzbd -p 8989:8989 -v /volume1/downloads/Sonarr/config:/config -v /volume1/downloads/SABnzbd:/download -v /volume1/media/video/tv:/volume1/media/video/tv -e UID=1030 -e GID=100 sonarr

*Attach to container;*

    $ sudo docker exec -it sonarr /bin/sh