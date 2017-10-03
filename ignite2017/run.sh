#!/bin/bash

# assumes you are logged into az cli and have ssh keys

set -evx

rgname="ignite$RANDOM"
location="centralus"
vmsku="Standard_F1"
largevmsku="Standard_F16"
vmname="client"
vmssname="servers"
uriBase="https://raw.githubusercontent.com/gatneil/scripts/master/"

az group create --name $rgname --location $location

#az network lb create -g $rgname -n $rgname
#az network lb probe create -g $rgname --lb-name $rgname -n $rgname --port 5000 --protocol Http --path /
#az network lb rule create -g $rgname --lb-name $rgname -n $rgname --protocol Tcp --frontend-port 80 --backend-port 5000 --probe-name $rgname


az vmss create --resource-group $rgname --name $vmssname --image UbuntuLTS --instance-count 1000 --app-gateway myAppGW --app-gateway-capacity 10 --backend-port 5000 --upgrade-policy-mode Automatic --vnet-address-prefix 10.0.0.0/20 --subnet-address-prefix 10.0.0.0/21 --vm-sku $vmsku

#az vmss create --resource-group $rgname --name $vmssname --image UbuntuLTS --instance-count 10 --lb $rgname --upgrade-policy-mode Automatic --vnet-address-prefix 10.0.0.0/20 --subnet-address-prefix 10.0.0.0/21 --vm-sku $vmsku

az vmss extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group $rgname --vmss-name $vmssname --settings "{\"fileUris\": [\"https://raw.githubusercontent.com/gatneil/demos/ignite2017/ignite2017/install_ml_server.sh\"], \"commandToExecute\": \"bash install_ml_server.sh\"}"

#vmsspip=`az network public-ip show --resource-group $rgname --name myAppGwPublicIP | grep  \"ipAddress\" | cut -d "\"" -f 4`
vmsspip=`az network public-ip show --resource-group $rgname --name PublicIP${rgname} | grep  \"ipAddress\" | cut -d "\"" -f 4`

az vm create --resource-group $rgname --name $vmname --image UbuntuLTS --nsg "" --size $largevmsku
vmpip=`az network public-ip show --resource-group $rgname --name ${vmname}PublicIP | grep  \"ipAddress\" | cut -d "\"" -f 4`
az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group $rgname --vm-name $vmname --settings "{\"fileUris\": [\"https://raw.githubusercontent.com/gatneil/demos/ignite2017/ignite2017/ml_client.sh\"], \"commandToExecute\": \"bash ml_client.sh ${vmsspip} &\"}"
#ssh -o StrictHostKeyChecking=no ${vmpip} sudo tail -f /var/lib/waagent/custom-script/download/0/stdout

#az vmss create --resource-group $rgname --name $vmname --image UbuntuLTS --nsg "" --vm-sku $vmsku --instance-count 100
#az vmss extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group $rgname --vmss-name $vmname --settings "{\"fileUris\": [\"https://raw.githubusercontent.com/gatneil/demos/ignite2017/ignite2017/ml_client.sh\"], \"commandToExecute\": \"bash ml_client.sh ${vmsspip} &\"}"

