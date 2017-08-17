CREATE AN AVAILABILITY SET
==========================

```
{
  "properties": {
    "platformUpdateDomainCount": 20,
    "platformFaultDomainCount": 2
  },
  "type": "Microsoft.Compute/availabilitySets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/availabilitySets/myAvailabilitySet",
  "name": "myAvailabilitySet",
  "sku": {
    "name": "Classic"
  }
}
```



CREATE A VM WITH PASSWORD AUTHENTICATION
========================================

```
{
  "properties": {
    "vmId": "e31c27fd-601e-4377-8100-cf76b87bbcfa",
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    },
    "storageProfile": {
      "imageReference": {
        "publisher": "MicrosoftWindowsServer",
        "offer": "WindowsServer",
        "sku": "2016-Datacenter",
        "version": "latest"
      },
      "osDisk": {
        "osType": "Windows",
        "name": "myVMosdisk",
        "createOption": "FromImage",
        "caching": "ReadWrite",
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }
      },
      "dataDisks": []
    },
    "osProfile": {
      "computerName": "myVM",
      "adminUsername": "negat",
      "windowsConfiguration": {
        "provisionVMAgent": true,
        "enableAutomaticUpdates": true
      },
      "secrets": []
    },
    "networkProfile": {"networkInterfaces":[{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/networkInterfaces/nsgExistingNic","properties":{"primary":true}}]},
    "provisioningState": "Creating"
  },
  "type": "Microsoft.Compute/virtualMachines",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachines/myVM",
  "name": "myVM"
}
```



CREATE A VM WITH SSH AUTHENTICATION
===================================

```
{
  "properties": {
    "vmId": "59925c0e-504c-4e4b-840e-d2309b2e04ca",
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    },
    "storageProfile": {
      "imageReference": {
        "publisher": "Canonical",
        "offer": "UbuntuServer",
        "sku": "16.04-LTS",
        "version": "latest"
      },
      "osDisk": {
        "osType": "Linux",
        "name": "myVMosdisk",
        "createOption": "FromImage",
        "caching": "ReadWrite",
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }
      },
      "dataDisks": []
    },
    "osProfile": {
      "computerName": "myVM",
      "adminUsername": "negat",
      "linuxConfiguration": {
        "disablePasswordAuthentication": true,
        "ssh": {
          "publicKeys": [
            {
              "path": "/home/negat/.ssh/authorized_keys",
              "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeClRAk2ipUs/l5voIsDC5q9RI+YSRd1Bvd/O+axgY4WiBzG+4FwJWZm/mLLe5DoOdHQwmU2FrKXZSW4w2sYE70KeWnrFViCOX5MTVvJgPE8ClugNl8RWth/tU849DvM9sT7vFgfVSHcAS2yDRyDlueii+8nF2ym8XWAPltFVCyLHRsyBp5YPqK8JFYIa1eybKsY3hEAxRCA+/7bq8et+Gj3coOsuRmrehav7rE6N12Pb80I6ofa6SM5XNYq4Xk0iYNx7R3kdz0Jj9XgZYWjAHjJmT0gTRoOnt6upOuxK7xI/ykWrllgpXrCPu3Ymz+c+ujaqcxDopnAl2lmf69/J1"
            }
          ]
        }
      },
      "secrets": []
    },
    "networkProfile": {"networkInterfaces":[{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/networkInterfaces/nsgExistingNic","properties":{"primary":true}}]},
    "provisioningState": "Creating"
  },
  "type": "Microsoft.Compute/virtualMachines",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachines/myVM",
  "name": "myVM"
}
```



CREATE A VM WITH PREMIUM STORAGE
================================

```
{
  "error": {
    "code": "InvalidParameter",
    "target": "osDisk.managedDisk.storageAccountType",
    "message": "Storage account type 'Premium_LRS' is not supported for VM size Standard_D1_v2."
  }
}
```



CREATE A VM IN AN AVAILABILITY SET
==================================

