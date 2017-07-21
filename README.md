Get started with Chef on Azure
==============================

# Overview

This article shows how to get started with Chef on Azure. At a high level, this has the following steps:

* Create our Chef server. We will deploy this server using the [Azure Portal](portal.azure.com).

* Create our Chef workstation. We will use the Azure CLI 2.0 to deploy an Ubuntu virtual machine as our Chef workstation. We will then run a script via ssh to configure this workstation and make some modifications to the Chef server.

* Create our Chef client and configure using ssh. We will use Azure CLI 2.0 to deploy an Ubuntu virtual machine as our Chef client, then make a `knife bootstrap` call from the Chef workstation to configure the client. This method of configuring the Chef client should be familiar to Chef users, even those not used to Azure.

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

localmachine:~$ az vm create --resource-group chefworkstation --name chefworkstation --image UbuntuLTS --admin-username OUR_USERNAME_HERE
{
  "fqdns": "",
  "id": "/subscriptions/OUR_SUBSCRIPTION_ID/resourceGroups/chef/providers/Microsoft.Compute/virtualMachines/chefworkstation",
  "location": "westus",
  "macAddress": "00-0D-3A-36-FC-3D",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.5",
  "publicIpAddress": "OUR_WORKSTATION_PUBLIC_IP_ADDRESS",
  "resourceGroup": "chefworkstation"
}
```

Note that the `az vm create` command above adds `~/.ssh/id_rsa.pub` from the local machine to the `authorized_keys` for the workstation. Thus, we will be able to ssh into the workstation using the default `~/.ssh/id_rsa` private key.

Next we scp the starter kit we downloaded from the Chef server up to the workstation then ssh into the workstation:
```bash
localmachine:~$ scp starter_kit.zip OUR_USERNAME@YOUR_WORKSTATION_PUBLIC_IP_ADDRESS:~/
localmachine:~$ ssh YOUR_USERNAME@OUR_WORKSTATION_PUBLIC_IP_ADDRESS
```

We then unzip the starter kit:

```bash
chefworkstation:~$ sudo apt update --yes && sudo apt install unzip --yes
chefworkstation:~$ unzip starter_kit.zip
```

We should now see a directory called `chef-repo`. We will use this as our working directory for running `knife` commands:

```bash
chefworkstation:~$ ls
chef-repo
chefworkstation:~$ cd chef-repo/
```

Note: if we do an `ls` in the chef-repo directory, we won't see any files. This is because the configuration lives within the `.chef` hidden directory; to see this directory and its contents, run `ls -a`. Next we download the Chef omnitrick installer and run it to install the ChefDK. For simplicity of this article, we don't validate the integrity of the install script, but for production environments we should verify the install script for security reasons.

```bash
chefworkstation:~/chef-repo$ curl -LO https://omnitruck.chef.io/install.sh
chefworkstation:~/chef-repo$ sudo bash ./install.sh
```

Once this is complete, we should be able to run `knife` commands from the `chef-repo` directory. To verify that our workstation is able to communicate with our Chef server, we run `knife ssl fetch`. If we see output similar to below, we have successfully configured our workstation.

```bash
chefworkstation:~/chef-repo$ knife ssl fetch
WARNING: Certificates from *** will be fetched and placed in your trusted_cert
directory (***).

Knife has no means to verify these are the correct certificates. You should
verify the authenticity of these certificates after downloading.

Adding certificate for *** in ***
```

While we are here, we should also create a `.ssh` directory in case it doesn't already exist. This will be useful later on when we add a private key to this directory that will give this workstation access to the Chef client machine:

```bash
chefworkstation:~/chef-repo$ mkdir -p ~/.ssh
```


## Create our Chef client and configure using ssh

Back on our local machine, we create a resource group and a VM for our chef client. Here are example commands and output for doing so:

```bash
localmachine:~$ az group create --name chefclient --location westus
{
  "id": "/subscriptions/OUR_SUBSCRIPTION_ID/resourceGroups/chefclient",
  "location": "westus",
  "managedBy": null,
  "name": "chefclient",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null
}

