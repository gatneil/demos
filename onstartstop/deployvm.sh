#!/bin/bash

set -evx

RGNAME=onss$RANDOM
VMNAME=${RGNAME}
DISKNAME=${RGNAME}
DISKSIZEGB=10
LOCATION=westus
PUBKEYPATH="/home/negat/.ssh/id_rsa.pub"
USERNAME=negat

az group create -l ${LOCATION} -n ${RGNAME}
az vm create --resource-group ${RGNAME} --name ${VMNAME} --image Canonical:UbuntuServer:16.04-LTS:latest --admin-username ${USERNAME} --ssh-key-value $PUBKEYPATH --nsg ""
az vm disk attach --resource-group ${RGNAME} --vm-name ${VMNAME} --disk ${DISKNAME} --size-gb ${DISKSIZEGB} --new
