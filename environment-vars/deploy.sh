#!/bin/bash

set -evx

RGNAME=env$RANDOM
VMNAME=${RGNAME}
VM2NAME=${VMNAME}2
DISKNAME=${RGNAME}
DISKSIZEGB=10
LOCATION=westus
USERNAME=negat
URLBASE="https://raw.githubusercontent.com/gatneil/demos/master/environment-vars"


# create VM with onstart and onstop code that write to a data disk
az group create -l ${LOCATION} -n ${RGNAME}
az vm create --resource-group ${RGNAME} --name ${VMNAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --nsg ""
az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VMNAME} --settings "{\"fileUris\": [\"${URLBASE}/use_env_var.sh\"], \"commandToExecute\": \"bash use_env_var.sh\"}"
