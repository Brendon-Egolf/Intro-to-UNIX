#!/bin/bash

mkdir -p sandbox/css
mkdir -p sandbox/images
mkdir -p sandbox/scripts
touch sandbox/index.html
cp sandbox/var/www/images/logo1.png sandbox
cp sandbox/var/www/images/logo2.png sandbox
chmod -R 444 sandbox
ls -aR sandbox > web-listing
ls sandbox/var/www/images | grep -P '\.png' > avail-images
