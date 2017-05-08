#!/usr/bin/env bash

# Install SSH Keys.
cp /vagrant/puphpet/files/dot/ssh/config ~/.ssh
chmod 400 ~/.ssh/config

# Configure Git identity
if [ -f /vagrant/.idrc ]; then
  source /vagrant/.idrc
  git config --global user.name "${NAME}"
  git config --global user.email "${EMAIL}"
fi

# Global gitignore.
git config --global core.excludesfile /vagrant/etc/config/gitignore_global

# Command autocompletion for 'platform'
mkdir ~/.platformsh
/opt/psh/cli/bin/platform self:install -y -q
