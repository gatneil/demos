see responses [here](./RESPONSES.md)

CREATE AN AVAILABILITY SET
==========================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/availabilitySets/myAvailabilitySet?api-version=2017-03-30

{
  "location": "westus", 
  "properties": {
    "platformFaultDomainCount": 2, 
    "platformUpdateDomainCount": 20
  }
}
```



CREATE A VM WITH PASSWORD AUTHENTICATION
========================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM?api-version=2017-03-30

{
  "properties": {
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    }, 
    "storageProfile": {
      "imageReference": {
        "sku": "2016-Datacenter", 
        "publisher": "MicrosoftWindowsServer", 
        "version": "latest", 
        "offer": "WindowsServer"
      }, 
      "osDisk": {
        "caching": "ReadWrite", 
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }, 
        "name": "myVMosdisk", 
        "createOption": "fromImage"
      }
    }, 
    "osProfile": {
      "adminUsername": "<your-username>", 
      "computerName": "myVM", 
      "adminPassword": "<your-password>"
    }, 
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/networkInterfaces/<existing-nic-name>", 
          "properties": {
            "primary": true
          }
        }
      ]
    }
  }, 
  "name": "myVM", 
  "location": "westus"
}
```



CREATE A VM WITH SSH AUTHENTICATION
===================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM?api-version=2017-03-30

{
  "properties": {
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    }, 
    "storageProfile": {
      "imageReference": {
        "sku": "<image_sku>", 
        "publisher": "<image_publisher>", 
        "version": "latest", 
        "offer": "<image_offer>"
      }, 
      "osDisk": {
        "caching": "ReadWrite", 
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }, 
        "name": "myVMosdisk", 
        "createOption": "fromImage"
      }
    }, 
    "osProfile": {
      "adminUsername": "<your-username>", 
      "computerName": "myVM", 
      "linuxConfiguration": {
        "ssh": {
          "publicKeys": [
            {
              "path": "/home/<your-username>/.ssh/authorized_keys", 
              "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeClRAk2ipUs/l5voIsDC5q9RI+YSRd1Bvd/O+axgY4WiBzG+4FwJWZm/mLLe5DoOdHQwmU2FrKXZSW4w2sYE70KeWnrFViCOX5MTVvJgPE8ClugNl8RWth/tU849DvM9sT7vFgfVSHcAS2yDRyDlueii+8nF2ym8XWAPltFVCyLHRsyBp5YPqK8JFYIa1eybKsY3hEAxRCA+/7bq8et+Gj3coOsuRmrehav7rE6N12Pb80I6ofa6SM5XNYq4Xk0iYNx7R3kdz0Jj9XgZYWjAHjJmT0gTRoOnt6upOuxK7xI/ykWrllgpXrCPu3Ymz+c+ujaqcxDopnAl2lmf69/J1"
            }
          ]
        }, 
        "disablePasswordAuthentication": true
      }
    }, 
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/networkInterfaces/<existing-nic-name>", 
          "properties": {
            "primary": true
          }
        }
      ]
    }
  }, 
  "name": "myVM", 
  "location": "westus"
}
```



CREATE A VM WITH PREMIUM STORAGE
================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM?api-version=2017-03-30

{
  "properties": {
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    }, 
    "storageProfile": {
      "imageReference": {
        "sku": "2016-Datacenter", 
        "publisher": "MicrosoftWindowsServer", 
        "version": "latest", 
        "offer": "WindowsServer"
      }, 
      "osDisk": {
        "caching": "ReadWrite", 
        "managedDisk": {
          "storageAccountType": "Premium_LRS"
        }, 
        "name": "myVMosdisk", 
        "createOption": "fromImage"
      }
    }, 
    "osProfile": {
      "adminUsername": "<your-username>", 
      "computerName": "myVM", 
      "adminPassword": "<your-password>"
    }, 
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/networkInterfaces/<existing-nic-name>", 
          "properties": {
            "primary": true
          }
        }
      ]
    }
  }, 
  "name": "myVM", 
  "location": "westus"
}
```



