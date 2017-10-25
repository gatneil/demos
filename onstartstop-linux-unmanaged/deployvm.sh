#!/bin/bash

set -evx

RGNAME=onss$RANDOM
VMNAME=${RGNAME}
VM2NAME=${VMNAME}2
DISKNAME=${RGNAME}
DISKSIZEGB=10
LOCATION=westus
PUBKEYPATH="/home/negat/.ssh/id_rsa.pub"
USERNAME=negat
URLBASE="https://raw.githubusercontent.com/gatneil/demos/master/onstartstop-linux-unmanaged"


# create VM with onstart and onstop code that write to a data disk
az group create -l ${LOCATION} -n ${RGNAME}
az vm create --resource-group ${RGNAME} --name ${VMNAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" --use-unmanaged-disk
az vm unmanaged-disk attach --resource-group ${RGNAME} --vm-name ${VMNAME} --name ${DISKNAME} --size-gb ${DISKSIZEGB} --new
az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VMNAME} --settings "{\"fileUris\": [\"${URLBASE}/install.sh\"], \"commandToExecute\": \"bash install.sh ${URLBASE}\"}"

# wait a bit
sleep 30

# delete the VM
az vm delete --resource-group ${RGNAME} --name ${VMNAME} --yes

# create a new VM and attach the data disk from the previous VM to see the results
PIP=$(az vm create --resource-group ${RGNAME} --name ${VM2NAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" --use-unmanaged-disk | grep publicIpAddress | cut -d '"' -f 4)
az vm unmanaged-disk attach --resource-group ${RGNAME} --vm-name ${VM2NAME} --name ${DISKNAME}
cat check.sh | ssh -o "StrictHostKeyChecking no" ${USERNAME}@${PIP}
