FROM alpine:3.20.1
RUN apk add --no-cache \
        shadow \
        bash

RUN mkdir -p /srv/exoscript && mkdir -p /srv/sandboxer

COPY ./config/scripts/* /srv/exoscript/
COPY ./config/phpMyAdmin/config.inc.php /

# Let's run with our own user for extra security
RUN groupadd -g 1000 sandboxers && \
    useradd -u 1000 -g sandboxers -m sandboxer && \
    # Make the script executable
    chmod +x /srv/exoscript/phpmyadmin-install.sh
