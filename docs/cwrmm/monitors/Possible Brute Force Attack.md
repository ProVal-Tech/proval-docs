---
id: 'rmm-possible-brute-force-attack-monitor'
title: 'Possible Brute Force Attack Monitor'
title_meta: 'Possible Brute Force Attack Monitor'
keywords: ['brute', 'force', 'attack', 'monitor', 'security', 'event', 'log', 'id', '4625']
description: 'This document outlines the steps to create a monitor that checks for security event log event ID 4625 where the count of occurrences exceeds a specified threshold in the last 60 minutes. It includes implementation details, dependencies, and ticketing information for alerts related to possible brute force attacks on endpoints.'
tags: ['active-directory', 'monitoring', 'security', 'alert', 'event-log']
draft: false
unlisted: false
---
## Summary

Check the computer for security event log event id 4625 where the count of occurrences is greater than 10 in the last 60 minutes.

The threshold can be modified by updating the value of the `$th` variable in the remote monitor's command.  
Change this value from 10 to the desired value after creating the monitor.

**The monitor set may not perform as expected for the PowerShell version older than 5.**

## Dependencies

- [CW RMM - Machine Group - Domain Controllers](https://proval.itglue.com/DOC-5078775-14036214)
- [CW RMM - Custom Field - Is Primary Domain Controller](https://proval.itglue.com/DOC-5078775-14036215)
- [CW RMM - Task - Validate Primary Domain Controller](https://proval.itglue.com/DOC-5078775-14036218)
- [CW RMM - Machine Group - Infrastructure Master](https://proval.itglue.com/DOC-5078775-14029455)

## Target

[Infrastructure Master](https://proval.itglue.com/DOC-5078775-14029455)  
![Image](..\..\..\static\img\Possible-Brute-Force-Attack\image_1.png)

## Implementation

1. From the left bar, select Endpoints → Alerts → Monitors  
   ![Image](..\..\..\static\img\Possible-Brute-Force-Attack\image_2.png)  
   Then Click 'Create Monitor'  
   ![Image](..\..\..\static\img\Possible-Brute-Force-Attack\image_3.png)

2. Fill in the mandatory columns on the left side
   - Name: Possible Brute Force Attack
   - Description: Check the computer for security event log event id 4625 where the count of occurrences is greater than 10 in the last 60 minutes.
   - Type: Script
   - Severity: Critical Impact Alerts
   - Family: Active Directory  
   ![Image](..\..\..\static\img\Possible-Brute-Force-Attack\image_4.png)

   ![Image](..\..\..\static\img\Possible-Brute-Force-Attack\image_5.png)  
   
   **Conditions:**
   - **Run script on:** Schedule
   - **Repeat every:** 1 Hour(s)
   - **Script Language:** PowerShell
   - **PowerShell Script:**
     ```powershell
     $ErroractionPreference = 'SilentlyContinue'
     $th = 10
     $hours = 1
     $StartTime = (Get-Date).Addhours(-$hours)
     $filter = @{LogName = 'Security'; ID = 4625; StartTime = $StartTime}
     $events = Get-WinEvent -FilterHashtable $filter
     $filteredEvents = $events | Where-Object { $_.Message -notmatch 'Logon Type:\\s+4' -and $_.Message -notmatch 'Logon Type:\\s+5' }
     $total = ($filteredEvents | Measure-Object).count
     if ($total -ge $th) {
         $groupedEvents = $filteredEvents | Where-Object { $_.Properties.Value -match '\\S' } | Group-Object  @{ Expression = { $_.Properties.Value } }, @{ Expression = { $_.Properties.Value } }
         $output = @()
         foreach ($group in $groupedEvents) {
             $ex = ([xml]$groupedEvents.Group[-1].ToXml()).Event
             $time = ([DateTime]$ex.System.TimeCreated.SystemTime).ToString('yyyy-MM-dd HH:mm:ss')
             $data = $ex.eventdata.data
             $e = [Ordered]@{}
             $data | ForEach-Object { $e[$_.Name] = $_.'#Text' }
             $procid = [Convert]::ToInt64($e.ProcessId, 16)
             $processStatus = if ($procid -gt 0 -and (Get-Process -Id $procid)) { 'Running' } else { 'Not Running' }
             $op = [pscustomObject]@{
                 UserName = $e.TargetUserName
                 UserSid = $e.TargetUserSid
                 Domain = $e.TargetDomainName
                 LogonType = $e.LogonType
                 WorkstationName = $e.WorkstationName
                 SourceIpAddress = $e.IpAddress
                 SourceIpPort = $e.IpPort
                 FailureStatus = $e.Status
                 FailureSubStatus = $e.SubStatus
                 callerProcessId = $procid
                 CallerProcessName = $e.ProcessName
                 CallerProcessStatus = $processStatus
                 LogonProcess = $e.LogonProcessName
                 AuthenticationPackage = $e.AuthenticationPackageName
                 TransmittedServices = $e.TransmittedServices
                 NTLMPackageName = $e.LmPackageName
                 KeyLength = $e.KeyLength
                 Occurrences = $group.Count
                 MostRecentDetection = $time
             }
             $output += $op
         }
         $firstLine = "$total failed logon event logs detected in the past $hours hour(s)`n"
         $staticInfo = @'
         Logon Type Reference Table:
         '@
         ```
     - **Criteria:** Contains
     - **Operator:** AND
     - **Script Output:** `failed logon event logs detected in the past`
     - **Escalate ticket on script failure:** Disabled
     - **Automatically resolve:** Disabled
     - **Monitor Output:** Generate Ticket

3. Select the target endpoints:
   - Click on Select Target:  
   ![Image](..\..\..\static\img\Possible-Brute-Force-Attack\image_6.png)

   - Then click on Device Group and then search for the word '[Infrastructure Master](https://proval.itglue.com/DOC-5078775-14029455)', and then select the group as shown below:  
   ![Image](..\..\..\static\img\Possible-Brute-Force-Attack\image_7.png)

## Completed Monitor

![Image](..\..\..\static\img\Possible-Brute-Force-Attack\image_8.png)

## Ticketing

**Subject:** Script Monitor - Possible Brute Force Attack is triggered on <Computer Name> (<Computer Name>) at the site <Company Name> - <Site Name>/ Priority - Emergency

**Example:** Script Monitor - Possible Brute Force Attack is triggered on DEV-Server2019DC (DEV-Server2019DC) at the site ProVal - Development / Priority - Emergency

**Sample Body:**

Company Name: ProVal - Development  
Site Name: ProVal - Development  
Resource - DEV-Server2019DC (DEV-Server2019DC)  
This issue observed at 2024-12-16 18:24:23  
Following are the Monitor details for the same:  
Monitor Name: Possible Brute Force Attack  
Monitor Description: Check the computer for security event log event id 4625 where the count of occurrences is greater than 10 in the last 60 minutes.  
Script Monitor has detected an issue on the endpoint, Please refer the details:  
Script Language: powershell  
Keyword detected:  
Script Output 6 failed logon event logs detected in the past 1 hour(s)  

UserName: Administrator  
UserSid: S-1-0-0  
Domain: PROVALDEV  
LogonType: 2  
WorkstationName: DEV-SERVER2019D  
SourceIpAddress: 127.0.0.1  
SourceIpPort: 0  
FailureStatus: 0xc000006d  
FailureSubStatus: 0xc000006a  
callerProcessId: 2088  
CallerProcessName: C:\Windows\System32\svchost.exe  
CallerProcessStatus: Running  
LogonProcess: User32  
AuthenticationPackage: Negotiate  
TransmittedServices: -  
NTLMPackageName: -  
KeyLength: 0  
Occurrences: 6  
MostRecentDetection: 2024-12-16 12:58:51  

Logon Type Reference Table:  
2: Interactive  
3: Network  
4: Batch  
5: Service  
7: Unlock  
8: NetworkCleartext  
9: NewCredentials  
10: RemoteInteractive  
11: CachedInteractive  

Failure Reason Reference Table:  
0XC000005E: There are currently no logon servers available to service the logon request.  
0xC0000064: User logon with misspelled or bad user account.  
0xC000006A: User logon with misspelled or bad password for critical accounts or service accounts.  
0XC000006D: This is either due to a bad username or authentication information for critical accounts or service accounts.  
0xC000006F: User logon outside authorized hours.  
0xC0000070: User logon from unauthorized workstation.  
0xC0000072: User logon to account disabled by administrator.  
0XC000015B: The user has not been granted the requested logon type (aka logon right) at this machine.  
0XC0000192: An attempt was made to logon, but the Netlogon service was not started.  
0xC0000193: User logon with expired account.  
0XC0000413: Logon Failure: The machine you are logging onto is protected by an authentication firewall. The specified account is not allowed to authenticate to the machine.  

Note: Compare FailureSubStatus (or FailureStatus if FailureSubStatus is not available) with the reference table mentioned above to identify the failure reason.  
For more detailed information: [Event 4625](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/event-4625)  

Action: Please get the issue reviewed by a technician.


