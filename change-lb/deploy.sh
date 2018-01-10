#!/bin/bash

set -evx

RGNAME=vmsslb$RANDOM
LB1NAME=${RGNAME}1
LB2NAME=${RGNAME}2
LOCATION=westus
URLBASE="https://raw.githubusercontent.com/gatneil/demos/master/change-lb"


az group create -l ${LOCATION} -n ${RGNAME}

az network lb create -g ${RGNAME} -n ${LB1NAME}
az network lb inbound-nat-pool create -g ${RGNAME} -n ${RGNAME} --protocol Tcp --backend-port 22 --frontend-port-range-start 50000 --frontend-port-range-end 50100 --lb-name ${LB1NAME}

az network lb create -g ${RGNAME} -n ${LB2NAME}
az network lb inbound-nat-pool create -g ${RGNAME} -n ${RGNAME} --protocol Tcp --backend-port 22 --frontend-port-range-start 51000 --frontend-port-range-end 51100 --lb-name ${LB2NAME}

az vmss create --resource-group ${RGNAME} --name ${RGNAME} --image Canonical:UbuntuServer:16.04-LTS:latest --upgrade-policy-mode automatic --instance-count 2 --lb ${LB1NAME} --nsg '' --disable-overprovision

# az vmss update -g ${RGNAME} -n ${RGNAME} --set virtualMachineProfile.networkProfile.networkInterfaceConfigurations[0].loadBalancerInboundNatPools=


