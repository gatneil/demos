Get started with Chef on Azure
==============================

# Overview

This article shows how to get started with Chef on Azure. At a high level, this has the following steps:

* [Create our Chef server](#Create-our-Chef-server). We will deploy this server using the [Azure Portal](portal.azure.com).

* Create our Chef workstation. We will use the Azure CLI 2.0 to deploy an Ubuntu virtual machine as our Chef workstation. We will then run a script via ssh to configure this workstation and make some modifications to the Chef server.

* Create our Chef client and configure using ssh. We will use Azure CLI 2.0 to deploy an Ubuntu virtual machine as our Chef clien, then make a `knife bootstrap` call from the Chef workstation to configure the client. This method of configuring the Chef client should be familiar to Chef users, even those not used to Azure.

* Create our Chef client and configure using an Azure Virtual Machine Extension. This method of configuring the Chef client utilizes Azure's notion of a VM model and sets us up nicely for our next step:

* Create a cluster of Chef clients. We will use Azure CLI 2.0 to deploy an Ubuntu-based virtual machine scale set and use an extension to configure all of these VMs as Chef clients. Using a scale set with an extension allows us to deploy and manage a cluster of similarly-configured VMs at scale.

## Create our Chef server

In the [Azure Portal](portal.azure.com), create a `Chef Automate` server:

![chef_automate_portal_img](https://raw.githubusercontent.com/gatneil/demos/chef/img/chef_automate_portal.jpg).

Once we finish the create wizard and the deployment completes, click on the `Deployments` link within the `Resource Group` view to see the list of deployments:

![chef_automate_deployments_img](https://raw.githubusercontent.com/gatneil/demos/chef/img/deployments.jpg)

Then click on the top deployment and find the `FQDN` output:

![chef_automate_deployments_img](https://raw.githubusercontent.com/gatneil/demos/chef/img/ChefAutomateUrl.jpg)

Navigate to this URL in our browser and fill out the form, leaving the RSA key pair blank, un-checking the option to create a support account, and checking the EULA checkbox:

![biscotti](https://raw.githubusercontent.com/gatneil/demos/chef/img/biscotti.PNG)

Click the "Setup Chef Automate & Download Starter Kit" button. We should see a confirmation screen like the one below. We should also notice a download initiated for a zip file. This zip file contains keys and certificates that we will use to configure our workstation to connect to this server.

![chef_setup_confirmation](https://raw.githubusercontent.com/gatneil/demos/chef/img/chef_setup_confirmation.PNG)

Click "Login to Chef Automate" to get to the login screen for Chef Automate:

![login_automate](https://raw.githubusercontent.com/gatneil/demos/chef/img/login_automate.PNG)

Login with the username and password we specified previously. If we see the screen below (or a similar one), we have successfully logged in:

![successful_login](https://raw.githubusercontent.com/gatneil/demos/chef/img/successful_login.PNG)

## Create and configure our Chef workstation

First, we create a resource group and a VM for our chef workstation. Here are example commands and output for doing so:

```bash
localmachine:~$ az group create --name chefworkstation --location westus
{
  "id": "/subscriptions/OUR_SUBSCRIPTION_ID/resourceGroups/chefworkstation",
  "location": "westus",
  "managedBy": null,
  "name": "chefworkstation",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null
}

localmachine:~$ az vm create --resource-group chefworkstation --name chefworkstation --image UbuntuLTS --admin-username OUR_USERNAME_HERE --authentication-type password --admin-password OUR_PASSWORD_HERE
{
  "fqdns": "",
  "id": "/subscriptions/OUR_SUBSCRIPTION_ID/resourceGroups/chef/providers/Microsoft.Compute/virtualMachines/test",
  "location": "westus",
  "macAddress": "00-0D-3A-36-FC-3D",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.5",
  "publicIpAddress": "OUR_WORKSTATION_PUBLIC_IP_ADDRESS",
  "resourceGroup": "chefworkstation"
}
```

Next we scp the starter kit we downloaded from the Chef server up to the workstation then ssh into the workstation:
```
localmachine:~$ scp starter_kit.zip OUR_USERNAME@YOUR_WORKSTATION_PUBLIC_IP_ADDRESS:~/
localmachine:~$ ssh YOUR_USERNAME@OUR_WORKSTATION_PUBLIC_IP_ADDRESS
```

We then unzip the starter kit:

```
chefworkstation:~$ sudo apt update --yes && sudo apt install unzip --yes
chefworkstation:~$ unzip starter_kit.zip
```

We should now see a directory called `chef-repo`. We will use this as our working directory for running `knife` commands:

```
chefworkstation:~$ ls
chef-repo
chefworkstation:~$ cd chef-repo/
```

Note: if we do an `ls` in the chef-repo directory, we won't see any files. This is because the configuration lives within the `.chef` hidden directory; to see this directory and its contents, run `ls -a`. Next we download the Chef omnitrick installer and run it to install the ChefDK. For simplicity of this article, we don't validate the integrity of the install script, but for production environments we should verify the install script for security reasons.

```
chefworkstation:~/chef-repo$ curl -LO https://omnitruck.chef.io/install.sh
chefworkstation:~/chef-repo$ sudo bash ./install.sh
```

Once this is complete, we should be able to run `knife` commands from the `chef-repo` directory. To verify that our workstation is able to communicate with our Chef server, we run `knife ssl fetch`. If we see output similar to below, we have successfully configured our workstation.

```
chefworkstation:~/chef-repo$ knife ssl fetch
WARNING: Certificates from *** will be fetched and placed in your trusted_cert
directory (***).

Knife has no means to verify these are the correct certificates. You should
verify the authenticity of these certificates after downloading.

Adding certificate for *** in ***
```


## Create our Chef client and configure using ssh
