#!/bin/bash

set -evx

RGNAME=appdr$RANDOM
VMNAME=${RGNAME}
VNETNAME=vnet1
VM2NAME=${VMNAME}2
VNET2NAME=vnet2
DISKNAME=${RGNAME}
DISKSIZEGB=10
LOCATION=westus
PUBKEYPATH="/home/negat/.ssh/id_rsa.pub"
USERNAME=negat
URLBASE="https://raw.githubusercontent.com/gatneil/demos/master/appdraining-linux-outbound"


# create VM with a webserver that logs incoming requests
az group create -l ${LOCATION} -n ${RGNAME}
PIP=$(az vm create --resource-group ${RGNAME} --name ${VMNAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" --vnet-name ${VNETNAME} | grep publicIpAddress | cut -d '"' -f 4)
az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VMNAME} --settings "{\"fileUris\": [\"${URLBASE}/installwebserver.sh\"], \"commandToExecute\": \"bash installwebserver.sh ${URLBASE}\"}"

# create a VM to be deleted that will make outbound connections to the other VM
az vm create --resource-group ${RGNAME} --name ${VM2NAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" --vnet-name ${VNET2NAME}
az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VM2NAME} --settings "{\"fileUris\": [\"${URLBASE}/installonstartstop.sh\"], \"commandToExecute\": \"bash installonstartstop.sh ${PIP}:5000\"}"

# wait a bit
#sleep 30

# delete the VM
#az vm delete --resource-group ${RGNAME} --name ${VMNAME} --yes

# create a new VM and attach the data disk from the previous VM to see the results
#PIP=$(az vm create --resource-group ${RGNAME} --name ${VM2NAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" | grep publicIpAddress | cut -d '"' -f 4)
#az vm disk attach --resource-group ${RGNAME} --vm-name ${VM2NAME} --disk ${DISKNAME}
#cat check.sh | ssh -o "StrictHostKeyChecking no" ${USERNAME}@${PIP}
