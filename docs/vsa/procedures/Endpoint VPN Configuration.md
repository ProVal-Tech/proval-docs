---
id: '9a19342e-1fd7-4e68-b54a-6831f8eef5b8'
title: 'Endpoint VPN Configuration'
title_meta: 'Endpoint VPN Configuration'
keywords: ['vpn', 'configuration', 'shortcut', 'gateway', 'tunneling', 'credentials', 'network']
description: 'This document details the configuration of a VPN on endpoints using Managed Variable data, addressing various use cases such as additional connection gateways, Split Tunneling, and credential memory. It also outlines the creation of a desktop shortcut for user convenience.'
tags: ['networking', 'security', 'setup', 'vpn']
draft: false
unlisted: false
---

## Summary

This document configures a VPN on the endpoint based on Managed Variable data. It handles several use cases such as additional connection gateways, Split Tunneling, credential memory, etc. A shortcut is created on the endpoint desktop for all users to easily connect to the VPN.

## Example Agent Procedure Log

```
2:17:29 pm 13-Jan-23   Endpoint VPN Configuration   Success THEN   provaltech.com/dan.hicks
2:17:29 pm 13-Jan-23   Endpoint VPN Configuration       provaltech.com/dan.hicks
2:17:29 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)   Success THEN   provaltech.com/dan.hicks
2:17:29 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.   provaltech.com/dan.hicks
2:17:29 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//229175768944442//GetFiles//..//docs//psoutput.txt with the new contents from c://provaltech//psoutput.txt in THEN step 3.   provaltech.com/dan.hicks
2:17:22 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0011   Executing 64-bit Powershell command as System: "" -command "$shortcutArgs = '""""GNW VPN1""""'; $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut(""$env:SystemDrive//Users//Public//Desktop//GNW VPN1.lnk""); $Shortcut.TargetPath = ""$env:SystemDrive//Windows//system32//Rasdial.exe""; $Shortcut.Arguments = $shortcutArgs; $Shortcut.IconLocation = ""$env:ProgramData//_automation//AgentProcedure//VpnSetup//vpnIcon.ico""; $Shortcut.Save()" >"c://provaltech//psoutputtmp.txt"   provaltech.com/dan.hicks
2:17:22 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0013   Sending output to global variable.   provaltech.com/dan.hicks
2:17:21 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0008   Custom commands detected as $shortcutArgs = '""""GNW VPN1""""'; $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut(""$env:SystemDrive//Users//Public//Desktop//GNW VPN1.lnk""); $Shortcut.TargetPath = ""$env:SystemDrive//Windows//system32//Rasdial.exe""; $Shortcut.Arguments = $shortcutArgs; $Shortcut.IconLocation = ""$env:ProgramData//_automation//AgentProcedure//VpnSetup//vpnIcon.ico""; $Shortcut.Save()   provaltech.com/dan.hicks
2:17:21 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0003   No powershell file variable detected.   provaltech.com/dan.hicks
2:17:14 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0002   Powershell is present.   provaltech.com/dan.hicks
2:17:11 pm 13-Jan-23   Endpoint VPN Configuration-0003       provaltech.com/dan.hicks
2:17:11 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)   Success THEN   provaltech.com/dan.hicks
2:17:10 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.   provaltech.com/dan.hicks
2:17:10 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//229175768944442//GetFiles//..//docs//psoutput.txt with the new contents from c://provaltech//psoutput.txt in THEN step 3.   provaltech.com/dan.hicks
2:16:59 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0011   Executing 64-bit Powershell command as System: "" -command "Add-VPNConnectionRoute -ConnectionName 'GNW VPN1' -DestinationPrefix '10.10.5.0/24' -AllUserConnection" >"c://provaltech//psoutputtmp.txt"   provaltech.com/dan.hicks
2:16:59 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0013   Sending output to global variable.   provaltech.com/dan.hicks
2:16:59 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0008   Custom commands detected as Add-VPNConnectionRoute -ConnectionName 'GNW VPN1' -DestinationPrefix '10.10.5.0/24' -AllUserConnection   provaltech.com/dan.hicks
2:16:59 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0003   No powershell file variable detected.   provaltech.com/dan.hicks
2:16:52 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0002   Powershell is present.   provaltech.com/dan.hicks
2:16:48 pm 13-Jan-23   Endpoint VPN Configuration-0001   WARNING: The currently selected encryption level requires EAP or MS-CHAPv2 logon security methods. Data encryption will not occur for PAP or CHAP.   provaltech.com/dan.hicks
2:16:48 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)   Success THEN   provaltech.com/dan.hicks
2:16:47 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.   provaltech.com/dan.hicks
2:16:35 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0011   Executing 64-bit Powershell command as System: "" -command "Set-VPNConnection -Name 'GNW VPN1' -SplitTunneling $true -AllUserConnection" >"c://provaltech//psoutputtmp.txt"   provaltech.com/dan.hicks
2:16:35 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0013   Sending output to global variable.   provaltech.com/dan.hicks
2:16:35 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0008   Custom commands detected as Set-VPNConnection -Name 'GNW VPN1' -SplitTunneling $true -AllUserConnection   provaltech.com/dan.hicks
2:16:35 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0003   No powershell file variable detected.   provaltech.com/dan.hicks
2:16:26 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0002   Powershell is present.   provaltech.com/dan.hicks
2:16:23 pm 13-Jan-23   Endpoint VPN Configuration   WARNING: The currently selected encryption level requires EAP or MS-CHAPv2 logon security methods. Data encryption will not occur for PAP or CHAP.   provaltech.com/dan.hicks
2:16:23 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)   Success THEN   provaltech.com/dan.hicks
2:16:22 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.   provaltech.com/dan.hicks
2:16:22 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//229175768944442//GetFiles//..//docs//psoutput.txt with the new contents from c://provaltech//psoutput.txt in THEN step 3.   provaltech.com/dan.hicks
2:16:10 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0011   Executing 64-bit Powershell command as System: "" -command "Set-VPNConnection -Name 'GNW VPN1' -ServerAddress 'vpn.groffnetworks.com' -TunnelType 'L2TP' -L2tpPsk '9rbXUXxf3b6rjed' -DnsSuffix 'groffnetworks.local' -AuthenticationMethod 'PAP' -EncryptionLevel 'Optional' -AllUserConnection -Force" >"c://provaltech//psoutputtmp.txt"   provaltech.com/dan.hicks
2:16:07 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0013   Sending output to global variable.   provaltech.com/dan.hicks
2:16:07 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0008   Custom commands detected as Set-VPNConnection -Name 'GNW VPN1' -ServerAddress 'vpn.groffnetworks.com' -TunnelType 'L2TP' -L2tpPsk '9rbXUXxf3b6rjed' -DnsSuffix 'groffnetworks.local' -AuthenticationMethod 'PAP' -EncryptionLevel 'Optional' -AllUserConnection -Force   provaltech.com/dan.hicks
2:16:07 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0003   No powershell file variable detected.   provaltech.com/dan.hicks
2:16:01 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0002   Powershell is present.   provaltech.com/dan.hicks
2:15:59 pm 13-Jan-23   Endpoint VPN Configuration       provaltech.com/dan.hicks
2:15:59 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)   Success THEN   provaltech.com/dan.hicks
2:15:57 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.   provaltech.com/dan.hicks
2:15:56 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//229175768944442//GetFiles//..//docs//psoutput.txt with the new contents from c://provaltech//psoutput.txt in THEN step 3.   provaltech.com/dan.hicks
2:15:40 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0011   Executing 64-bit Powershell command as System: "" -command "Add-VPNConnection -Name 'GNW VPN1' -ServerAddress 'vpn.groffnetworks.com' -AllUserConnection -Force" >"c://provaltech//psoutputtmp.txt"   provaltech.com/dan.hicks
2:15:40 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0013   Sending output to global variable.   provaltech.com/dan.hicks
2:15:40 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0008   Custom commands detected as Add-VPNConnection -Name 'GNW VPN1' -ServerAddress 'vpn.groffnetworks.com' -AllUserConnection -Force   provaltech.com/dan.hicks
2:15:40 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0003   No powershell file variable detected.   provaltech.com/dan.hicks
2:15:33 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0002   Powershell is present.   provaltech.com/dan.hicks
2:15:31 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)   Success THEN   provaltech.com/dan.hicks
2:15:30 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0014   Powershell command completed!   provaltech.com/dan.hicks
2:15:18 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0011   Executing 64-bit Powershell command as System: "" -command "Remove-VpnConnection -Name 'GNW VPN1' -force -erroraction silentlycontinue" ""   provaltech.com/dan.hicks
2:15:18 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0013   Not sending output to variable.   provaltech.com/dan.hicks
2:15:18 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0008   Custom commands detected as Remove-VpnConnection -Name 'GNW VPN1' -force -erroraction silentlycontinue   provaltech.com/dan.hicks
2:15:18 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0003   No powershell file variable detected.   provaltech.com/dan.hicks
2:15:11 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0002   Powershell is present.   provaltech.com/dan.hicks
2:15:09 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)   Success THEN   provaltech.com/dan.hicks
2:15:09 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0014   Powershell command completed!   provaltech.com/dan.hicks
2:15:03 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0011   Executing 64-bit Powershell command as System: "" -command "New-Item -Type Directory -Path %ProgramData%//_automation//AgentProcedure -Name VpnSetup" ""   provaltech.com/dan.hicks
2:15:03 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0013   Not sending output to variable.   provaltech.com/dan.hicks
2:15:03 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0008   Custom commands detected as New-Item -Type Directory -Path %ProgramData%//_automation//AgentProcedure -Name VpnSetup   provaltech.com/dan.hicks
2:15:03 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0003   No powershell file variable detected.   provaltech.com/dan.hicks
2:14:52 pm 13-Jan-23   Execute Powershell Command (64-bit, Run As System)-0002   Powershell is present.   provaltech.com/dan.hicks
2:14:39 pm 13-Jan-23   Run Now - Endpoint VPN Configuration   Admin provaltech.com/dan.hicks scheduled procedure Run Now - Endpoint VPN Configuration to run at Jan 13 2023 2:14PM  
```

