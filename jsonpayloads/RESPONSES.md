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
    "vmId": "3f863a0f-2bdf-4b3d-849f-5d3c4acedd97",
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
    "vmId": "664e4895-23e9-4885-8a2b-c53b0a0c2a0a",
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
  "properties": {
    "vmId": "0c57beaa-7d22-4be6-8763-13f580973f26",
    "hardwareProfile": {
      "vmSize": "Standard_DS1_v2"
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
          "storageAccountType": "Premium_LRS"
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



CREATE A VM IN AN AVAILABILITY SET
==================================

```
{
  "properties": {
    "vmId": "31952a75-53af-408d-aa56-cd73d6254143",
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
    "vmId": "71e81de0-8178-4337-af0f-0b2e8297dfb2",
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
    "vmId": "15f8d972-797e-469a-87a1-2c48258c5506",
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
{
  "properties": {
    "vmId": "16c996cc-afb9-49ed-87b7-f46caea5bbda",
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    },
    "storageProfile": {
      "imageReference": {
        "publisher": "microsoft-ads",
        "offer": "standard-data-science-vm",
        "sku": "standard-data-science-vm",
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
  "plan": {
    "name": "standard-data-science-vm",
    "publisher": "microsoft-ads",
    "product": "standard-data-science-vm"
  },
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachines/myVM",
  "name": "myVM"
}
```



CREATE A VM FROM A CUSTOM IMAGE
===============================

```
{
  "properties": {
    "vmId": "a884d816-5e04-453a-a7cc-85018a161e12",
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    },
    "storageProfile": {
      "imageReference": {
        "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/images/nsgcustom"
      },
      "osDisk": {
        "osType": "Linux",
        "name": "myVMosdisk",
        "createOption": "FromImage",
        "caching": "ReadWrite",
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        },
        "diskSizeGB": 30
      },
      "dataDisks": []
    },
    "osProfile": {
      "computerName": "myVM",
      "adminUsername": "negat",
      "linuxConfiguration": {
        "disablePasswordAuthentication": false
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



CREATE A PLATFORM-IMAGE VM WITH UNMANAGED OS AND DATA DISKS
===========================================================

```
{
  "error": {
    "code": "InvalidParameter",
    "target": "dataDisk.name",
    "message": "The entity name 'dataDisk.name' is invalid according to its validation rule: ^[^_\\W][\\w-._]{0,79}(?<![-.])$."
  }
}
```



CREATE A CUSTOM-IMAGE VM FROM AN UNMANAGED GENERALIZED OS IMAGE
===============================================================

```
{
  "properties": {
    "vmId": "c77aeb7d-51c8-4d0e-94f1-1c2ae772ad14",
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    },
    "storageProfile": {
      "osDisk": {
        "osType": "Windows",
        "name": "myVMosdisk",
        "createOption": "FromImage",
        "image": {
          "uri": "https://nsgexamplergdisks712.blob.core.windows.net/system/Microsoft.Compute/Images/vhds/nsgunmanagedcustom-osDisk.82feb6cc-9f23-4f65-8374-4a729ac3582a.vhd"
        },
        "vhd": {
          "uri": "http://nsgexamplergdisks712.blob.core.windows.net/vhds/myDisk.vhd"
        },
        "caching": "ReadWrite"
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
        }
      },
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4"}}]}}]}
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "6fbc265d-e46e-469b-bcbb-1d5687ef2155"
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
  "sku": {
    "name": "Standard_DS1_v2",
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
            "storageAccountType": "Premium_LRS"
          }
        },
        "imageReference": {
          "publisher": "MicrosoftWindowsServer",
          "offer": "WindowsServer",
          "sku": "2016-Datacenter",
          "version": "latest"
        }
      },
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4"}}]}}]}
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "695df785-fda5-4f6a-9664-d2c99fbe2910"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
}
```



CREATE A SCALE SET WITH EMPTY DATA DISKS ON EACH VM
===================================================

```
{
  "sku": {
    "name": "Standard_D2_v2",
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
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "a445f704-640f-486c-ba67-d0b9ce07f521"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
}
```



CREATE A SCALE SET WITH AN AZURE LOAD BALANCER
==============================================

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
        }
      },
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4","loadBalancerBackendAddressPools":[{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/loadBalancers/myLb/backendAddressPools/lbBackendPool"}],"loadBalancerInboundNatPools":[{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/loadBalancers/myLb/inboundNatPools/lbNatPool"}]}}]}}]}
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "dd6e269d-6a3d-4c68-8425-b144b3ea574c"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
}
```



CREATE A SCALE SET WITH AN AZURE APPLICATION GATEWAY
====================================================

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
        }
      },
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4","applicationGatewayBackendAddressPools":[{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/applicationGateways/nsgExistingAppGw/backendAddressPools/appGatewayBackendPool"}]}}]}}]}
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "a104203c-4bdc-4902-b28d-749011b1acad"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
}
```



CREATE A SCALE SET WITH A PUBLIC IP ADDRESS PER VM
==================================================

```
{
  "error": {
    "code": "OperationNotAllowed",
    "message": "Operation 'Update Virtual Machine Scale Set' is not allowed on Virtual Machine Scale Set 'myVMSS' since it is marked for deletion."
  }
}
```



CREATE A SCALE SET WITH BOOT DIAGNOSTICS
========================================

```
{
  "error": {
    "code": "OperationNotAllowed",
    "message": "Operation 'Update Virtual Machine Scale Set' is not allowed on Virtual Machine Scale Set 'myVMSS' since it is marked for deletion."
  }
}
```



CREATE A SCALE SET WITH A MARKETPLACE IMAGE PLAN
================================================

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
          "publisher": "microsoft-ads",
          "offer": "standard-data-science-vm",
          "sku": "standard-data-science-vm",
          "version": "latest"
        }
      },
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4"}}]}}]}
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "06f203c8-5f4b-4c3e-8c39-4561da38a780"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "plan": {
    "name": "standard-data-science-vm",
    "publisher": "microsoft-ads",
    "product": "standard-data-science-vm"
  },
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
}
```



