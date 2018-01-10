#!/usr/bin/env bash

set -e
set -u

#
# Install common packages
#

apt-get update

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    build-essential

#
# Install Docker (Ubuntu 16.04 instructions)
#

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install -y docker-ce

#
# Install docker-compose
#

curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#
# Add default user to docker group (no need to run docker and docker-compose with "sudo")
#

usermod -a -G docker ubuntu

#
# Install ansible
#

apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y ansible

#
# Install common tools
#

apt-get update

apt-get install -y \
    openjdk-8-jdk \
    maven \
    subversion \
    rpm \
    npm \
    bats \
    shellcheck

#
# Configure user
#

git config --global user.name "Your Name"
git config --global user.email "you@email.com"
