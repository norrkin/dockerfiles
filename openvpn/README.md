## OpenVPN

#### My simple OpenVPN docker container using Alpine Linux base image.

Commands to build & deploy an OpenVPN docker container

*Build image;*

    $ sudo docker build --no-cache=true -t openvpn .

*Deploy container;*

    $ sudo docker run --privileged --restart=always -tid --name openvpn -p 1194:1194/udp -v /volume1/config/openvpn:/opt/openvpn openvpn

*Attach to container shell;*

    $ sudo docker exec -it openvpn /bin/sh
