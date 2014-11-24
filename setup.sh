#!/bin/bash

# exit if any command fails
set -e

# Refresh package lists
apt-get update
# use the system package manager, apt-get to
# (-q quietly) (-y answering yes to all questions)
# install nginx (a robust, fast web server)
# install nginx-extras (which contains the XSLT processing module)
apt-get -q -y install nginx nginx-extras

# Copy our configuration file into place
cp default-site.conf /etc/nginx/sites-available/default

# Reload nginx so it uses the new configuration
/etc/init.d/nginx reload
