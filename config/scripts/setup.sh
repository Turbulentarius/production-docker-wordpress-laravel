#!/usr/bin/env bash

[ -f "/srv/sandboxer/setup-done" ] && rm "/srv/sandboxer/setup-done"

echo "Running setup..." && sleep 2

# Go to dir and run install scripts
cd /srv/exoscript

# source allows changes in sub-scripts to affect the parent (E.g. Variables accessible in parent)
# but would make it harder to "exit 0" without extra conditional logic
bash phpmyadmin-install.sh # /srv/sandboxer/phpmyadmin
bash default-vhost-install.sh # /srv/sandboxer/default

echo "Setting permissions" && sleep 2
chown -R sandboxer:sandboxers /srv/sandboxer
chmod -R 755 /srv/sandboxer


touch "/srv/sandboxer/setup-done"


echo "Setup completed!" && sleep 1