## Dependencies

- `vpnIcon.ico` saved to the environment's Managed Files directory
- VPN Connection data from the client saved to Managed Variables:
  - `VPN_NAME` (string)
  - `VPN_SERVER_ADDRESS` (string: URI or IP address)
  - `VPN_SPLIT_TUNNEL_ENABLE` (1 or 0)
  - `VPN_L2TPPSK` (string: PSK)
  - `VPN_DNS_SUFFIX` (string: URI)
  - `VPN_REMEMBERCREDENTIAL` (1 or 0)
  - `VPN_CONNECTION_ROUTE_1` (string: IP address)
  - `VPN_CONNECTION_ROUTE_2` (string: IP address)
  - `VPN_CONNECTION_ROUTE_3` (string: IP address)

## Process

Data must be manually populated in the Managed Variables for the endpoint's group before this procedure will be successful.

1. The agent procedure creates the directory to contain the shortcut icon.
2. The agent procedure removes any currently existing AllUser scoped VPNs of the same name.
3. The agent procedure creates the basic VPN object.
4. The agent procedure uses `Set-VpnConnection` to set the properties of the connection, including any optional parameters flagged in the associated managed variables.
5. The agent procedure sets the desktop shortcut using `rasphone -d <VPN_NAME>`.

## Output

- `$env:SystemDrive//Users//Public//Desktop//<VPN_NAME>.lnk`
- Agent Procedure log
