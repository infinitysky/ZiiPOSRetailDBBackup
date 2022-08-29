cd /d %~dp0
if not exist C:\Ziitech mkdir C:\Ziitech
if not exist C:\Ziitech\DBBackup mkdir C:\Ziitech\DBBackup
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
netsh advfirewall set currentprofile state on
net share DBBackup=C:\Ziitech\DBBackup
exit
