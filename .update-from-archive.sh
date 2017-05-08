#!/usr/bin/env bash

if [ -d "${1}" ]; then
  cp ${1}/Vagrantfile .
  cp ${1}/.gitattributes .
  cp ${1}/puphpet/config.yaml ./puphpet/
  rm -rf ./puphpet/{puppet,ruby,vagrant}
  cp -r ${1}/puphpet/{puppet,ruby,vagrant} ./puphpet/
  cp -r ${1}/puphpet/files/dot/ssh/insecure_private_key ./puphpet/files/dot/ssh/
  cp -r ${1}/puphpet/shell/*.sh  ./puphpet/shell/
  patch -p0 < patches/vagrantfile-local-psh.diff 
fi
