#!/usr/bin/env bash

# Update Nginx config.
rm -f /etc/nginx/sites-enabled/*
cp -f /vagrant/etc/config/nginx-local-bc.conf /etc/nginx/sites-available/
ln -sf /etc/nginx/sites-available/nginx-local-bc.conf /etc/nginx/sites-enabled/00-nginx-local-bc.conf
service nginx restart
