FROM alpine:3.15

# TOOLS, USER
RUN apk upgrade && apk add --no-cache shadow mc && \
    adduser -D -g 'www' www && \
    usermod -u 1000 www && \
    groupmod -g 1000 www

# NGINX
RUN apk add --no-cache nginx && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www

# PHP https://github.com/codecasts/php-alpine
ADD https://php.hernandev.com/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update-cache add ca-certificates && \
    echo "https://php.hernandev.com/v3.15/php-8.1" >> /etc/apk/repositories

RUN apk add --update-cache \
    php8 \
    php-fpm

EXPOSE 80

COPY ./start-script.sh /usr/bin
RUN chmod u+x /usr/bin/start-script.sh

WORKDIR /www

ENTRYPOINT [ "start-script.sh" ]