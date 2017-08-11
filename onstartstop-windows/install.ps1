Initialize-Disk -Number 2 -PartitionStyle MBR
New-Partition -DiskNumber 2 -DriveLetter F -UseMaximumSize
Format-Volume -DriveLetter F -FileSystem NTFS -NewFileSystemLabel datadisk -Confirm:$false

curl -UseBasicParsing https://raw.githubusercontent.com/gatneil/demos/master/onstartstop-windows/onstart.ps1 | select -Expand Content >> C:\onstart.ps1
curl -UseBasicParsing https://raw.githubusercontent.com/gatneil/demos/master/onstartstop-windows/onstop.ps1 | select -Expand Content >> C:\onstop.ps1

"[General]" >> C:\Windows\System32\GroupPolicy\gpt.ini
"gPCMachineExtensionNames=[{42B5FAAE-6536-11D2-AE5A-0000F87571E3}{40B6664F-4972-11D1-A7CA-0000F87571E3}]" >> C:\Windows\System32\GroupPolicy\gpt.ini
"Version=8" >> C:\Windows\System32\GroupPolicy\gpt.ini

mkdir C:\Windows\System32\GroupPolicy\Machine\Scripts\Shutdown
mkdir C:\Windows\System32\GroupPolicy\Machine\Scripts\Startup
mkdir C:\Windows\System32\GroupPolicy\User

"[Shutdown]" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini
"0CmdLine=C:\onstop.ps1" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini
"0Parameters=" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini
"[Startup]" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini
"0CmdLine=C:\onstart.ps1" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini
"0Parameters=" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini

"" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\scripts.ini

gpupdate