```
{
  "properties": {
    "vmId": "cda19366-c66e-4c93-90b7-e760fa99453f",
    "availabilitySet": {
      "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/availabilitySets/NSGEXISTINGAS"
    },
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    },
    "storageProfile": {
      "imageReference": {
        "publisher": "MicrosoftWindowsServer",
        "offer": "WindowsServer",
        "sku": "2016-Datacenter",
        "version": "latest"
      },
      "osDisk": {
        "osType": "Windows",
        "name": "myVMosdisk",
        "createOption": "FromImage",
        "caching": "ReadWrite",
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }
      },
      "dataDisks": []
    },
    "osProfile": {
      "computerName": "myVM",
      "adminUsername": "negat",
      "windowsConfiguration": {
        "provisionVMAgent": true,
        "enableAutomaticUpdates": true
      },
      "secrets": []
    },
    "networkProfile": {"networkInterfaces":[{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/networkInterfaces/nsgExistingNic","properties":{"primary":true}}]},
    "provisioningState": "Creating"
  },
  "type": "Microsoft.Compute/virtualMachines",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachines/myVM",
  "name": "myVM"
}
```



CREATE A VM WITH BOOT DIAGNOSTICS
=================================

```
{
  "properties": {
    "vmId": "08825f2a-7215-4a3d-a3e6-f6c4dc33ba92",
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    },
    "storageProfile": {
      "imageReference": {
        "publisher": "MicrosoftWindowsServer",
        "offer": "WindowsServer",
        "sku": "2016-Datacenter",
        "version": "latest"
      },
      "osDisk": {
        "osType": "Windows",
        "name": "myVMosdisk",
        "createOption": "FromImage",
        "caching": "ReadWrite",
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }
      },
      "dataDisks": []
    },
    "osProfile": {
      "computerName": "myVM",
      "adminUsername": "negat",
      "windowsConfiguration": {
        "provisionVMAgent": true,
        "enableAutomaticUpdates": true
      },
      "secrets": []
    },
    "networkProfile": {"networkInterfaces":[{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/networkInterfaces/nsgExistingNic","properties":{"primary":true}}]},
    "diagnosticsProfile": {
      "bootDiagnostics": {
        "enabled": true,
        "storageUri": "http://nsgdiagnostic.blob.core.windows.net"
      }
    },
    "provisioningState": "Creating"
  },
  "type": "Microsoft.Compute/virtualMachines",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachines/myVM",
  "name": "myVM"
}
```



CREATE A VM WITH EMPTY DATA DISKS
=================================

```
{
  "properties": {
    "vmId": "dfce262c-4784-4d3e-acb2-e67820a32c05",
    "hardwareProfile": {
      "vmSize": "Standard_D2_v2"
    },
    "storageProfile": {
      "imageReference": {
        "publisher": "MicrosoftWindowsServer",
        "offer": "WindowsServer",
        "sku": "2016-Datacenter",
        "version": "latest"
      },
      "osDisk": {
        "osType": "Windows",
        "name": "myVMosdisk",
        "createOption": "FromImage",
        "caching": "ReadWrite",
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }
      },
      "dataDisks": [
        {
          "lun": 0,
          "createOption": "Empty",
          "caching": "None",
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          },
          "diskSizeGB": 1023
        },
        {
          "lun": 1,
          "createOption": "Empty",
          "caching": "None",
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          },
          "diskSizeGB": 1023
        }
      ]
    },
    "osProfile": {
      "computerName": "myVM",
      "adminUsername": "negat",
      "windowsConfiguration": {
        "provisionVMAgent": true,
        "enableAutomaticUpdates": true
      },
      "secrets": []
    },
    "networkProfile": {"networkInterfaces":[{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/networkInterfaces/nsgExistingNic","properties":{"primary":true}}]},
    "provisioningState": "Creating"
  },
  "type": "Microsoft.Compute/virtualMachines",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachines/myVM",
  "name": "myVM"
}
```



CREATE A VM WITH A MARKETPLACE IMAGE PLAN
=========================================

```
{"error":{"code":"ResourcePurchaseValidationFailed","message":"User failed validation to purchase resources. Error message: 'Legal terms have not been accepted for this item on this subscription. To accept legal terms, please go to the Azure portal (http://go.microsoft.com/fwlink/?LinkId=534873) and configure programmatic deployment for the Marketplace item or create it there for the first time'"}}
```



CREATE A VM FROM A CUSTOM IMAGE
===============================

```
<type 'exceptions.NameError'>
CREATE A PLATFORM-IMAGE VM WITH UNMANAGED OS AND DATA DISKS
===========================================================

```
<type 'exceptions.NameError'>
CREATE A CUSTOM-IMAGE VM FROM AN UNMANAGED GENERALIZED OS IMAGE
===============================================================

