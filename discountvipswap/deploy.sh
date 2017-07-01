#!/bin/bash

# assumes you are logged into az cli and have ssh keys

set -evx

rgname="nsglbswap$RANDOM"
location="eastus2"
vmssname="myvmss"
vmss2name=${vmssname}2
lbname="mylb"
lb2name=${lbname}2
vnetname="myvnet"
subnetname="mysubnet"
pubkeypath="/home/negat/.ssh/id_rsa.pub"
uriBase="https://raw.githubusercontent.com/gatneil/demos/master/discountvipswap"
username="negat"

az group create -l ${location} -n ${rgname}

# create 2 scale sets, each with a load balancer; one with Static public IP
az network lb create -g ${rgname} -n ${lbname} --vnet-name ${vnetname} --subnet ${subnetname} --public-ip-address-allocation Static
az network lb create -g ${rgname} -n ${lb2name} --vnet-name ${vnetname} --subnet ${subnetname} --public-ip-address ""
az vmss create --resource-group $rgname --name $vmssname --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${username} --ssh-key-value $pubkeypath --upgrade-policy-mode Automatic --instance-count 2 --vnet-name ${vnetname} --subnet ${subnetname} --lb ${lbname}
az vmss create --resource-group $rgname --name $vmss2name --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${username} --ssh-key-value $pubkeypath --upgrade-policy-mode Automatic --instance-count 2 --vnet-name ${vnetname} --subnet ${subnetname} --lb ${lb2name}

python discountvipswap.py --src_lb_rg $rgname --src_lb_name $lbname --dest_lb_rg $rgname --dest_lb_name $lb2name

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
