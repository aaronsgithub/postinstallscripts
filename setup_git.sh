#!/usr/bin/env bash


if [ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get update
  sudo apt-get install -y git
fi

git config --global user.name "Aaron"
git config --global user.email "aaronsgithub@users.noreply.github.com"

