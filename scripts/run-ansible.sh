#!/bin/bash

# Add SSH Key
echo "$SSH_PRIVATE_KEY" >> ~/.ssh/id_rsa

# Sleep briefly to ensure droplets come up
sleep 10

cd ansible
ansible-playbook -i inventory.ini site.yml