CREATE A SCALE SET FROM A CUSTOM IMAGE
======================================

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
        "linuxConfiguration": {
          "disablePasswordAuthentication": false
        },
        "secrets": []
      },
      "storageProfile": {
        "osDisk": {
          "createOption": "FromImage",
          "caching": "ReadWrite",
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          },
          "diskSizeGB": 30
        },
        "imageReference": {
          "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/images/nsgcustom"
        }
      },
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4"}}]}}]}
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "34d15466-6722-451d-bfe7-3c5e9219addb"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
}
```



CREATE A PLATFORM-IMAGE SCALE SET WITH UNMANAGED OS DISKS
=========================================================

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
          "vhdContainers": [
            "http://nsgexamplergdisks712.blob.core.windows.net/vhds"
          ],
          "name": "osDisk",
          "createOption": "FromImage",
          "caching": "ReadWrite"
        },
        "imageReference": {
          "publisher": "MicrosoftWindowsServer",
          "offer": "WindowsServer",
          "sku": "2016-Datacenter",
          "version": "latest"
        }
      },
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4"}}]}}]}
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "186f19c1-cf7f-4da4-b1ef-f149a21dd213"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
}
```



CREATE A CUSTOM-IMAGE SCALE SET FROM AN UNMANAGED GENERALIZED OS IMAGE
======================================================================

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
          "osType": "Windows",
          "name": "osDisk",
          "createOption": "FromImage",
          "image": {
            "uri": "https://nsgexamplergdisks712.blob.core.windows.net/system/Microsoft.Compute/Images/vhds/nsgunmanagedcustom-osDisk.82feb6cc-9f23-4f65-8374-4a729ac3582a.vhd"
          },
          "caching": "ReadWrite"
        }
      },
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4"}}]}}]}
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "d6e9ab29-f8c9-4792-978c-ae2c07b98f17"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
}
```



