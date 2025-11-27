---
id: '93f21631-9100-46fc-864b-3af17bc91699'
slug: /93f21631-9100-46fc-864b-3af17bc91699
title: 'Unknown User Profiles'
title_meta: 'Unknown User Profiles'
keywords: ['user','profile','unknown','inferred']
description: 'This script identifies unknown user-profiles and generates a ticket containing their details. If the computer's domain trust relationship is broken, the script will create a ticket indicating the broken trust relationship instead of listing unknown user profiles. Note that PowerShell 5 is required to run this script, and domain controllers are excluded from its scope.'
tags: ['security', 'setup']
draft: false
unlisted: false
---


## Summary

This Script identifies unknown user-profiles and generates a ticket containing their details. If the computer's domain trust relationship is broken, the script will create a ticket indicating the broken trust relationship instead of listing unknown user profiles. Note that PowerShell 5 is required to run this script, and domain controllers are excluded from its scope.

## Sample Run

![Image1](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image1.webp)  
![Image2](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image2.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Image3](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image3.webp)  
![Image4](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image4.webp)

**Name:** `Unknown User Profiles`  
**Description:** `This script identifies unknown user-profiles and generates a ticket containing their details. If the computer's domain trust relationship is broken, the script will create a ticket indicating the broken trust relationship instead of listing unknown user profiles. Note that PowerShell 5 is required to run this script, and domain controllers are excluded from its scope.`  
**Category:** `Custom`  

![Image5](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image5.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Image6](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/image6.webp)  

A blank function will appear.  
![Image7](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/image7.webp)

### Row 1 Function: Set Pre-defined Variable

- Search and select the `Set Pre-defined Variable` function
- **Variable:** `Computer`
- **System Variable:** `Endpoint` **>>** `Asset` **>>** `friendlyName`
- Click the `save` button to save the function.  

![Image8](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image8.webp)  
![Image9](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image9.webp)  
![Image10](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image10.webp)

### Row 2 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Image11](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image11.webp)

A blank function will appear.  
![Image7](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/image7.webp)  

Search and select the `Powershell Script` function.  
The following function will pop up on the screen:  
![Image12](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image12.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `1800` seconds. Click the `Save` button.

```PowerShell
#requires -Version 5

[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
#domain Controller check
$domainRole = (Get-CimInstance -Class Win32_ComputerSystem -ErrorAction SilentlyContinue).domainrole
if ($domainRole -in (4, 5)) {
    throw 'Domain Controllers are not supported.'
}
#domain Trust Relationship Validation
if ($domainRole -in (2, 3)) {
    try {
        $domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
    } catch {
        return "Domain Trust Relationship between the computer ($Env:ComputerName) and it's domain ($env:userdomain) is broken. Error: $($Error[0].Exception.Message)"
    }
}
#region Setup - Variables
$ErrorActionPreference = 'SilentlyContinue'
$ProjectName = 'Get-UserProfiles'
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
#endregion
#region Setup - Folder Structure
New-Item -Path $WorkingDirectory -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
try {
    Invoke-WebRequest -Uri $PS1URL -OutFile $PS1path -UseBasicParsing -ErrorAction Stop
} catch {
    if (!(Test-Path -Path $PS1Path )) {
        throw ('Failed to download the script from ''{0}'', and no local copy of the script exists on the machine. Reason: {1}' -f $PS1URL, $($Error[0].Exception.Message))
    }
}
#endregion
#region Execution
$output = & $PS1Path
#endregion
#region Output
$inferredProfiles = $output | Where-Object { $_.UserName -match 'Inferred' }
if ( $inferredProfiles ) {
    Write-Output "$($inferredProfiles.count) Unknown user profiles detected on $Env:ComputerName.`nDetails:`n"
    $inferredProfiles
} else {
    return 'No Inferred profiles detected'
}
#endregion
```  
![Image13](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image13.webp)  
![Image14](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image14.webp)  

### Row 3 Logic: If/Then/Else

Add a new `If/Then/Else logic` from the `Add Logic` dropdown menu  
![Image15](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image15.webp) 

A blank logic will appear  
![Image16](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image16.webp) 

### Row 3a Condition: Output Contains

Set the condition to: 

`Output` `Contains` `Domain Controllers are not Supported`  
`Or`  
`Output` `Contains` `No pre-downloaded script exists and the script`  
`Or`  
`Output` `Contains` `An error occurred and the script was unable to be downloaded`  
![Image17](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image17.webp)  

### Row 3b Function: Script Exit

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Image18](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image18.webp) 

A blank function will appear.  
![Image20](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image20.webp)  

Search and select the `Script Exit` function.  
The following function will pop up on the screen:  
![Image19](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image19.webp)  