```
<type 'exceptions.NameError'>
CREATE A SCALE SET WITH PASSWORD AUTHENTICATION
===============================================

```
{
  "sku": {
    "name": "Standard_D1_v2",
    "tier": "Standard",
    "capacity": 3
  },
  "properties": {
    "singlePlacementGroup": true,
    "upgradePolicy": {
      "mode": "Manual"
    },
    "virtualMachineProfile": {
      "osProfile": {
        "computerNamePrefix": "myVMSS",
        "adminUsername": "negat",
        "windowsConfiguration": {
          "provisionVMAgent": true,
          "enableAutomaticUpdates": true
        },
        "secrets": []
      },
      "storageProfile": {
        "osDisk": {
          "createOption": "FromImage",
          "caching": "ReadWrite",
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }
        },
        "imageReference": {
          "publisher": "MicrosoftWindowsServer",
          "offer": "WindowsServer",
          "sku": "2016-Datacenter",
          "version": "latest"
        },
        "dataDisks": [
          {
            "lun": 0,
            "createOption": "Empty",
            "caching": "None",
            "managedDisk": {
              "storageAccountType": "Standard_LRS"
            },
            "diskSizeGB": 1023
          },
          {
            "lun": 1,
            "createOption": "Empty",
            "caching": "None",
            "managedDisk": {
              "storageAccountType": "Standard_LRS"
            },
            "diskSizeGB": 1023
          }
        ]
      },
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4"}}]}}]}
    },
    "provisioningState": "Updating",
    "overprovision": true,
    "uniqueId": "c532fef3-61ef-453a-97a2-7c328a6cc59b"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
}
```



CREATE A SCALE SET WITH SSH AUTHENTICATION
==========================================

```
{
  "error": {
    "code": "InvalidParameter",
    "target": "linuxConfiguration",
    "message": "The value of parameter linuxConfiguration is invalid."
  }
}
```



CREATE A SCALE SET WITH PREMIUM STORAGE
=======================================

```
{
  "error": {
    "code": "InvalidParameter",
    "target": "osDisk.managedDisk.storageAccountType",
    "message": "Storage account type 'Premium_LRS' is not supported for VM size Standard_D1_v2."
  }
}
```



CREATE A SCALE SET WITH EMPTY DATA DISKS ON EACH VM
===================================================

```
{"error":{"code":"ExpiredAuthenticationToken","message":"The access token expiry UTC time '8/17/2017 10:54:41 PM' is earlier than current UTC time '8/17/2017 10:55:43 PM'."}}
```



CREATE A SCALE SET WITH AN AZURE LOAD BALANCER
==============================================

```
{"error":{"code":"ExpiredAuthenticationToken","message":"The access token expiry UTC time '8/17/2017 10:54:41 PM' is earlier than current UTC time '8/17/2017 10:58:44 PM'."}}
```



CREATE A SCALE SET WITH AN AZURE APPLICATION GATEWAY
====================================================

```
<type 'exceptions.NameError'>
CREATE A SCALE SET WITH A PUBLIC IP ADDRESS PER VM
==================================================

```
{"error":{"code":"ExpiredAuthenticationToken","message":"The access token expiry UTC time '8/17/2017 10:54:41 PM' is earlier than current UTC time '8/17/2017 11:01:44 PM'."}}
```



CREATE A SCALE SET WITH BOOT DIAGNOSTICS
========================================

```
{"error":{"code":"ExpiredAuthenticationToken","message":"The access token expiry UTC time '8/17/2017 10:54:41 PM' is earlier than current UTC time '8/17/2017 11:04:44 PM'."}}
```



CREATE A SCALE SET WITH A MARKETPLACE IMAGE PLAN
================================================

```
{"error":{"code":"ExpiredAuthenticationToken","message":"The access token expiry UTC time '8/17/2017 10:54:41 PM' is earlier than current UTC time '8/17/2017 11:07:44 PM'."}}
```



CREATE A SCALE SET FROM A CUSTOM IMAGE
======================================

```
<type 'exceptions.NameError'>
CREATE A PLATFORM-IMAGE SCALE SET WITH UNMANAGED OS DISKS
=========================================================

```
<type 'exceptions.NameError'>
CREATE A CUSTOM-IMAGE SCALE SET FROM AN UNMANAGED GENERALIZED OS IMAGE
======================================================================

```
<type 'exceptions.NameError'>