localmachine:~$ az vm create --resource-group chefclient --name chefclient --image UbuntuLTS --admin-username OUR_USERNAME_HERE
{
  "fqdns": "",
  "id": "/subscriptions/OUR_SUBSCRIPTION_ID/resourceGroups/chefclient/providers/Microsoft.Compute/virtualMachines/chefclient",
  "location": "westus",
  "macAddress": "00-0D-3A-36-FC-3D",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.5",
  "publicIpAddress": "OUR_CLIENT_PUBLIC_IP_ADDRESS",
  "resourceGroup": "chefclient"
}
```

As described earlier, the `az vm create` command above adds `~/.ssh/id_rsa.pub` from the local machine to the `authorized_keys` for the Chef client machine. We will need to give the workstation the ability to ssh to this client machine, so we scp the `~/.ssh/id_rsa` private key from the local machine to `~/.ssh/id_rsa` on the workstation:

```
localmachine:~$ scp  ~/.ssh/id_rsa OUR_USERNAME@OUR_WORKSTATION_PUBLIC_IP_ADDRESS:~/.ssh/
```

Then we ssh into the workstation machine and run the `knife bootstrap` command **from the ~/chef-repo directory** to bootstrap our client machine:

```bash
localmachine:~$ ssh OUR_USERNAME@OUR_WORKSTATION_PUBLIC_IP_ADDRESS
chefworkstation:~/$ cd chef-repo
chefworkstation:~/chef-repo$ knife bootstrap OUR_CLIENT_PUBLIC_IP_ADDRESS --sudo --ssh-user YOUR_USERNAME

Doing old-style registration with the validation key at ***...
Delete your validation key in order to use your user credentials instead

Connecting to ***
*** -----> Installing Chef Omnibus (-v 13)
*** downloading https://omnitruck-direct.chef.io/chef/install.sh
***   to file /tmp/install.sh.1880/install.sh
*** trying wget...
*** ubuntu 16.04 x86_64
*** Getting information for chef stable 13 for ubuntu...
*** downloading https://omnitruck-direct.chef.io/stable/chef/metadata?v=13&p=ubuntu&pv=16.04&m=x86_64
***   to file /tmp/install.sh.1885/metadata.txt
*** trying wget...
*** sha1       ***
*** sha256     ***
*** url        https://packages.chef.io/files/stable/chef/13.2.20/ubuntu/16.04/chef_13.2.20-1_amd64.deb
*** version    13.2.20
*** downloaded metadata file looks valid...
*** downloading https://packages.chef.io/files/stable/chef/13.2.20/ubuntu/16.04/chef_13.2.20-1_amd64.deb
***   to file /tmp/install.sh.1885/chef_13.2.20-1_amd64.deb
*** trying wget...
*** Comparing checksum with sha256sum...
*** Installing chef 13
*** installing with dpkg...
*** Selecting previously unselected package chef.
(Reading database ... 61470 files and directories currently installed.)
*** Preparing to unpack .../chef_13.2.20-1_amd64.deb ...
*** Unpacking chef (13.2.20-1) ...
*** Setting up chef (13.2.20-1) ...
*** Thank you for installing Chef!
*** Starting the first Chef Client run...
*** Starting Chef Client, version 13.2.20
*** Creating a new client identity for ***
*** resolving cookbooks for run list: []
*** Synchronizing Cookbooks:
*** Installing Cookbook Gems:
*** Compiling Cookbooks...
*** [***] WARN: Node *** has an empty run list.
*** Converging 0 resources
***
*** Running handlers:
*** Running handlers complete
*** Chef Client finished, 0/0 resources updated in 02 seconds
```

To verify that this client was successfully registered with the Chef server, we can navigate back to the web interface for our Chef Server, click on `Nodes`, and see our client listed like below:

![successful_client](https://raw.githubusercontent.com/gatneil/demos/chef/img/see_node.jpg)




## Create our Chef client and configure using an Azure Virtual Machine Extension

This method of creating and configuring a Chef client is similar to the previous method, except we will have the client node bootstrap itself. In order to do this, we will utilize the [Azure Custom Script for Linux extension](https://docs.microsoft.com/azure/virtual-machines/linux/extensions-customscript). This allows us to specify a script in the VM model, which will cause the script to run in the VM. The script we will run is in github [here](https://raw.githubusercontent.com/gatneil/demos/chef/chef/extension.sh). Taking a look at the script, we can see that we first read the contents of some configuration files from the command line arguments to the script (we will pass these values in when we add the extension to the VM). **Note that we do not need to run these commands. This is simply a script we will invoke with commands later on**.

```bash
#!/bin/bash

