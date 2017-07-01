#!/bin/bash

set -evx

RGNAME=onss$RANDOM
VMNAME=${RGNAME}
VNETNAME=vnet1
VM2NAME=${VMNAME}2
VNET2NAME=vnet2
VM3NAME=${VMNAME}3
DISKNAME=${RGNAME}
DISKSIZEGB=10
LOCATION=westus
PUBKEYPATH="/home/negat/.ssh/id_rsa.pub"
USERNAME=negat
URLBASE="https://raw.githubusercontent.com/gatneil/demos/master/appdraining-linux-inbound"


# create VM to be deleted; install onstart and onstop code;
# the onstop code will make sure we get the delay on delete;
# also install a web server that logs incoming requests to a data disk
az group create -l ${LOCATION} -n ${RGNAME}
PIP=$(az vm create --resource-group ${RGNAME} --name ${VMNAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" --vnet-name ${VNETNAME} | grep publicIpAddress | cut -d '"' -f 4)
az vm disk attach --resource-group ${RGNAME} --vm-name ${VMNAME} --disk ${DISKNAME} --size-gb ${DISKSIZEGB} --new
az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VMNAME} --settings "{\"fileUris\": [\"${URLBASE}/install.sh\"], \"commandToExecute\": \"bash install.sh ${URLBASE}\"}"

# create a VM to make connections to the other VM;
# these requests are inbound from the perspective of the VM getting deleted
az vm create --resource-group ${RGNAME} --name ${VM2NAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" --vnet-name ${VNET2NAME}
az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VM2NAME} --settings "{\"fileUris\": [\"${URLBASE}/curlserver.sh\"], \"commandToExecute\": \"bash curlserver.sh ${PIP}:5000 &\"}"

# wait a bit
sleep 30

# delete the first VM
az vm delete --resource-group ${RGNAME} --name ${VMNAME} --yes

# create a new VM and attach the data disk from the previous VM to see the results
PIP3=$(az vm create --resource-group ${RGNAME} --name ${VM3NAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" | grep publicIpAddress | cut -d '"' -f 4)
az vm disk attach --resource-group ${RGNAME} --vm-name ${VM3NAME} --disk ${DISKNAME}
cat check.sh | ssh -o "StrictHostKeyChecking no" ${USERNAME}@${PIP3}
