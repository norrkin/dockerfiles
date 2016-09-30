## gitlist

#### A docker container for gitlist using nginx/php-fpm and Alpine Linux as its base image.

Reference - [gitlist.org](http://gitlist.org)

*Build and run;*

    $ sudo docker build -t gitlist .

    $ sudo docker run --name gitlist -v /volume1/repo/:/volume1/repo/ -p 8054:80 -d gitlist

*Attach to container;*

    $ sudo docker exec -it gitlist bash
