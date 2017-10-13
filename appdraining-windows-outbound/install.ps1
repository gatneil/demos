# get scripts to run on onstart and onstop
curl -UseBasicParsing https://raw.githubusercontent.com/gatneil/demos/master/appdraining-windows-outbound/onstart.ps1 | select -Expand Content >> C:\onstart.ps1
curl -UseBasicParsing https://raw.githubusercontent.com/gatneil/demos/master/appdraining-windows-outbound/onstop.ps1 | select -Expand Content >> C:\onstop.ps1

# create the necessary folder structure to register the scripts to run onstart/onstop
"[General]" >> C:\Windows\System32\GroupPolicy\gpt.ini
"gPCMachineExtensionNames=[{42B5FAAE-6536-11D2-AE5A-0000F87571E3}{40B6664F-4972-11D1-A7CA-0000F87571E3}]" >> C:\Windows\System32\GroupPolicy\gpt.ini
"Version=8" >> C:\Windows\System32\GroupPolicy\gpt.ini

mkdir C:\Windows\System32\GroupPolicy\Machine\Scripts\Shutdown
mkdir C:\Windows\System32\GroupPolicy\Machine\Scripts\Startup
mkdir C:\Windows\System32\GroupPolicy\User

"[Shutdown]" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini
"0CmdLine=C:\onstop.ps1 $args" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini
"0Parameters=" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini
"[Startup]" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini
"0CmdLine=C:\onstart.ps1 $args" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini
"0Parameters=" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\psscripts.ini

"" >> C:\Windows\System32\GroupPolicy\Machine\Scripts\scripts.ini

# update the Group Policy so the folder structure above has an actual effect
gpupdate