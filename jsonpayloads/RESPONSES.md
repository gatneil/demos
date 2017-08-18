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
    "vmId": "25163316-ebff-4701-b3ba-b636bf0b7a13",
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
    "vmId": "4f070905-30e9-4f70-9fcd-21e18cb1f026",
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
    "vmId": "ee81ab38-d8a4-4827-a63b-8914f571b009",
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
    "vmId": "d4f99473-ac46-49ad-ae77-5ff033a1fcd1",
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
    "vmId": "360f0d4b-9c80-4250-8b8b-e16ad0b01d42",
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
    "vmId": "e9a4abcb-2b3f-492c-92ae-5ff10dd9a605",
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
{
  "properties": {
    "vmId": "c389fa0b-b7f2-4cf2-9b39-289ca8fe298c",
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
    "vmId": "51edca20-3de0-497e-a888-5dbb3dd9e1d0",
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
    "uniqueId": "d080aebc-b8ce-4d77-8923-24db15ed9a4e"
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
    "uniqueId": "cdac0665-04f6-4f81-bb5a-0903396f256e"
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
    "uniqueId": "249113f9-d68a-407a-af5a-f87df0df9a61"
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
    "uniqueId": "07b47d45-2605-4aff-84bb-7af525f2edd9"
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
    "uniqueId": "03b69fc7-3158-433f-acb2-b7dff698b3a7"
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
    "code": "BadRequest",
    "target": "vmss.properties.diagnosticsProfile",
    "message": "Could not find member 'diagnosticsProfile' on object of type 'Properties'. Path 'properties.diagnosticsProfile', line 1, position 129."
  }
}
```



CREATE A SCALE SET WITH A MARKETPLACE IMAGE PLAN
================================================

```
{"error":{"code":"CannotSetPlanOnUpdate","message":"This resource was created without a plan. A new plan cannot be associated with an update."}}
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
    "uniqueId": "8341e753-bd2d-46da-bdf7-8b881bdda29d"
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
    "uniqueId": "aac5fb79-07a6-41d3-aaf8-73e89a949eca"
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
  "error": {
    "code": "InvalidParameter",
    "target": "osDisk.osType",
    "message": "Required parameter 'osDisk.osType' is missing (null)."
  }
}
```



