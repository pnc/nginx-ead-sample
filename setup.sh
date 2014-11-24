#!/bin/bash

# exit if any command fails
set -e

# Refresh package lists
apt-get update
# apt-get (quietly) (answering yes to all questions)
# install nginx and nginx-extras packages
apt-get -q -y install nginx nginx-extras

# Copy our samples into the web directory
cp sample.xsl /usr/share/nginx/html/
cp syr-aaie.xml /usr/share/nginx/html/

# Copy our configuration file into place
cp default-site.conf /etc/nginx/sites-available/default

# Reload nginx so it uses the new configuration
/etc/init.d/nginx reload
