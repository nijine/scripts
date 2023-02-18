#!/bin/bash

sudo apt update
sudo apt -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade -y

sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"

sudo apt update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -a -G docker $(whoami)
