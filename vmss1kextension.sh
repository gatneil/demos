#!/bin/bash

# assumes you are logged into az cli and have ssh keys

set -evx

rgname="negat$RANDOM"
location="eastus2"
vmname="counter"
vmssname="pushers"
pubkeypath="/home/negat/.ssh/id_rsa.pub"
uriBase="https://raw.githubusercontent.com/gatneil/scripts/master/"

PATH="$PATH:/home/negat/lib/azure-cli/bin"

if [ $1 ]
then
    uriBase="$1"
fi

az group create --name $rgname --location $location
az vm create --resource-group $rgname --name $vmname --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username azureuser --ssh-key-value $pubkeypath --nsg ""

az vm extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group $rgname --vm-name $vmname --settings "{\"fileUris\": [\"${uriBase}install_count_requests.sh\"], \"commandToExecute\": \"bash install_count_requests.sh ${uriBase}\"}"

pip=`az network public-ip show --resource-group $rgname --name "$vmname"PublicIP | grep  \"ipAddress\" | cut -d "\"" -f 4`:5000

echo $pip


az vmss create --resource-group $rgname --name $vmssname --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username azureuser --ssh-key-value $pubkeypath --upgrade-policy-mode Automatic --instance-count 1000 --subnet-address-prefix '10.0.0.0/21' --app-gateway-subnet-address-prefix '10.0.255.0/24' --debug

az vmss extension set --publisher "Microsoft.Azure.Extensions" --name "CustomScript" --resource-group $rgname --vmss-name $vmssname --settings "{\"fileUris\": [\"${uriBase}checkin.sh\"], \"commandToExecute\": \"bash checkin.sh ${pip}\"}"
