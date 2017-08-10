#!/bin/bash

set -evx

RGNAME=onss$RANDOM
VMNAME=${RGNAME}
VM2NAME=${VMNAME}2
DISKNAME=${RGNAME}
DISKSIZEGB=10
LOCATION=westus
PASSWORD=${RGNAME}aA!!!!!!
USERNAME=negat
URLBASE="https://raw.githubusercontent.com/gatneil/demos/master/onstartstop-windows"


# create VM with onstart and onstop code that write to a data disk
az group create -l ${LOCATION} -n ${RGNAME}
az vm create --resource-group ${RGNAME} --name ${VMNAME} --image MicrosoftWindowsServer:WindowsServer:2016-Datacenter:latest --authentication-type password --admin-username ${USERNAME} --admin-password $PASSWORD --nsg "" --size Standard_DS2_v2 --storage-sku Premium_LRS
az vm disk attach --resource-group ${RGNAME} --vm-name ${VMNAME} --disk ${DISKNAME} --size-gb ${DISKSIZEGB} --new
az vm extension set --publisher "Microsoft.Compute" --name "CustomScriptExtension" --resource-group ${RGNAME} --vm-name ${VMNAME} --settings "{\"fileUris\": [\"${URLBASE}/install.ps1\"], \"commandToExecute\": \"powershell -ExecutionPolicy Unrestricted -File install.ps1\"}"

exit 0

# wait a bit
sleep 30

# delete the VM
az vm delete --resource-group ${RGNAME} --name ${VMNAME} --yes

# create a new VM and attach the data disk from the previous VM to see the results
PIP=$(az vm create --resource-group ${RGNAME} --name ${VM2NAME} --image MicrosoftWindowsServer:WindowsServer:2016-Datacenter:latest --authentication-type password --admin-username ${USERNAME} --admin-password $PASSWORD --nsg "" --size Standard_DS2_v2 --storage-sku Premium_LRS | grep publicIpAddress | cut -d '"' -f 4)
az vm disk attach --resource-group ${RGNAME} --vm-name ${VM2NAME} --disk ${DISKNAME}
#cat check.sh | ssh -o "StrictHostKeyChecking no" ${USERNAME}@${PIP}
