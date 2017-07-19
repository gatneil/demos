Get started with Chef on Azure
==============================

# Overview

This article shows how to get started with Chef on Azure. At a high level, this has the following steps:

* Create your Chef server. We will deploy this server using the [Azure Portal](portal.azure.com).

* Create your Chef workstation. We will use the Azure CLI 2.0 to deploy an Ubuntu virtual machine as our Chef workstation. We will then run a script via ssh to configure this workstation and make some modifications to the Chef server.

* Create your Chef client. We will use Azure CLI 2.0 to deploy an Ubuntu virtual machine as our Chef client. We will then show two different options to configure this client to use the Chef Server. In the first method we will make a `knife bootstrap` call from the Chef workstation to configure the client. This method should be familiar to Chef users even if you are not used to Azure. In the second method we will use an Azure Virtual Machine Extension to configure the client. This second method utilizes Azure's notion of a VM model and sets us up nicely for our next step:

* Create a cluster of Chef clients. We will use Azure CLI 2.0 to deploy an Ubuntu-based virtual machine scale set and use an extension to configure all of these VMs as Chef clients. Using a scale set with an extension allows us to deploy and manage a cluster of similarly-configured VMs at scale.

## Create your Chef Automate server from the Azure Portal

In the [Azure Portal](portal.azure.com), create a `Chef Automate` server:

![chef_automate_portal_img](https://raw.githubusercontent.com/gatneil/demos/chef/img/chef_automate_portal.jpg).

Once you finish the create wizard and the deployment completes, click on the `Deployments` link within the `Resource Group` view to see the list of deployments:

![chef_automate_deployments_img](https://raw.githubusercontent.com/gatneil/demos/chef/img/deployments.jpg)

Then click on the top deployment and find the `FQDN` output:

![chef_automate_deployments_img](https://raw.githubusercontent.com/gatneil/demos/chef/img/ChefAutomateUrl.jpg)

Navigate to this URL in your browser and fill out the form, leaving the RSA key pair blank, un-checking the option to create a support account, and checking the EULA checkbox:

![biscotti](https://raw.githubusercontent.com/gatneil/demos/chef/img/biscotti.PNG)

Click the "Setup Chef Automate & Download Starter Kit" button. You should see a confirmation screen:

![chef_setup_confirmation](https://raw.githubusercontent.com/gatneil/demos/chef/img/chef_setup_confirmation.PNG)

Click "Login to Chef Automate" to get to the login screen for Chef Automate:

![login_automate](https://raw.githubusercontent.com/gatneil/demos/chef/img/login_automate.PNG)

Login with the username and password you specified previously. If you see the screen below (or a similar one), you have successfully logged in:

![successful_login](https://raw.githubusercontent.com/gatneil/demos/chef/img/successful_login.PNG)

## Create and configure your scale set

