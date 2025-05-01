FROM alpine:3.20.1
RUN apk add --no-cache \
        shadow \
        nano \
        apache2 \
        apache2-proxy \
        apache2-webdav \
        apache-mod-fcgid \
        apache2-brotli \
        bash

COPY ./config/apache2/conf.d/sandboxer.conf /etc/apache2/conf.d/sandboxer.conf
COPY ./config/apache2/conf.d/phpmyadmin.conf /etc/apache2/conf.d/phpmyadmin.conf
COPY ./config/apache2/conf.d/mpm.conf /etc/apache2/conf.d/mpm.conf
COPY ./config/apache2/httpd.conf /etc/apache2/httpd.conf

RUN mkdir /srv/sandboxer

# Make sure the user running as Apache / PHP-FPM uses same userid
# To avoid permission issues with shared volumes
RUN groupadd -g 1000 sandboxers && \
    useradd -u 1000 -g sandboxers -m sandboxer

RUN chown -R sandboxer:sandboxers \
    /var/www \
    /etc/apache2 \
    /var/log/apache2 \
    /srv/sandboxer \
    /var/run/apache2

# Suexec might be used by Apache to make sure PHP scripts are run with the rights of the owner
# rather than the web-Server user. But, it also requires Apache to start as root in order to switch user, which we are specifically trying to avoid.
# To disable it, we simply delete the file entirely so Apache cannot find it. Also, if each host runs in a container, suexec is no longer needed.
RUN rm /usr/sbin/suexec


USER sandboxer
WORKDIR /srv/sandboxer

# Ensure Apache runs in the foreground
CMD ["httpd", "-D", "FOREGROUND"]