CREATE A VM IN AN AVAILABILITY SET
==================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM?api-version=2017-03-30

{
  "properties": {
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    }, 
    "storageProfile": {
      "imageReference": {
        "sku": "2016-Datacenter", 
        "publisher": "MicrosoftWindowsServer", 
        "version": "latest", 
        "offer": "WindowsServer"
      }, 
      "osDisk": {
        "caching": "ReadWrite", 
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }, 
        "name": "myVMosdisk", 
        "createOption": "fromImage"
      }
    }, 
    "osProfile": {
      "adminUsername": "<your-username>", 
      "computerName": "myVM", 
      "adminPassword": "<your-password>"
    }, 
    "availabilitySet": {
      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Compute/availabilitySets/<existing-availability-set-name>"
    }, 
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/networkInterfaces/<existing-nic-name>", 
          "properties": {
            "primary": true
          }
        }
      ]
    }
  }, 
  "name": "myVM", 
  "location": "westus"
}
```



CREATE A VM WITH BOOT DIAGNOSTICS
=================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM?api-version=2017-03-30

{
  "properties": {
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    }, 
    "storageProfile": {
      "imageReference": {
        "sku": "2016-Datacenter", 
        "publisher": "MicrosoftWindowsServer", 
        "version": "latest", 
        "offer": "WindowsServer"
      }, 
      "osDisk": {
        "caching": "ReadWrite", 
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }, 
        "name": "myVMosdisk", 
        "createOption": "fromImage"
      }
    }, 
    "osProfile": {
      "adminUsername": "<your-username>", 
      "computerName": "myVM", 
      "adminPassword": "<your-password>"
    }, 
    "diagnosticsProfile": {
      "bootDiagnostics": {
        "storageUri": "http://<existing-storage-account-name>.blob.core.windows.net", 
        "enabled": true
      }
    }, 
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/networkInterfaces/<existing-nic-name>", 
          "properties": {
            "primary": true
          }
        }
      ]
    }
  }, 
  "name": "myVM", 
  "location": "westus"
}
```



CREATE A VM WITH EMPTY DATA DISKS
=================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM?api-version=2017-03-30

{
  "properties": {
    "hardwareProfile": {
      "vmSize": "Standard_D2_v2"
    }, 
    "storageProfile": {
      "imageReference": {
        "sku": "2016-Datacenter", 
        "publisher": "MicrosoftWindowsServer", 
        "version": "latest", 
        "offer": "WindowsServer"
      }, 
      "osDisk": {
        "caching": "ReadWrite", 
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }, 
        "name": "myVMosdisk", 
        "createOption": "fromImage"
      }, 
      "dataDisks": [
        {
          "diskSizeGB": 1023, 
          "createOption": "Empty", 
          "lun": 0
        }, 
        {
          "diskSizeGB": 1023, 
          "createOption": "Empty", 
          "lun": 1
        }
      ]
    }, 
    "osProfile": {
      "adminUsername": "<your-username>", 
      "computerName": "myVM", 
      "adminPassword": "<your-password>"
    }, 
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/networkInterfaces/<existing-nic-name>", 
          "properties": {
            "primary": true
          }
        }
      ]
    }
  }, 
  "name": "myVM", 
  "location": "westus"
}
```



CREATE A VM WITH A MARKETPLACE IMAGE PLAN
=========================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM?api-version=2017-03-30

{
  "plan": {
    "publisher": "microsoft-ads", 
    "product": "windows-data-science-vm", 
    "name": "windows2016"
  }, 
  "properties": {
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    }, 
    "storageProfile": {
      "imageReference": {
        "sku": "windows2016", 
        "publisher": "microsoft-ads", 
        "version": "latest", 
        "offer": "windows-data-science-vm"
      }, 
      "osDisk": {
        "caching": "ReadWrite", 
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }, 
        "name": "myVMosdisk", 
        "createOption": "fromImage"
      }
    }, 
    "osProfile": {
      "adminUsername": "<your-username>", 
      "computerName": "myVM", 
      "adminPassword": "<your-password>"
    }, 
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/networkInterfaces/<existing-nic-name>", 
          "properties": {
            "primary": true
          }
        }
      ]
    }
  }, 
  "name": "myVM", 
  "location": "westus"
}
```



