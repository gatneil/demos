#!/bin/bash

set -evx

RGNAME=standardlb$RANDOM
VMSSNAME=${RGNAME}
VMSSZONES="1 2 3"
PIPZONE=1
PIPNAME=${RGNAME}
LBNAME=${RGNAME}
LOCATION=eastus2euap
IC=3
IMAGE=UbuntuLTS
URLBASE="https://raw.githubusercontent.com/gatneil/demos/master/zones/standard_lb"

az group create -l ${LOCATION} -n ${RGNAME}
az network public-ip create -n ${PIPNAME} -g ${RGNAME} --sku Standard
az network lb create -n ${LBNAME} -g ${RGNAME} --public-ip-address ${PIPNAME} --sku Standard
az vmss create -n ${VMSSNAME} -g ${RGNAME} --instance-count ${IC} --image ${IMAGE} --load-balancer ${LBNAME} --zones ${VMSSZONES} --single-placement-group true --upgrade-policy-mode Automatic
az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VM2NAME} --settings "{\"fileUris\": [\"${URLBASE}/installserver.sh\"], \"commandToExecute\": \"bash installserver.sh ${URLBASE}\"}"


# create VM to be deleted; install onstart and onstop code; also put behind LB
# the onstop code will make sure we get the delay on delete;
# also install a web server that logs incoming requests to a data disk
#az group create -l ${LOCATION} -n ${RGNAME}
#az group deployment create -g ${RGNAME} --template-file azuredeploy.json --parameters name=${RGNAME} adminUsername=negat adminPassword=${PASSWORD}
#PIP=$(az network public-ip show -g ${RGNAME} -n ${RGNAME} | grep ipAddress | cut -d '"' -f 4)
#az vm disk attach --resource-group ${RGNAME} --vm-name ${VMNAME} --disk ${DISKNAME} --size-gb ${DISKSIZEGB} --new
#az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VMNAME} --settings "{\"fileUris\": [\"${URLBASE}/install.sh\"], \"commandToExecute\": \"bash install.sh ${URLBASE}\"}"

# create a VM to make connections to the other VM through the LB;
# these requests are inbound from the perspective of the VM getting deleted
#az vm create --resource-group ${RGNAME} --name ${VM2NAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" --vnet-name ${VNET2NAME}
#az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vm-name ${VM2NAME} --settings "{\"fileUris\": [\"${URLBASE}/curlserver.sh\"], \"commandToExecute\": \"bash curlserver.sh ${PIP}:5000 &\"}"

# wait a bit
#sleep 30

# delete the first VM
#az vm delete --resource-group ${RGNAME} --name ${VMNAME} --yes

# create a new VM and attach the data disk from the previous VM to see the results
#PIP3=$(az vm create --resource-group ${RGNAME} --name ${VM3NAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg "" | grep publicIpAddress | cut -d '"' -f 4)
#az vm disk attach --resource-group ${RGNAME} --vm-name ${VM3NAME} --disk ${DISKNAME}
#cat check.sh | ssh -o "StrictHostKeyChecking no" ${USERNAME}@${PIP3}
