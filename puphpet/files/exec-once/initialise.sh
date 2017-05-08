#!/usr/bin/env bash

# Set up FUSE group for Vagrant user.
usermod -a -G fuse vagrant

# Configure FUSE so that SSHFS mounts can be accessed by
# users other than the owner of the mount.
echo "user_allow_other" >> /etc/fuse.conf

# Nginx config.
rm -f /etc/nginx/sites-enabled/*
cp -f /vagrant/etc/config/nginx-local-bc.conf /etc/nginx/sites-available/
ln -sf /etc/nginx/sites-available/nginx-local-bc.conf /etc/nginx/sites-enabled/00-nginx-local-bc.conf
# Restart nginx
service nginx restart

# Make /app/private
mkdir -p /app/private
chown vagrant:www-data /app/private
chmod 775 /app/private

# Make /opt/psh
mkdir -p /opt/psh
