RG=vmss$RANDOM
UN=azureuser
PW=${RG}!fOw9

az group create -l westus -n $RG
az group deployment create -g $RG --template-file azuredeploy1.json --parameters adminUsername=$UN adminPassword=$PW
az group deployment create -g $RG --template-file azuredeploy2.json --parameters adminUsername=$UN adminPassword=$PW
