@echo off
:: Configuration Variables
set "ifName=Ethernet 2"
set ipAddress=10.88.167.35
set subnetMask=255.255.255.240
set vlanID=702

:: set defaultGateway=x.x.x.x
:: set primaryDNS=x.x.x.x
:: set alternateDNS=x.x.x.x

:: Change of IP address and NetMask ::
netsh interface ipv4 set address name="%ifName%" source=static addr=%ipAddress% mask=%subnetMask%
:: netsh interface ipv4 set dns "%ifName%" static %primaryDNS%
:: netsh interface ipv4 add dns "%ifName%" %alternateDNS% index=2

:: Disable ::
:: netsh interface set interface "%ifName%" DISABLED

:: Change VLAN ID ::
powershell -Command "& {Set-NetAdapter -Name '%ifName%' -VlanID %vlanID% -Confirm:$false}"
echo The VLAN ID of %ifName% has been successfully changed to %vlanID%

:: Enable ::
:: netsh interface set interface "%ifName%" ENABLED
powershell -command "Start-Sleep -s 5"
:: pause > null