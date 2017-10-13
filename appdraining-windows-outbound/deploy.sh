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
PASSWORD=${RGNAME}aA!!!!!!
USERNAME=negat
URLBASE="https://raw.githubusercontent.com/gatneil/demos/master/appdraining-windows-outbound"


# create VM with a webserver that logs incoming requests
az group create -l ${LOCATION} -n ${RGNAME}
PIP=$(az vm create --resource-group ${RGNAME} --name ${VMNAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" --vnet-name ${VNETNAME} | grep publicIpAddress | cut -d '"' -f 4)
az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VMNAME} --settings "{\"fileUris\": [\"${URLBASE}/installwebserver.sh\"], \"commandToExecute\": \"bash installwebserver.sh ${URLBASE}\"}"

# create a VM to be deleted that will make outbound connections to the other VM
az vm create --resource-group ${RGNAME} --name ${VM2NAME} --image MicrosoftWindowsServer:WindowsServer:2016-Datacenter:latest --authentication-type password --admin-username ${USERNAME} --admin-password $PASSWORD --nsg "" --size Standard_DS2_v2 --storage-sku Premium_LRS --vnet-name ${VNET2NAME}
az vm extension set --publisher "Microsoft.Compute" --name "CustomScriptExtension" --resource-group ${RGNAME} --vm-name ${VM2NAME} --settings "{\"fileUris\": [\"${URLBASE}/install.ps1\"], \"commandToExecute\": \"powershell -ExecutionPolicy Unrestricted -File install.ps1 http://${PIP}:5000\"}"

# wait a bit
sleep 30

# delete the VM
az vm delete --resource-group ${RGNAME} --name ${VM2NAME} --yes

# check the webserver logs to see the results
cat check.sh | ssh -o "StrictHostKeyChecking no" ${USERNAME}@${PIP}
