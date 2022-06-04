#!/bin/sh

php-fpm8 &
sleep 1
nginx -g 'daemon off;'
wait -n
exit $?