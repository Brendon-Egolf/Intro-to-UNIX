#!/bin/bash

mkdir -p sandbox/css
mkdir -p sandbox/images
mkdir -p sandbox/scripts
touch sandbox/index.html
cp /var/www/images/logo?.png sandbox
chmod -R 444 sandbox
ls -aR sandbox > web-listing
ls /var/www/images | grep -P '\.png' > avail-images
