#!/bin/sh

php-fpm -t || exit 1
nginx -t || exit 1

php-fpm
nginx