set -evx

vm_username=$1
validator_pem_file_name=$2
validator_pem_value=$3
knife_rb=$4
trusted_cert_file_name=$5
trusted_cert_value=$6
vm_private_key=$7

```

We create the expected file structure for the .ssh and .chef directories:

```bash
homedir=/home/${vm_username}

cd ${homedir}
mkdir -p .chef
mkdir -p .chef/trusted_certs
mkdir -p .ssh

```

We then take the configuration file contents and store them in the proper files. As we will see later on in this article, the file contents are passed in to this script with '|' instead of newlines and '%' instead of double-quotes, so we undo these modifications before writing the contents to file.

```bash
echo ${validator_pem_value} | tr '|' '\n' > .chef/${validator_pem_file_name}
echo ${knife_rb} | tr '|' '\n' | tr '%' '"' > .chef/knife.rb
echo ${trusted_cert_value} | tr '|' '\n' > .chef/trusted_certs/${trusted_cert_file_name}
echo ${vm_private_key} | tr '|' '\n' > .ssh/id_rsa
```

Finally, we install the ChefDK on this machine and have it bootstrap itself:

```bash
curl -LO https://omnitruck.chef.io/install.sh
bash ./install.sh
knife bootstrap localhost --sudo --ssh-user ${vm_username}
```

**In order to invoke this script, we will run the following commands from the ~/chef-repo directory our local machine.** We had not previously unzipped this directory on our local machine (we did that on our workstation), so we might need to unzip the starter_kit on the local machine first then `cd` into the unzipped chef-repo directory before running the following commands.

First, we get the configuration files into a single-line format, replacing newlines with '|' and double-quotes with '%'. This will alow us to easily specify the extension settings:

```bash
validator_pem=$(sed 's/$/|/' .chef/contoso-validator.pem | tr -d '\n' | head -c -1)
trusted_cert=$(sed 's/$/|/' .chef/trusted_certs/nsgchefserver.westus.cloudapp.azure.com.crt | tr -d '\n' | head -c -1)
vm_private_key=$(sed 's/$/|/' ../chef | tr -d '\n' | head -c -1)
knife_rb=$(sed 's/"/%/g' .chef/knife.rb | sed 's/$/|/' | tr -d '\n' | head -c -1)
```

Next, we create a resource group and virtual machine to act as our chef client node:
```bash
az group create -n chefclient2 -l westus
az vm create -g chefclient2 -n chefclient2 --image UbuntuLTS --admin-username OUR_USERNAME
```

We then add the extension, specifying the script described earlier in the `fileUris`. We then invoke this script with the command in `commandToExecute`, passing in the contents of the configuration files from above:

```bash
az vm extension set --publisher Microsoft.Azure.Extensions --name CustomScript --version 2.0 --resource-group chefclient2 --vm-name chefclient2 --settings "{\"fileUris\": [\"https://raw.githubusercontent.com/gatneil/demos/chef/chef/extension.sh\"]}" --protected-settings "{\"commandToExecute\": \"bash extension.sh chef contoso-validator.pem '${validator_pem}' '${knife_rb}' nsgchefserver.westus.cloudapp.azure.com.crt '${trusted_cert}' '${vm_private_key}'\"}"
```

