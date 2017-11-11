#!/bin/bash

#set -evx

RGNAME=standardlb$RANDOM
VMSSNAME=${RGNAME}
VMSSZONES="1 2 3"
#VMSSZONES="1"
PIPZONE=1
PIPNAME=${RGNAME}
LBNAME=${RGNAME}
NATPOOLNAME=${RGNAME}
NSGNAME=${RGNAME}
NSGRULE1NAME=${NSGNAME}1
NSGRULE2NAME=${NSGNAME}2
LBNAME=${RGNAME}
LOCATION=eastus2euap
IC=3
IMAGE=UbuntuLTS
URLBASE="https://raw.githubusercontent.com/gatneil/demos/master/zones/standard_lb"

az group create -l ${LOCATION} -n ${RGNAME}
PIP=$(az network public-ip create -n ${PIPNAME} -g ${RGNAME} --sku Standard | grep ipAddress | cut -d '"' -f 4)
az network nsg create -g ${RGNAME} -n ${NSGNAME} -l ${LOCATION}
az network nsg rule create -n ${NSGRULE1NAME} --nsg-name ${NSGNAME} --priority 100 -g ${RGNAME} --access Allow --direction Inbound --protocol '*' --destination-port-ranges '*'
az network nsg rule create -n ${NSGRULE2NAME} --nsg-name ${NSGNAME} --priority 101 -g ${RGNAME} --access Allow --direction Outbound --protocol '*' --destination-port-ranges '*'
az network lb create -n ${LBNAME} -g ${RGNAME} --public-ip-address ${PIPNAME} --sku Standard
az network lb rule create --backend-port 5000 --frontend-port 80 --lb-name ${LBNAME} -n ${LBNAME} --protocol Tcp -g ${RGNAME}
#az network lb rule create --backend-port 22 --frontend-port 22 --lb-name ${LBNAME} -n ${LBNAME} --protocol Tcp -g ${RGNAME}

#az vmss create -n ${VMSSNAME} -g ${RGNAME} --instance-count ${IC} --image ${IMAGE} --single-placement-group true --upgrade-policy-mode Automatic --zones ${VMSSZONES} --lb ""

#az vmss create -n ${VMSSNAME} -g ${RGNAME} --instance-count ${IC} --image ${IMAGE} --single-placement-group true --upgrade-policy-mode Automatic --public-ip-address ${PIPNAME} --lb-sku Standard ${VMSSZONES} --nsg ${NSGNAME}

#az vmss create -n ${VMSSNAME} -g ${RGNAME} --instance-count ${IC} --image ${IMAGE} --single-placement-group true --upgrade-policy-mode Automatic --public-ip-address ${PIPNAME} --lb-sku Standard --nsg ${NSGNAME}

SUBID=$(az vmss create -n ${VMSSNAME} -g ${RGNAME} --instance-count ${IC} --image ${IMAGE} --single-placement-group true --upgrade-policy-mode Automatic --lb ${LBNAME} --nsg ${NSGNAME} | grep subscriptions | head -n 1 | cut -d '/' -f 3)

az vmss extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vmss-name ${VMSSNAME} --settings "{\"fileUris\": [\"${URLBASE}/installserver.sh\"], \"commandToExecute\": \"bash installserver.sh ${URLBASE}\"}"

az group deployment create -g ${RGNAME} --template-file autoscale.json --parameters vmssId=/subscriptions/${SUBID}/resourceGroups/${RGNAME}/providers/Microsoft.Compute/virtualMachineScaleSets/${VMSSNAME}

while [ 1 == 1 ]
do
    curl -s ${PIP} &
    sleep 1
done


#rm out.txt
#touch out.txt

#while [ 1 == 1 ]
#do
#    ssh -o StrictHostKeyChecking=no ${PIP} 'for i in {0..20000..1}; do x=`expr $x + 1`; done &' >> out.txt
#    sleep 2
#done


#az vmss create -n ${VMSSNAME} -g ${RGNAME} --instance-count ${IC} --image ${IMAGE} --single-placement-group true --upgrade-policy-mode Automatic --public-ip-address ${PIPNAME} --lb-sku Basic --nsg ${NSGNAME}

#az vm create -n ${VMSSNAME} -g ${RGNAME} --image ${IMAGE} --public-ip-address ${PIPNAME} --zone "1" --nsg ${NSGNAME}


#az vmss extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group ${RGNAME} --vmss-name ${VMSSNAME} --settings "{\"fileUris\": [\"${URLBASE}/installserver.sh\"], \"commandToExecute\": \"bash installserver.sh ${URLBASE}\"}"


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
