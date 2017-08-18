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
    "vmId": "b248db33-62ba-4d2d-b791-811e075ee0f5",
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
    "vmId": "e0de9b84-a506-4b95-9623-00a425d05c90",
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
    "vmId": "a149cd25-409f-41af-8088-275f5486bc93",
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
    "vmId": "b7a098cc-b0b8-46e8-a205-62f301a62a8f",
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
    "vmId": "676420ba-7a24-4bfe-80bd-9c841ee184fa",
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
    "vmId": "3906fef9-a1e5-4b83-a8a8-540858b41df0",
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
    "vmId": "5c0d55a7-c407-4ed6-bf7d-ddb810267c85",
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
    "vmId": "71aa3d5a-d73d-4970-9182-8580433b2865",
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
  "properties": {
    "vmId": "5230a749-2f68-4830-900b-702182d32e63",
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
        "vhd": {
          "uri": "http://nsgexamplergdisks712.blob.core.windows.net/vhds/myDisk.vhd"
        },
        "caching": "ReadWrite"
      },
      "dataDisks": [
        {
          "lun": 0,
          "name": "dataDisk0",
          "createOption": "Empty",
          "vhd": {
            "uri": "http://nsgexamplergdisks712.blob.core.windows.net/vhds/myDisk0.vhd"
          },
          "caching": "None",
          "diskSizeGB": 1023
        },
        {
          "lun": 1,
          "name": "dataDisk1",
          "createOption": "Empty",
          "vhd": {
            "uri": "http://nsgexamplergdisks712.blob.core.windows.net/vhds/myDisk1.vhd"
          },
          "caching": "None",
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



CREATE A CUSTOM-IMAGE VM FROM AN UNMANAGED GENERALIZED OS IMAGE
===============================================================

```
{
  "properties": {
    "vmId": "926cd555-a07c-4ff5-b214-4aa4dd09d79b",
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
    "uniqueId": "ffb27c5c-39a5-4d4e-b307-b32598689813"
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
      "storageProfile": {
        "osDisk": {
          "createOption": "FromImage",
          "caching": "ReadWrite",
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }
        },
        "imageReference": {
          "publisher": "Canonical",
          "offer": "UbuntuServer",
          "sku": "16.04-LTS",
          "version": "latest"
        }
      },
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4"}}]}}]}
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "fb73af19-0090-467c-9ced-b00bceab1c45"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
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
    "uniqueId": "19fd38a2-f50a-42c6-9dc7-3f9cf3791225"
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
    "uniqueId": "8042c376-4690-4c47-9fa2-fbdad70e32fa"
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
    "uniqueId": "ec0b21ca-51ec-414b-9323-f236ffc21479"
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
    "uniqueId": "a0134477-b9d9-484b-b0e3-205c1c089ffa"
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
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"publicIPAddressConfiguration":{"name":"pubip","properties":{"idleTimeoutInMinutes":15}},"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4"}}]}}]}
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "da61d575-98ba-4959-8a02-a40d3bd96c15"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
}
```



CREATE A SCALE SET WITH BOOT DIAGNOSTICS
========================================

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
      "networkProfile": {"networkInterfaceConfigurations":[{"name":"myVMSS","properties":{"primary":true,"enableAcceleratedNetworking":false,"dnsSettings":{"dnsServers":[]},"ipConfigurations":[{"name":"myVMSS","properties":{"subnet":{"id":"/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Network/virtualNetworks/nsgExistingVnet/subnets/nsgExistingSubnet"},"privateIPAddressVersion":"IPv4"}}]}}]},
      "diagnosticsProfile": {
        "bootDiagnostics": {
          "enabled": true,
          "storageUri": "http://nsgdiagnostic.blob.core.windows.net"
        }
      }
    },
    "provisioningState": "Creating",
    "overprovision": true,
    "uniqueId": "d053ec5a-8da6-495f-ab13-38216503c6d7"
  },
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS",
  "name": "myVMSS"
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
    "uniqueId": "b9e23088-6ffc-46e0-9e02-b0a6eeef47db"
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
    "uniqueId": "afa2afa8-9e49-48fb-9d18-c86323b5d064"
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
    "uniqueId": "77b7df9a-32fe-45e3-8911-60ac9c9b9c64"
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
