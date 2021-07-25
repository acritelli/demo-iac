#!/bin/bash

current_directory=$(pwd)

echo $current_directory

cd /tmp

rm *do-ansible-inventory*

wget https://github.com/do-community/do-ansible-inventory/releases/download/v2.0.0/do-ansible-inventory_2.0.0_linux_x86_64.tar.gz

tar -xf do-ansible-inventory_2.0.0_linux_x86_64.tar.gz
sudo mv -f do-ansible-inventory /bin/

do-ansible-inventory -t $DO_TOKEN --ignore tf-www.acritelli.com --no-group-by-region --no-group-by-project

cd $current_directory
pwd
