#!/bin/bash

# assumes you are logged into az cli and have ssh keys

set -evx

rgname="nsglbswap$RANDOM"
location="eastus2"
vmssname="myvmss"
vmss2name=${vmssname}2
pubkeypath="/home/negat/.ssh/id_rsa.pub"
uriBase="https://raw.githubusercontent.com/gatneil/demos/master/vmsslbswap"
username="negat"

az group create -l ${location} -n ${rgname}

# create 2 scale sets: 1 with LB, 1 without
az vmss create --resource-group $rgname --name $vmssname --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${username} --ssh-key-value $pubkeypath --upgrade-policy-mode Automatic --instance-count 2
az vmss create --resource-group $rgname --name $vmss2name --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${username} --ssh-key-value $pubkeypath --upgrade-policy-mode Automatic --instance-count 2 --lb ""

python swaplb.py --src_vmss_rg $rgname --src_vmss_name $vmssname --dest_vmss_rg $rgname --dest_vmss_name $vmss2name

# get the name of the LB on the first scale set
#lbname=$(az vmss show -g nsgvmss -n nsgvmss --output json | grep "/backendAddressPools" | cut -d "/" -f 9)

#echo "DATETIME BEFORE SWAPPING LB"
#date

# This may look like it's trying to create a new scale set
# but based on the current implementation,
# this will actually remove the LB from the first scale set without deploying anything new.
# This is not guaranteed by the command though and could easily change in the future,
# so please don't take a dependency on this behavior; it just makes this demo easier ;)
#az vmss create --resource-group $rgname --name $vmssname --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${username} --ssh-key-value $pubkeypath --upgrade-policy-mode Automatic --instance-count 2 --lb ""

# add the LB to the second scale set
#az vmss create --resource-group $rgname --name $vmss2name --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${username} --ssh-key-value $pubkeypath --upgrade-policy-mode Automatic --instance-count 2 --lb ${lbname}

#echo "DATETIME AFTER SWAPPING LB"
#date
