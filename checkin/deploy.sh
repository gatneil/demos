#!/bin/bash

set -evx

RGNAME=checkin$RANDOM
VMNAME=${RGNAME}
VMSSNAME=${VMNAME}2
DISKNAME=${RGNAME}
LOCATION=westus
PUBKEYPATH="/home/negat/.ssh/id_rsa.pub"
USERNAME=negat
URLBASE="https://raw.githubusercontent.com/gatneil/demos/master/checkin"


# create a VM that will listen to checkins
az group create -l ${LOCATION} -n ${RGNAME}
PIP=$(az vm create --resource-group ${RGNAME} --name ${VMNAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" | grep publicIpAddress | cut -d '"' -f 4)
az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VMNAME} --settings "{\"fileUris\": [\"${URLBASE}/install_listener.sh\"], \"commandToExecute\": \"bash install_listener.sh ${URLBASE}\"}"


# create a VMSS that will contact the listener to checkin
az vmss create --resource-group ${RGNAME} --name ${VMSSNAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --upgrade-policy-mode Automatic
az vmss extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vmss-name ${VMSSNAME} --settings "{\"fileUris\": [\"${URLBASE}/checkin.sh\"], \"commandToExecute\": \"bash checkin.sh ${PIP}\"}"
