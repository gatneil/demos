DEMOS
=====

A repo for demos.

# Chef + large scale set demo

This demo shows a large scale set configured via a Chef Automate server running in Azure. The steps are below:

## Create your Chef Automate server

In the [Azure Portal](portal.azure.com), create a `Chef Automate` server:

![chef_automate_portal_img](https://raw.githubusercontent.com/gatneil/demos/chef/img/chef_automate_portal.jpg).

Once this completes, click on the `Deployments` link within the `Resource Group` view to see the list of deployments:

![chef_automate_deployments_img](https://raw.githubusercontent.com/gatneil/demos/chef/img/chef_deployment.jpg)

Then click on the top deployment and find the `FQDN` output:

![chef_automate_deployments_img](https://raw.githubusercontent.com/gatneil/demos/chef/img/chef_fqdn.jpg)

Navigate to this URL in your browser and fill out the form, leaving the RSA key pair blank, un-checking the option to create a support account, and checking the EULA checkbox:

![biscotti](https://raw.githubusercontent.com/gatneil/demos/chef/img/biscotti.PNG)