CREATE A VM FROM A CUSTOM IMAGE
===============================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM?api-version=2017-03-30

{
  "properties": {
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    }, 
    "storageProfile": {
      "imageReference": {
        "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Compute/images/<existing-custom-image-name>"
      }, 
      "osDisk": {
        "caching": "ReadWrite", 
        "managedDisk": {
          "storageAccountType": "Standard_LRS"
        }, 
        "name": "myVMosdisk", 
        "createOption": "fromImage"
      }
    }, 
    "osProfile": {
      "adminUsername": "<your-username>", 
      "computerName": "myVM", 
      "adminPassword": "<your-password>"
    }, 
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/networkInterfaces/<existing-nic-name>", 
          "properties": {
            "primary": true
          }
        }
      ]
    }
  }, 
  "name": "myVM", 
  "location": "westus"
}
```



CREATE A PLATFORM-IMAGE VM WITH UNMANAGED OS AND DATA DISKS
===========================================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM?api-version=2017-03-30

{
  "properties": {
    "hardwareProfile": {
      "vmSize": "Standard_D2_v2"
    }, 
    "storageProfile": {
      "imageReference": {
        "sku": "2016-Datacenter", 
        "publisher": "MicrosoftWindowsServer", 
        "version": "latest", 
        "offer": "WindowsServer"
      }, 
      "osDisk": {
        "caching": "ReadWrite", 
        "vhd": {
          "uri": "http://<existing-storage-account-name>.blob.core.windows.net/<existing-container-name>/myDisk.vhd"
        }, 
        "createOption": "fromImage", 
        "name": "myVMosdisk"
      }, 
      "dataDisks": [
        {
          "diskSizeGB": 1023, 
          "createOption": "Empty", 
          "lun": 0, 
          "vhd": {
            "uri": "http://<existing-storage-account-name>.blob.core.windows.net/<existing-container-name>/myDisk0.vhd"
          }
        }, 
        {
          "diskSizeGB": 1023, 
          "createOption": "Empty", 
          "lun": 1, 
          "vhd": {
            "uri": "http://<existing-storage-account-name>.blob.core.windows.net/<existing-container-name>/myDisk1.vhd"
          }
        }
      ]
    }, 
    "osProfile": {
      "adminUsername": "<your-username>", 
      "computerName": "myVM", 
      "adminPassword": "<your-password>"
    }, 
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/networkInterfaces/<existing-nic-name>", 
          "properties": {
            "primary": true
          }
        }
      ]
    }
  }, 
  "name": "myVM", 
  "location": "westus"
}
```



CREATE A CUSTOM-IMAGE VM FROM AN UNMANAGED GENERALIZED OS IMAGE
===============================================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM?api-version=2017-03-30

