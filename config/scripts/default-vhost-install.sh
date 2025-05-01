#!/usr/bin/env bash

# If default v-host is not created we create it
[ -d "/srv/sandboxer/default" ] && echo "Default v-host already installed at /srv/sandboxer/default" && exit 0
sleep 2

echo "Create /srv/sandboxer/default" && sleep 2
mkdir -p /srv/sandboxer/default

echo "Copy files from /srv/host-www to /srv/sandboxer/default" && sleep 2
cp -r /srv/host-www/* /srv/sandboxer/default

echo "Default v-host installed. You should serve your Wordpress from /srv/sandboxer/default" && sleep 2
