#!/bin/bash


git clone https://github.com/express42/reddit.git /var/www/app
cd /var/www/app && bundle install
puma -d

