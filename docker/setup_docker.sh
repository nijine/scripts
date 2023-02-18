#!/usr/bin/env bash

set -e

sudo apt update
sudo apt -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade -y

sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

sudo apt update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

read -p "Do you want to add a user to the docker group? [y/n/username]" USER_ACTION

# FIXME: think this might be missing brackets
if [ "$USER_ACTION" == "y" ]; then
    sudo usermod -a -G docker $USER
elif [ "$USER_ACTION" == "n" ]; then
    exit 0
else
    sudo usermod -a -G docker $USER_ACTION
fi
