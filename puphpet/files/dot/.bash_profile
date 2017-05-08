# Platform.sh CLI configuration.
source ~/.platformshrc

# Make sure Git identity is always correct according to .idrc.
if [ -f /vagrant/.idrc ]; then
  source /vagrant/.idrc
  git config --global user.name "${NAME}"
  git config --global user.email "${EMAIL}"
fi

# Allow users of the VM to have custom configs that are not provisioned
# and will not be overridden by the provisioning.
if [ -f /vagrant/.bash_user_profile ]; then
  source /vagrant/.bash_user_profile
fi

# Add custom binary paths.
PATH=$PATH:$HOME/bin:$HOME/.composer/vendor/bin:/opt/psh/cli/bin
export PATH

# Global gitignore.
git config --global core.excludesfile /vagrant/etc/config/gitignore_global

# Load remaining bash config.
source ~/.bashrc
