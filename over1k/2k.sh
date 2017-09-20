#!/bin/bash

set -evx

RGNAME="2k"$RANDOM
REGION="centralus"


az group create -l $REGION -n $RGNAME

az network vnet create -g $RGNAME -n $RGNAME --subnet-name $RGNAME --address-prefixes 10.0.0.0/16 --subnet-prefix 10.0.0.0/16

az vmss create --resource-group $RGNAME --name $RGNAME --image UbuntuLTS --instance-count 1000 --app-gateway "" --vnet-name $RGNAME --subnet $RGNAME --vm-sku Standard_F1 &
az vmss create --resource-group $RGNAME --name ${RGNAME}2 --image UbuntuLTS --instance-count 1000 --app-gateway "" --vnet-name $RGNAME --subnet $RGNAME --vm-sku Standard_F1 &