{
  "properties": {
    "hardwareProfile": {
      "vmSize": "Standard_D1_v2"
    }, 
    "storageProfile": {
      "osDisk": {
        "name": "myVMosdisk", 
        "image": {
          "uri": "http://<existing-storage-account-name>.blob.core.windows.net/<existing-container-name>/<existing-generalized-os-image-blob-name>.vhd"
        }, 
        "caching": "ReadWrite", 
        "createOption": "fromImage", 
        "osType": "Windows", 
        "vhd": {
          "uri": "http://<existing-storage-account-name>.blob.core.windows.net/<existing-container-name>/myDisk.vhd"
        }
      }
    }, 
    "osProfile": {
      "adminUsername": "<your-username>", 
      "computerName": "myVM", 
      "adminPassword": "<your-password>"
    }, 
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/networkInterfaces/<existing-nic-name>", 
          "properties": {
            "primary": true
          }
        }
      ]
    }
  }, 
  "name": "myVM", 
  "location": "westus"
}
```



CREATE A SCALE SET WITH PASSWORD AUTHENTICATION
===============================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "sku": "2016-Datacenter", 
          "publisher": "MicrosoftWindowsServer", 
          "version": "latest", 
          "offer": "WindowsServer"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }, 
          "createOption": "fromImage"
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A SCALE SET WITH SSH AUTHENTICATION
==========================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "sku": "2016-Datacenter", 
          "publisher": "MicrosoftWindowsServer", 
          "version": "latest", 
          "offer": "WindowsServer"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }, 
          "createOption": "fromImage"
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "linuxConfiguration": {
          "ssh": {
            "publicKeys": [
              {
                "path": "/home/<your-username>/.ssh/authorized_keys", 
                "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeClRAk2ipUs/l5voIsDC5q9RI+YSRd1Bvd/O+axgY4WiBzG+4FwJWZm/mLLe5DoOdHQwmU2FrKXZSW4w2sYE70KeWnrFViCOX5MTVvJgPE8ClugNl8RWth/tU849DvM9sT7vFgfVSHcAS2yDRyDlueii+8nF2ym8XWAPltFVCyLHRsyBp5YPqK8JFYIa1eybKsY3hEAxRCA+/7bq8et+Gj3coOsuRmrehav7rE6N12Pb80I6ofa6SM5XNYq4Xk0iYNx7R3kdz0Jj9XgZYWjAHjJmT0gTRoOnt6upOuxK7xI/ykWrllgpXrCPu3Ymz+c+ujaqcxDopnAl2lmf69/J1"
              }
            ]
          }, 
          "disablePasswordAuthentication": true
        }
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A SCALE SET WITH PREMIUM STORAGE
=======================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "sku": "2016-Datacenter", 
          "publisher": "MicrosoftWindowsServer", 
          "version": "latest", 
          "offer": "WindowsServer"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "managedDisk": {
            "storageAccountType": "Premium_LRS"
          }, 
          "createOption": "fromImage"
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A SCALE SET WITH EMPTY DATA DISKS ON EACH VM
===================================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D2_v2"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "sku": "2016-Datacenter", 
          "publisher": "MicrosoftWindowsServer", 
          "version": "latest", 
          "offer": "WindowsServer"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }, 
          "createOption": "fromImage"
        }, 
        "dataDisks": [
          {
            "diskSizeGB": 1023, 
            "createOption": "Empty", 
            "lun": 0
          }, 
          {
            "diskSizeGB": 1023, 
            "createOption": "Empty", 
            "lun": 1
          }
        ]
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A SCALE SET WITH AN AZURE LOAD BALANCER
==============================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "sku": "2016-Datacenter", 
          "publisher": "MicrosoftWindowsServer", 
          "version": "latest", 
          "offer": "WindowsServer"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }, 
          "createOption": "fromImage"
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }, 
                    "loadBalancerInboundNatPools": [
                      {
                        "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/loadBalancers/<existing-load-balancer-name>/inboundNatPools/<existing-nat-pool-name>"
                      }
                    ], 
                    "loadBalancerBackendAddressPools": [
                      {
                        "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/loadBalancers/<existing-load-balancer-name>/backendAddressPools/<existing-backend-address-pool-name>"
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A SCALE SET WITH AN AZURE APPLICATION GATEWAY
====================================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "sku": "2016-Datacenter", 
          "publisher": "MicrosoftWindowsServer", 
          "version": "latest", 
          "offer": "WindowsServer"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }, 
          "createOption": "fromImage"
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "applicationGatewayBackendAddressPools": [
                      {
                        "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/applicationGateways/<existing-application-gateway-name>/backendAddressPools/<existing-backend-address-pool-name>"
                      }
                    ], 
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A SCALE SET WITH A PUBLIC IP ADDRESS PER VM
==================================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "sku": "2016-Datacenter", 
          "publisher": "MicrosoftWindowsServer", 
          "version": "latest", 
          "offer": "WindowsServer"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }, 
          "createOption": "fromImage"
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }, 
                    "publicIpAddressConfiguration": {
                      "name": "pubip", 
                      "properties": {
                        "idleTimeoutInMinutes": 15
                      }
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A SCALE SET WITH BOOT DIAGNOSTICS
========================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "location": "westus", 
  "properties": {
    "diagnosticsProfile": {
      "bootDiagnostics": {
        "storageUri": "http://<existing-storage-account-name>.blob.core.windows.net", 
        "enabled": true
      }
    }, 
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "sku": "2016-Datacenter", 
          "publisher": "MicrosoftWindowsServer", 
          "version": "latest", 
          "offer": "WindowsServer"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }, 
          "createOption": "fromImage"
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A SCALE SET WITH A MARKETPLACE IMAGE PLAN
================================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "plan": {
    "publisher": "microsoft-ads", 
    "product": "windows-data-science-vm", 
    "name": "windows2016"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "sku": "windows2016", 
          "publisher": "microsoft-ads", 
          "version": "latest", 
          "offer": "windows-data-science-vm"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }, 
          "createOption": "fromImage"
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A SCALE SET FROM A CUSTOM IMAGE
======================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Compute/images/<existing-custom-image-name>"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "managedDisk": {
            "storageAccountType": "Standard_LRS"
          }, 
          "createOption": "fromImage"
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A PLATFORM-IMAGE SCALE SET WITH UNMANAGED OS DISKS
=========================================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "imageReference": {
          "sku": "2016-Datacenter", 
          "publisher": "MicrosoftWindowsServer", 
          "version": "latest", 
          "offer": "WindowsServer"
        }, 
        "osDisk": {
          "caching": "ReadWrite", 
          "createOption": "fromImage", 
          "name": "osDisk", 
          "vhdContainers": [
            "http://<existing-storage-account-name-0>.blob.core.windows.net/vhdContainer", 
            "http://<existing-storage-account-name-1>.blob.core.windows.net/vhdContainer", 
            "http://<existing-storage-account-name-2>.blob.core.windows.net/vhdContainer", 
            "http://<existing-storage-account-name-3>.blob.core.windows.net/vhdContainer", 
            "http://<existing-storage-account-name-4>.blob.core.windows.net/vhdContainer"
          ]
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```



