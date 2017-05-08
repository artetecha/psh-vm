#!/usr/bin/env bash

echo "Installing Drush..."
rm -rf /opt/drush
git clone -q https://github.com/drush-ops/drush.git /opt/drush
cd /opt/drush
git checkout -q 8.1.10
composer -q install
ln -s /opt/drush/drush /usr/bin/drush
