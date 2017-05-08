#!/usr/bin/env bash

echo "Installing Platformsh CLI..."
rm -rf /opt/psh/cli
git clone -q https://github.com/artetecha/platformsh-cli.git /opt/psh/cli
cd /opt/psh/cli
git checkout -q __stable
composer -q install
