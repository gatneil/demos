#!/bin/bash

set -evx

RGNAME=enablement$RANDOM
VMNAME=${RGNAME}
PASS="${RGNAME}aA!"
LOCATION=westus
URLBASE="https://raw.githubusercontent.com/gatneil/demos/enablement/enablement/enable.ps1"


# create VM with onstart and onstop code that write to a data disk
az group create -l ${LOCATION} -n ${RGNAME}
az vm create --resource-group ${RGNAME} --name ${VMNAME} --image MicrosoftWindowsServer:WindowsServer:2016-Datacenter:latest --password $PASS --nsg ""
az vm extension set --publisher "Microsoft.Compute" --name "CustomScriptExtension" --resource-group ${RGNAME} --vm-name ${VMNAME} --settings "{\"fileUris\": [\"${URLBASE}\"], \"commandToExecute\": \"powershell -ExecutionPolicy Unrestricted -File enable.ps1\"}"
