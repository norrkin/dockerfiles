## Sonarr

#### Sonarr container using Debian Wheezy.
* *To-do;* need to look into using Alpine, debian image is rather big in size due to mono.

Commands to build & deploy an Sonarr container using Docker.

*Build image;*

    $ sudo docker build --no-cache=true  -t sonarr .

*Run container;*

    $ sudo docker run -tid -m 256m --name sonarr --link sabnzbd:sabnzbd -p 8989:8989 -v /volume1/downloads/Sonarr/config:/config -v /volume1/downloads:/volume1/downloads -v /volume1/media/video/tv:/volume1/media/video/tv -e PUID=1030 -e PGID=100 sonarr

*Attach to container;*

    $ sudo docker exec -it sonarr /bin/sh
