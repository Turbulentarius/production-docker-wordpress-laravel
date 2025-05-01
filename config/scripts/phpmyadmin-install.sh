#!/usr/bin/env bash

# Only run install script if phpMyAdmin is not installed
[ -d "/srv/sandboxer/phpmyadmin" ] && echo "phpMyAdmin is already installed." && sleep 2 && exit 0

echo "Downloading phpMyAdmin and installing..." && sleep 2
cd /
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip
unzip -d /srv/sandboxer phpMyAdmin-5.2.1-all-languages.zip
mv /srv/sandboxer/phpMyAdmin-5.2.1-all-languages /srv/sandboxer/phpmyadmin
mv /config.inc.php /srv/sandboxer/phpmyadmin
echo "phpMyAdmin has been installed." && sleep 2
cd /srv/sandboxer
