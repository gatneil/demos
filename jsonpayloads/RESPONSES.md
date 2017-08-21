CREATE AN AVAILABILITY SET
==========================
200
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
201
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
201
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
201
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
201
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
201
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
201
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
201
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
201
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
201
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
201
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
201
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
201
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
201
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
201
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
201
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
201
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
```201
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
201
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
201
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
201
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
201
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
201
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



GET COMPUTE OPERATIONS
======================

```
200
{
  "value": [
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/availabilitySets/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Availability Sets",
        "operation": "Get Availablity Set",
        "description": "Get the properties of an availability set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/availabilitySets/write",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Availability Sets",
        "operation": "Create or Update Availability Set",
        "description": "Creates a new availability set or updates an existing one"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/availabilitySets/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Availability Sets",
        "operation": "Delete Availability Set",
        "description": "Deletes the availability set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/availabilitySets/vmSizes/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Size for Availability set",
        "operation": "List Virtual Machine Sizes for Availability Set",
        "description": "List available sizes for creating or updating a virtual machine in the availability set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Get Virtual Machine",
        "description": "Get the properties of a virtual machine"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/write",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Create or Update Virtual Machine",
        "description": "Creates a new virtual machine or updates an existing virtual machine"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Delete Virtual Machine",
        "description": "Deletes the virtual machine"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/start/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Start Virtual Machine",
        "description": "Starts the virtual machine"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/powerOff/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Power Off Virtual Machine",
        "description": "Powers off the virtual machine. Note that the virtual machine will continue to be billed."
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/redeploy/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Redeploy Virtual Machine",
        "description": "Redeploys virtual machine"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/restart/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Restart Virtual Machine",
        "description": "Restarts the virtual machine"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/deallocate/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Deallocate Virtual Machine",
        "description": "Powers off the virtual machine and releases the compute resources"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/generalize/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Generalize Virtual Machine",
        "description": "Sets the virtual machine state to Generalized and prepares the virtual machine for capture"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/capture/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Capture Virtual Machine",
        "description": "Captures the virtual machine by copying virtual hard disks and generates a template that can be used to create similar virtual machines"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/runCommand/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Run Command on Virtual Machine",
        "description": "Executes a predefined script on the virtual machine"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/convertToManagedDisks/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Convert Virtual Machine disks to Managed Disks",
        "description": "Converts the blob based disks of the virtual machine to managed disks"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/performMaintenance/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machines",
        "operation": "Perform Maintenance Redeploy",
        "description": "Performs Maintenance Operation on the VM."
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/instanceView/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Instance View",
        "operation": "Get Virtual Machine Instance View",
        "description": "Gets the detailed runtime status of the virtual machine and its resources"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/vmSizes/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Size",
        "operation": "Lists Available Virtual Machine Sizes",
        "description": "Lists available sizes the virtual machine can be updated to"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/images/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Images",
        "operation": "Get Image",
        "description": "Get the properties of the Image"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/images/write",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Images",
        "operation": "Create or Update Image",
        "description": "Creates a new Image or updates an existing one"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/images/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Images",
        "operation": "Delete Image",
        "description": "Deletes the image"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/restorePointCollections/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Restore Point Collections",
        "operation": "Get Restore Point Collection",
        "description": "Get the properties of a restore point collection"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/restorePointCollections/write",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Restore Point Collections",
        "operation": "Create or Update Restore Point Collection",
        "description": "Creates a new restore point collection or updates an existing one"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/restorePointCollections/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Restore Point Collections",
        "operation": "Delete Restore Point Collection",
        "description": "Deletes the restore point collection and contained restore points"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/restorePointCollections/restorePoints/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Restore Points",
        "operation": "Get Restore Point",
        "description": "Get the properties of a restore point"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/restorePointCollections/restorePoints/write",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Restore Points",
        "operation": "Create Restore Point",
        "description": "Creates a new restore point"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/restorePointCollections/restorePoints/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Restore Points",
        "operation": "Delete Restore Point",
        "description": "Deletes the restore point"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/restorePointCollections/restorePoints/retrieveSasUris/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Restore Points",
        "operation": "Get Restore Point along with blob SAS URIs",
        "description": "Get the properties of a restore point along with blob SAS URIs"
      }
    },
    {
      "origin": "system",
      "name": "Microsoft.Compute/virtualMachines/providers/Microsoft.Insights/metricDefinitions/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Metric Definitions",
        "operation": "Get Virtual Machine Metric Definitions",
        "description": "Reads Virtual Machine Metric Definitions"
      },
      "properties": {
  "serviceSpecification": {
    "metricSpecifications": [
      {
        "name": "Percentage CPU",
        "displayName": "Percentage CPU",
        "displayDescription": "The percentage of allocated compute units that are currently in use by the Virtual Machine(s)",
        "unit": "Percent",
        "aggregationType": "Average"
      },
      {
        "name": "Network In",
        "displayName": "Network In",
        "displayDescription": "The number of bytes received on all network interfaces by the Virtual Machine(s) (Incoming Traffic)",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Network Out",
        "displayName": "Network Out",
        "displayDescription": "The number of bytes out on all network interfaces by the Virtual Machine(s) (Outgoing Traffic)",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Disk Read Bytes",
        "displayName": "Disk Read Bytes",
        "displayDescription": "Total bytes read from disk during monitoring period",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Disk Write Bytes",
        "displayName": "Disk Write Bytes",
        "displayDescription": "Total bytes written to disk during monitoring period",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Disk Read Operations/Sec",
        "displayName": "Disk Read Operations/Sec",
        "displayDescription": "Disk Read IOPS",
        "unit": "CountPerSecond",
        "aggregationType": "Average"
      },
      {
        "name": "Disk Write Operations/Sec",
        "displayName": "Disk Write Operations/Sec",
        "displayDescription": "Disk Write IOPS",
        "unit": "CountPerSecond",
        "aggregationType": "Average"
      }
    ]
  }
}
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/extensions/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Extensions",
        "operation": "Get Virtual Machine Extension",
        "description": "Get the properties of a virtual machine extension"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/extensions/write",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Extensions",
        "operation": "Create or Update Virtual Machine Extension",
        "description": "Creates a new virtual machine extension or updates an existing one"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachines/extensions/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Extensions",
        "operation": "Delete Virtual Machine Extension",
        "description": "Deletes the virtual machine extension"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/extensions/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Set Extensions",
        "operation": "Get Virtual Machine Scale Set Extension",
        "description": "Gets the properties of a Virtual Machine Scale Set Extension"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/extensions/write",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Set Extensions",
        "operation": "Create or Update Virtual Machine Scale Set Extension",
        "description": "Creates a new Virtual Machine Scale Set Extension or updates an existing one"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/extensions/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Set Extensions",
        "operation": "Delete Virtual Machine Scale Set Extension",
        "description": "Deletes the Virtual Machine Scale Set Extension"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Get Virtual Machine Scale Set",
        "description": "Get the properties of a virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/write",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Create or Update Virtual Machine Scale Set",
        "description": "Creates a new virtual machine scale set or updates an existing one"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Delete Virtual Machine Scale Set",
        "description": "Deletes the virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/delete/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Delete Virtual Machines in a Virtual Machine Scale Set",
        "description": "Deletes the instances of the virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/start/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Start Virtual Machine Scale Set",
        "description": "Starts the instances of the virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/powerOff/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Power Off Virtual Machine Scale Set",
        "description": "Powers off the instances of the virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/restart/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Restart Virtual Machine Scale Set",
        "description": "Restarts the instances of the virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/deallocate/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Deallocate Virtual Machine Scale Set",
        "description": "Powers off and releases the compute resources for the instances of the virtual machine scale set "
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/manualUpgrade/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Manual Upgrade Virtual Machine Scale Set",
        "description": "Manually updates instances to latest model of the virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/reimage/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Reimage Virtual Machine Scale Set",
        "description": "Reimages the instances of the virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/scale/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets",
        "operation": "Scale Virtual Machine Scale Set",
        "description": "Scale In/Scale Out instance count of an existing virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/instanceView/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Set Instance View",
        "operation": "Get Virtual Machine Scale Set Instance View",
        "description": "Gets the instance view of the virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/skus/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Set SKU",
        "operation": "List SKUs for Virtual Machine Scale Set",
        "description": "Lists the valid SKUs for an existing virtual machine scale set"
      }
    },
    {
      "origin": "system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/providers/Microsoft.Insights/metricDefinitions/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scalet Set Metric Definitions",
        "operation": "Get Virtual Machine Scalet Set Metric Definitions",
        "description": "Reads Virtual Machine Scalet Set Metric Definitions"
      },
      "properties": {
  "serviceSpecification": {
    "metricSpecifications": [
      {
        "name": "Percentage CPU",
        "displayName": "Percentage CPU",
        "displayDescription": "The percentage of allocated compute units that are currently in use by the Virtual Machine(s)",
        "unit": "Percent",
        "aggregationType": "Average"
      },
      {
        "name": "Network In",
        "displayName": "Network In",
        "displayDescription": "The number of bytes received on all network interfaces by the Virtual Machine(s) (Incoming Traffic)",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Network Out",
        "displayName": "Network Out",
        "displayDescription": "The number of bytes out on all network interfaces by the Virtual Machine(s) (Outgoing Traffic)",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Disk Read Bytes",
        "displayName": "Disk Read Bytes",
        "displayDescription": "Total bytes read from disk during monitoring period",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Disk Write Bytes",
        "displayName": "Disk Write Bytes",
        "displayDescription": "Total bytes written to disk during monitoring period",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Disk Read Operations/Sec",
        "displayName": "Disk Read Operations/Sec",
        "displayDescription": "Disk Read IOPS",
        "unit": "CountPerSecond",
        "aggregationType": "Average"
      },
      {
        "name": "Disk Write Operations/Sec",
        "displayName": "Disk Write Operations/Sec",
        "displayDescription": "Disk Write IOPS",
        "unit": "CountPerSecond",
        "aggregationType": "Average"
      }
    ]
  }
}
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/rollingUpgrades/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets Rolling Upgrades",
        "operation": "Gets the latest Rolling Upgrade status for a Virtual Machine Scale Set",
        "description": "Get latest Rolling Upgrade status for a virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/rollingUpgrades/cancel/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Scale Sets Rolling Upgrades",
        "operation": "Cancel Virtual Machine Scale Set Rolling Upgrade operation",
        "description": "Cancels the rolling upgrade of a virtual machine scale set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine in Scale Set",
        "operation": "Gets the properties of a Virtual Machine in a Virtual Machine Scale Set",
        "description": "Retrieves the properties of a Virtual Machine in a VM Scale Set"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine in Scale Set",
        "operation": "Delete Virtual Machine in a Virtual Machine Scale Set",
        "description": "Delete a specific Virtual Machine in a VM Scale Set."
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/start/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine in Scale Set",
        "operation": "Start Virtual Machine in a Virtual Machine Scale Set",
        "description": "Starts a Virtual Machine instance in a VM Scale Set."
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/powerOff/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine in Scale Set",
        "operation": "Power off Virtual Machine in a Virtual Machine Scale Set",
        "description": "Powers Off a Virtual Machine instance in a VM Scale Set."
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/restart/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine in Scale Set",
        "operation": "Restart Virtual Machine instance in a Virtual Machine Scale Set",
        "description": "Restarts a Virtual Machine instance in a VM Scale Set."
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/deallocate/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine in Scale Set",
        "operation": "Deallocate Virtual Machine in a Virtual Machine Scale Set",
        "description": "Powers off and releases the compute resources for a Virtual Machine in a VM Scale Set."
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/reimage/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine in Scale Set",
        "operation": "Reimage Virtual Machine in a Virtual Machine Scale Set",
        "description": "Reimages a Virtual Machine instance in a Virtual Machine Scale Set."
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/instanceView/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Instance View of Virtual Machine in Scale Set",
        "operation": "Gets Instance View of a Virtual Machine in a Virtual Machine Scale Set",
        "description": "Retrieves the instance view of a Virtual Machine in a VM Scale Set."
      }
    },
    {
      "origin": "system",
      "name": "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/providers/Microsoft.Insights/metricDefinitions/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine in Scale Set Metric Definitions",
        "operation": "Get Virtual Machine in Scale Set Metric Definitions",
        "description": "Reads Virtual Machine in Scale Set Metric Definitions"
      },
      "properties": {
  "serviceSpecification": {
    "metricSpecifications": [
      {
        "name": "Percentage CPU",
        "displayName": "Percentage CPU",
        "displayDescription": "The percentage of allocated compute units that are currently in use by the Virtual Machine(s)",
        "unit": "Percent",
        "aggregationType": "Average"
      },
      {
        "name": "Network In",
        "displayName": "Network In",
        "displayDescription": "The number of bytes received on all network interfaces by the Virtual Machine(s) (Incoming Traffic)",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Network Out",
        "displayName": "Network Out",
        "displayDescription": "The number of bytes out on all network interfaces by the Virtual Machine(s) (Outgoing Traffic)",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Disk Read Bytes",
        "displayName": "Disk Read Bytes",
        "displayDescription": "Total bytes read from disk during monitoring period",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Disk Write Bytes",
        "displayName": "Disk Write Bytes",
        "displayDescription": "Total bytes written to disk during monitoring period",
        "unit": "Bytes",
        "aggregationType": "Total"
      },
      {
        "name": "Disk Read Operations/Sec",
        "displayName": "Disk Read Operations/Sec",
        "displayDescription": "Disk Read IOPS",
        "unit": "CountPerSecond",
        "aggregationType": "Average"
      },
      {
        "name": "Disk Write Operations/Sec",
        "displayName": "Disk Write Operations/Sec",
        "displayDescription": "Disk Write IOPS",
        "unit": "CountPerSecond",
        "aggregationType": "Average"
      }
    ]
  }
}
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/locations/vmSizes/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Virtual Machine Sizes",
        "operation": "List Available Virtual Machine Sizes in Location",
        "description": "Lists available virtual machine sizes in a location"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/locations/operations/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Operation",
        "operation": "Get Operation",
        "description": "Gets the status of an asynchronous operation"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/locations/usages/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Usage Metrics",
        "operation": "Get Usage Metrics",
        "description": "Gets service limits and current usage quantities for the subscription's compute resources in a location"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/locations/runCommands/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Run Commands",
        "operation": "Lists Run Commands",
        "description": "Lists available run commands in location"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/operations/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Available Compute Operations",
        "operation": "List Available Compute Operations",
        "description": "Lists operations available on Microsoft.Compute resource provider"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/register/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Compute Register Subscription",
        "operation": "Register Subscription for Compute",
        "description": "Registers Subscription with Microsoft.Compute resource provider"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/disks/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Disks",
        "operation": "Get Disk",
        "description": "Get the properties of a Disk"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/disks/write",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Disks",
        "operation": "Create or Update Disk",
        "description": "Creates a new Disk or updates an existing one"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/disks/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Disks",
        "operation": "Delete Disk",
        "description": "Deletes the Disk"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/disks/beginGetAccess/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Disks",
        "operation": "Get Disk SAS URI",
        "description": "Get the SAS URI of the Disk for blob access"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/disks/endGetAccess/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Disks",
        "operation": "Revoke Disk SAS URI",
        "description": "Revoke the SAS URI of the Disk"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/snapshots/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Snapshots",
        "operation": "Get Snapshot",
        "description": "Get the properties of a Snapshot"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/snapshots/write",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Snapshots",
        "operation": "Create or Update Snapshot",
        "description": "Create a new Snapshot or update an existing one"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/snapshots/delete",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Snapshots",
        "operation": "Delete Snapshot",
        "description": "Delete a Snapshot"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/snapshots/beginGetAccess/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Snapshots",
        "operation": "Get Snapshot SAS URI",
        "description": "Get the SAS URI of the Snapshot for blob access"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/snapshots/endGetAccess/action",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "Snapshots",
        "operation": "Revoke Snapshot SAS URI",
        "description": "Revoke the SAS URI of the Snapshot"
      }
    },
    {
      "origin": "user,system",
      "name": "Microsoft.Compute/locations/diskOperations/read",
      "display": {
        "provider": "Microsoft Compute",
        "resource": "DiskOperation",
        "operation": "Get Disk Operation",
        "description": "Gets the status of an asynchronous Disk operation"
      }
    }
  ]
}
```



LIST AVAILABILITY SETS IN A SUBSCRIPTION
========================================

```
200
{
  "value": [
    {
      "properties": {
        "platformUpdateDomainCount": 20,
        "platformFaultDomainCount": 2
      },
      "type": "Microsoft.Compute/availabilitySets",
      "location": "westus",
      "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/NSGEXAMPLERG/providers/Microsoft.Compute/availabilitySets/myAvailabilitySet2",
      "name": "myAvailabilitySet2",
      "sku": {
        "name": "Classic"
      }
    },
    {
      "properties": {
        "platformUpdateDomainCount": 20,
        "platformFaultDomainCount": 2
      },
      "type": "Microsoft.Compute/availabilitySets",
      "location": "westus",
      "tags": {},
      "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/NSGEXAMPLERG/providers/Microsoft.Compute/availabilitySets/nsgExistingAS",
      "name": "nsgExistingAS",
      "sku": {
        "name": "Aligned"
      }
    }
  ]
}
```



LIST EXTENSIONS ON A VM
=======================

```
200
{
  "value": [
    {
      "properties": {
        "publisher": "Microsoft.Azure.Security",
        "type": "IaaSAntimalware",
        "typeHandlerVersion": "1.3",
        "autoUpgradeMinorVersion": true,
        "settings": {"AntimalwareEnabled":true,"RealtimeProtectionEnabled":"true","ScheduledScanSettings":{"isEnabled":"false","day":"7","time":"120","scanType":"Quick"},"Exclusions":{"Extensions":"","Paths":"","Processes":""}},
        "provisioningState": "Succeeded"
      },
      "type": "Microsoft.Compute/virtualMachines/extensions",
      "location": "westus",
      "id": "/subscriptions/5a810961-5236-4bbd-b50a-bda258eb00c0/resourceGroups/nsgExampleRg/providers/Microsoft.Compute/virtualMachines/vmWithExt/extensions/IaaSAntimalware",
      "name": "IaaSAntimalware"
    }
  ]
}
```



GET THE INSTANCE VIEW OF A VM
=============================

```
200
{
  "vmAgent": {
    "vmAgentVersion": "2.7.1198.809",
    "statuses": [
      {
        "code": "ProvisioningState/succeeded",
        "level": "Info",
        "displayStatus": "Ready",
        "message": "GuestAgent is running and accepting new configurations.",
        "time": "2017-08-21T22:27:55+00:00"
      }
    ],
    "extensionHandlers": [
      {
        "type": "Microsoft.Azure.Security.IaaSAntimalware",
        "typeHandlerVersion": "1.5.4.4",
        "status": {
          "code": "ProvisioningState/succeeded",
          "level": "Info",
          "displayStatus": "Ready"
        }
      }
    ]
  },
  "disks": [
    {
      "name": "vmWithExt_OsDisk_1_7e72087aeb5144839431f6c2af577c7e",
      "statuses": [
        {
          "code": "ProvisioningState/succeeded",
          "level": "Info",
          "displayStatus": "Provisioning succeeded",
          "time": "2017-08-18T21:42:25.6680155+00:00"
        }
      ]
    }
  ],
  "extensions": [
    {
      "name": "IaaSAntimalware",
      "type": "Microsoft.Azure.Security.IaaSAntimalware",
      "typeHandlerVersion": "1.5.4.4",
      "statuses": [
        {
          "code": "ProvisioningState/succeeded",
          "level": "Info",
          "displayStatus": "Provisioning succeeded",
          "message": "Microsoft Antimalware enabled"
        }
      ]
    }
  ],
  "statuses": [
    {
      "code": "ProvisioningState/succeeded",
      "level": "Info",
      "displayStatus": "Provisioning succeeded",
      "time": "2017-08-18T21:47:29.2486954+00:00"
    },
    {
      "code": "PowerState/running",
      "level": "Info",
      "displayStatus": "VM running"
    }
  ]
}
```