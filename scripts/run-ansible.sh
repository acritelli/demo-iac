#!/bin/bash

# Add SSH Key
mkdir -p ~/.ssh
echo "$SSH_PRIVATE_KEY" >> ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa

# Sleep briefly to ensure droplets come up
sleep 10

cd ansible
ansible-playbook -i inventory.ini site.yml
