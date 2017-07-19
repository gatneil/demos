#!/bin/bash

set -evx

vm_username=$1
validator_pem_file_name=$2
validator_pem_value=$3
knife_rb=$4
trusted_cert_file_name=$5
trusted_cert_value=$5
private_key=$6

homedir=/home/${vm_username}

cd ${homedir}
mkdir -p .chef
mkdir -p .ssh

printf '%b' ${validator_pem_value} > .chef/${validator_pem_file_name}
printf '%b' ${knife_rb} > .chef/knife.rb
printf '%b' ${trusted_cert_value} > .chef/${trusted_cert_file_name}
printf '%b' ${private_key} > .ssh/id_rsa

# blindly trusting install script downloaded from the internet is bad security practice;
# for production environments, we should have our own copy of this file or should
# at least verify against a checksum or the like
curl -LO https://omnitruck.chef.io/install.sh
bash ./install.sh
knife bootstrap localhost --sudo --ssh-user ${vm_username}

