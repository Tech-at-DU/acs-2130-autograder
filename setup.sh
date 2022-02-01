#!/usr/bin/env bash

# Install Gradescope dependencies:
apt-get install -y python3 python3-pip python3-dev

# Create .ssh directory and copy config files:
mkdir -p /root/.ssh
cp ssh_config /root/.ssh/config

# Make sure to include your private key here:
cp deploy_key /root/.ssh/deploy_key

# To prevent host key verification errors at runtime:
ssh-keyscan -t rsa github.com >>~/.ssh/known_hosts

# Clone autograder repository from GitHub:
git clone git@github.com:droxey/tweet-generator-autograder /autograder/src

# Install the requirements from this repository:
pip3 install -r /autograder/src/requirements.txt
