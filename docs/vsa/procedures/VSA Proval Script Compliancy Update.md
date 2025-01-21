---
id: 'a62d8c2e-ca6e-4f12-98d3-4f26783cb701'
title: 'ProVal Script Compatibility Check'
title_meta: 'ProVal Script Compatibility Check'
keywords: ['compatibility', 'proval', 'os', 'windows', 'mac']
description: 'This document outlines the compatibility requirements for ProVal content on Mac and PC, detailing the necessary OS versions and PowerShell requirements for successful execution. It includes example logs from agent procedures, dependencies, and the processing steps involved in determining compatibility.'
tags: ['performance', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document checks compatibility requirements for ProVal content on Mac and PC. OS requirements are set based on contract standards of OS(n-2).

**Windows:** PowerShell 5+, OS > 7 / 2008  
**Mac:** Version > 11

## Example Agent Procedure Log

```
11:52:32 am 17-Nov-22   ProVal Script Compatibility Update   Success THEN   provaltech.com/dan.hicks  
11:52:32 am 17-Nov-22   ProVal Script Compatibility Update-0006   Compatibility Check Results: Compatible   provaltech.com/dan.hicks  
11:52:32 am 17-Nov-22   ProVal Script Compatibility Update   Informational: Call Function task in THEN step 5 was ignored because the client machine is running Win11, which does not meet the Mac OS X OS type criteria. (Line 18)   provaltech.com/dan.hicks  
11:52:32 am 17-Nov-22   ProVal Script Compatibility Update-0002   5   provaltech.com/dan.hicks  
11:52:32 am 17-Nov-22   Execute PowerShell Command (32-bit, Run As System)   Success THEN   provaltech.com/dan.hicks  
11:52:32 am 17-Nov-22   Execute PowerShell Command (32-bit, Run As System)-0016   PowerShell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.   provaltech.com/dan.hicks  
11:52:32 am 17-Nov-22   Execute PowerShell Command (32-bit, Run As System)-0016   Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/735959849026022/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3.   provaltech.com/dan.hicks  
11:52:28 am 17-Nov-22   Execute PowerShell Command (32-bit, Run As System)-0011   Executing 32-bit PowerShell command as System: "" -command "$PSVersionTable.PsVersion.Major" >"c:/provaltech/psoutputtmp.txt"   provaltech.com/dan.hicks  
11:52:28 am 17-Nov-22   Execute PowerShell Command (32-bit, Run As System)-0013   Sending output to global variable.   provaltech.com/dan.hicks  
11:52:28 am 17-Nov-22   Execute PowerShell Command (32-bit, Run As System)-0008   Custom commands detected as $PSVersionTable.PsVersion.Major   provaltech.com/dan.hicks  
11:52:28 am 17-Nov-22   Execute PowerShell Command (32-bit, Run As System)-0003   No PowerShell file variable detected.   provaltech.com/dan.hicks  
11:52:27 am 17-Nov-22   Execute PowerShell Command (32-bit, Run As System)-0002   PowerShell is present.   provaltech.com/dan.hicks  
11:52:26 am 17-Nov-22   ProVal Script Compatibility Update   Comment at THEN step 3   provaltech.com/dan.hicks  
11:52:26 am 17-Nov-22   Execute PowerShell Command   Success THEN   provaltech.com/dan.hicks  
11:52:25 am 17-Nov-22   Execute PowerShell Command-0012   Results returned to global variable #global:psresult# and saved in Documents tab of server.   provaltech.com/dan.hicks  
11:52:25 am 17-Nov-22   Execute PowerShell Command-0012   Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/735959849026022/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2.   provaltech.com/dan.hicks  
11:52:25 am 17-Nov-22   Execute PowerShell Command-0011   PowerShell command completed!   provaltech.com/dan.hicks  
11:52:22 am 17-Nov-22   Execute PowerShell Command-0011   Executing PowerShell "" -Command "(Get-CIMInstance -Classname Win32_OperatingSystem).name" >"c:/provaltech/psoutput.txt"   provaltech.com/dan.hicks  
11:52:22 am 17-Nov-22   Execute PowerShell Command-0010   Sending output to global variable.   provaltech.com/dan.hicks  
11:52:22 am 17-Nov-22   Execute PowerShell Command-0008   New command variable is: -Command "(Get-CIMInstance -Classname Win32_OperatingSystem).name"   provaltech.com/dan.hicks  
11:52:22 am 17-Nov-22   Execute PowerShell Command-0008   Custom commands detected as (Get-CIMInstance -Classname Win32_OperatingSystem).name   provaltech.com/dan.hicks  
11:52:20 am 17-Nov-22   Execute PowerShell Command-0002   PowerShell is present.   provaltech.com/dan.hicks  
11:52:12 am 17-Nov-22   Run Now - ProVal Script Compatibility Update   Admin provaltech.com/dan.hicks scheduled procedure Run Now - ProVal Script Compatibility Update to run at Nov 17 2022 11:52 AM   provalt
```

## Dependencies

All content listed in [EPM - Data Collection - Solution - VSA ProVal Script Compliancy](<../../solutions/VSA Proval Script Compliancy.md>)

## Process

- **Windows**
  - Gets the OS Name from Win32_OperatingSystem
  - Gets the OS Build version from the registry
  - If Build > 7601
    - If Name != Windows 7
      - Checks PowerShell version
      - If PSVersionTable.PSVersion.Major > 5
        - Write 'Compatible' to CF
      - else Write 'PowerShell Version Out of Date.' to CF
    - else Write 'Endpoint is Windows 7' to CF
  - else Write 'Windows OS Out of Date' to CF

- **Mac**
  - Get `sw_vers` info and parse out the major build number
  - If OS > 11
    - Write 'Compatible' to CF
  - else Write 'MacOS Out of Date' to CF

## Output

- [EPM - Data Collection - Custom Field - xPVAL ProVal Compatible Endpoint](<../custom-fields/xPVAL ProVal Compatible Endpoint.md>)
- Agent Procedure Log
- PSResult
- CMDResults

