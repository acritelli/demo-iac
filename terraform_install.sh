#!/bin/bash

cd /tmp

wget https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_linux_amd64.zip
unzip -o terraform_1.0.3_linux_amd64.zip
sudo mv -f terraform /bin/terraform

terraform --version
