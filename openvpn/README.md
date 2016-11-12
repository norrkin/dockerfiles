## OpenVPN

#### My simple OpenVPN docker container using Alpine Linux base image.

Commands to build & deploy an OpenVPN docker container

*Build image;*

    $ sudo docker build --no-cache=true -t openvpn .

*Deploy container;*

    $ sudo docker run --privileged --restart=always -tid --name openvpn -p 1194:1194/udp -v /volume1/config/openvpn:/opt/openvpn openvpn

*Attach to container shell;*

    $ sudo docker exec -it openvpn /bin/sh

\**Tun Module;*

The tun module needs to be loaded to allow OpenVPN to create an TUN/TAP device (tun0).  Run tun.sh to load the tun module on the Synology nas before starting container.  This can be done via a scheduled task.

    $ sh /path/to/tun.sh