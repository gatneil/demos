#!/bin/bash

set -evx

vm_username=$1
validator_pem_file_name=$2
validator_pem_value=$3
knife_rb=$4
trusted_cert_file_name=$5
trusted_cert_value=$6
vm_private_key=$7

homedir=/home/${vm_username}

cd ${homedir}
mkdir -p .chef
mkdir -p .chef/trusted_certs
mkdir -p .ssh

echo ${validator_pem_value} | tr '|' '\n' > .chef/${validator_pem_file_name}
echo ${knife_rb} | tr '|' '\n' | tr '%' '"' > .chef/knife.rb
echo ${trusted_cert_value} | tr '|' '\n' > .chef/trusted_certs/${trusted_cert_file_name}
echo ${vm_private_key} | tr '|' '\n' > .ssh/id_rsa

# blindly trusting install script downloaded from the internet is bad security practice;
# for production environments, we should have our own copy of this file or should
# at least verify against a checksum or the like
curl -LO https://omnitruck.chef.io/install.sh
bash ./install.sh
knife bootstrap localhost --sudo --ssh-user ${vm_username}

