## gitlist

#### Docker container for gitlist using nginx/php-fpm using Alpine Linux.

Reference - [gitlist.org](http://gitlist.org)

*Build and run;*

    $ sudo docker build -t gitlist:latest .
 
    $ sudo docker run --name gitlist -v /volume1/repo/:/volume1/repo/ -p 8054:80 -d gitlist:latest

*Attach to container;*

    $ sudo docker exec -it gitlist bash
