Initialize-Disk -Number 2 -PartitionStyle MBR
New-Partition -DiskNumber 2 -DriveLetter F -UseMaximumSize
Format-Volume -DriveLetter F -FileSystem NTFS -NewFileSystemLabel datadisk -Confirm:$false

curl https://raw.githubusercontent.com/gatneil/demos/master/onstartstop-windows/onstart.ps1 >> C:\onstart.ps1
curl https://raw.githubusercontent.com/gatneil/demos/master/onstartstop-windows/onstop.ps1 >> C:\onstop.ps1