Type `%Output%` in the `Error Message` and click the `Save` button to save the function.  
![Image21](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image21.webp)  
![Image22](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image22.webp)  

### Row 3c Logic: If/Then/Else

Add a new `If/Then/Else logic` from the `Add Logic` dropdown menu inside the `Else` section.  
![Image23](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image23.webp) 

A blank logic will appear  
![Image24](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image24.webp) 

### Row 3c(i) Condition: Output Contains

Set the condition to:

`Output` `Contains` `Domain Trust Relationship between the computer`  
![Image25](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image25.webp) 

### Row 3c(ii) Function: Create Ticket

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Image26](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image26.webp) 

A blank function will appear.  
![Image27](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image27.webp)  

Search and select the `Create Ticket` function.  
The following function will pop up on the screen:  
![Image28](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image28.webp)  

- **Subject:** `Domain Trust Relationship is broken for @Computer@`  
- **Description:**  
```
    %Output%

    Please resolve the problem to enable the unknown user profile auditing solution.
```  
- **Priority:** `Medium`  
- Click the `Save` button to save the function.  

![Image29](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image29.webp)  
![Image30](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image30.webp)

### Row 3c(iii) Function: Script Exit

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Image26](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image26.webp) 

A blank function will appear.  
![Image27](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image27.webp)  

Search and select the `Script Exit` function.  
The following function will pop up on the screen:  
![Image19](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image19.webp)  

Type `%Output%` in the `Error Message` and click the `Save` button to save the function.  
![Image21](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image21.webp)  
![Image22](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image22.webp)  

### Row 3c(iv) Logic: If/Then/Else

Add a new `If/Then/Else logic` from the `Add Logic` dropdown menu inside the internal `Else` section.  
![Image31](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image31.webp) 

A blank logic will appear  
![Image32](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image32.webp) 

### Row 3c(iv)(1) Condition: Output Contains

Set the condition to:

`Output` `Contains` `Unknown user profiles detected on`  
![Image33](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image33.webp)

### Row 3c(iv)(2) Function: Create Ticket

Add a new row by clicking the `Add Row` button inside the innermost `If` section.  
![Image35](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image35.webp) 

A blank function will appear.  
![Image34](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image34.webp)  

Search and select the `Create Ticket` function.  
The following function will pop up on the screen:  
![Image28](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image28.webp)  

- **Subject:** `Unknown user profiles detected on @Computer@`  
- **Description:**

```Shell
    %Output%

    Please confirm that the identified user profiles are safe to remove from the computer.
```  

- **Priority:** `Medium`  

- Click the `Save` button to save the function.  

![Image36](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image36.webp)  
![Image37](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image37.webp)  

### Row 3c(iv)(3) Function: Script Log

Add a new row by clicking the `Add Row` button inside the innermost `If` section.  
![Image35](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image35.webp) 

A blank function will appear.  
![Image34](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image34.webp)  

Search and select the `Script Log` function.  
The following function will pop up on the screen:  
![Image38](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image38.webp)  

Type `%Output%` in the `Script Log Message` and click the `Save` button to save the function.  
![Image39](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image39.webp)  
![Image40](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image40.webp)  

### Row 3c(iv)(4) Function: Script Log

Add a new row by clicking the `Add Row` button inside the innermost `Else` section.  
![Image41](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image41.webp) 

A blank function will appear.  
![Image42](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image42.webp)  

Search and select the `Script Log` function.  
The following function will pop up on the screen:  
![Image38](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image38.webp)  

Type `%Output%` in the `Script Log Message` and click the `Save` button to save the function.  
![Image39](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image39.webp)  
![Image40](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image40.webp)  

### Save Task

Click the `Save` button at the top right corner of the screen to save the task.  
![Image43](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image43.webp)  

## Completed Task

![Image46](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image46.webp)  

## Deployment

It is suggested to run the Task once per week against [Unknown User Profiles Detection](/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec) group.

- Go to Automation > Tasks.
- Search for `Unknown User Profiles` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.  

![Image47](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image47.webp)  

The following screen will appear:  
![Image48](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image48.webp)  

Select the `Schedule` button and click the `calendar icon` to change the recurrence schedule.  
![Image49](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image49.webp)

Select the `Weeks` for the `Repeat`, set `M` for `Day`, and click the `OK` button to save the schedule.  
![Image50](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image50.webp) 

Click the `Select Targets` button to select the concerned target.  
![Image51](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image51.webp)  

Search and select the [Unknown User Profiles Detection](/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec) Device Group for the target.  
![Image52](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image52.webp)  

Click the `Run` button to initiate the schedule.  
![Image53](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image53.webp)  

## Output

- Script Log
- Ticket

### Sample Ticket

![Image54](../../../static/img/docs/93f21631-9100-46fc-864b-3af17bc91699/Image54.webp)  