CREATE A CUSTOM-IMAGE SCALE SET FROM AN UNMANAGED GENERALIZED OS IMAGE
======================================================================

```
PUT https://management.azure.com/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachineScaleSets/myVMSS?api-version=2017-03-30

{
  "sku": {
    "tier": "Standard", 
    "capacity": 3, 
    "name": "Standard_D1_v2"
  }, 
  "location": "westus", 
  "properties": {
    "overprovision": true, 
    "virtualMachineProfile": {
      "storageProfile": {
        "osDisk": {
          "caching": "ReadWrite", 
          "image": {
            "uri": "http://<existing-storage-account-name>.blob.core.windows.net/<existing-container-name>/<existing-generalized-os-image-blob-name>.vhd"
          }, 
          "createOption": "fromImage", 
          "name": "osDisk", 
          "vhdContainers": null
        }
      }, 
      "osProfile": {
        "computerNamePrefix": "myVMSS", 
        "adminUsername": "<your-username>", 
        "adminPassword": "<your-password>"
      }, 
      "networkProfile": {
        "networkInterfaceConfigurations": [
          {
            "name": "myVMSS", 
            "properties": {
              "primary": true, 
              "ipConfigurations": [
                {
                  "name": "myVMSS", 
                  "properties": {
                    "subnet": {
                      "id": "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<existing-virtual-network-name>/subnets/<existing-subnet-name>"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }, 
    "upgradePolicy": {
      "mode": "Manual"
    }
  }
}
```
