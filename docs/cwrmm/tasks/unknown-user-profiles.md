---
id: '93f21631-9100-46fc-864b-3af17bc91699'
slug: /93f21631-9100-46fc-864b-3af17bc91699
title: 'Unknown User Profiles'
title_meta: 'Unknown User Profiles'
keywords: ['user','profile','unknown','inferred']
description: 'This script identifies unknown user-profiles and generates a ticket containing their details. If the computer’s domain trust relationship is broken, the script will create a ticket indicating the broken trust relationship instead of listing unknown user profiles. Note that PowerShell 5 is required to run this script, and domain controllers are excluded from its scope.'
tags: ['security', 'setup']
draft: false
unlisted: false
---


## Summary

This Script identifies unknown user-profiles and generates a ticket containing their details. If the computer’s domain trust relationship is broken, the script will create a ticket indicating the broken trust relationship instead of listing unknown user profiles. Note that PowerShell 5 is required to run this script, and domain controllers are excluded from its scope.

## Sample Run

![Image1](../../../static/img/cwrmm-task-unknown-user-profiles/Image1.png)  
![Image2](../../../static/img/cwrmm-task-unknown-user-profiles/Image2.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Image3](../../../static/img/cwrmm-task-unknown-user-profiles/Image3.png)  
![Image4](../../../static/img/cwrmm-task-unknown-user-profiles/Image4.png)

**Name:** `Unknown User Profiles`  
**Description:** `This script identifies unknown user-profiles and generates a ticket containing their details. If the computer’s domain trust relationship is broken, the script will create a ticket indicating the broken trust relationship instead of listing unknown user profiles. Note that PowerShell 5 is required to run this script, and domain controllers are excluded from its scope.`  
**Category:** `Custom`  

![Image5](../../../static/img/cwrmm-task-unknown-user-profiles/Image5.png)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Image6](../../../static/img/cwrmm-task-unknown-user-profiles/image6.png)  

A blank function will appear.  
![Image7](../../../static/img/cwrmm-task-unknown-user-profiles/image7.png)

### Row 1 Function: Set Pre-defined Variable

- Search and select the `Set Pre-defined Variable` function
- **Variable:** `Computer`
- **System Variable:** `Endpoint` **>>** `Asset` **>>** `friendlyName`
- Click the `save` button to save the function.  

![Image8](../../../static/img/cwrmm-task-unknown-user-profiles/Image8.png)  
![Image9](../../../static/img/cwrmm-task-unknown-user-profiles/Image9.png)  
![Image10](../../../static/img/cwrmm-task-unknown-user-profiles/Image10.png) 


### Row 2 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Image11](../../../static/img/cwrmm-task-unknown-user-profiles/Image11.png) 

A blank function will appear.  
![Image7](../../../static/img/cwrmm-task-unknown-user-profiles/image7.png)  

Search and select the `Powershell Script` function.  
The following function will pop up on the screen:  
![Image12](../../../static/img/cwrmm-task-unknown-user-profiles/Image12.png) 

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
$response = Invoke-WebRequest -Uri $PS1URL -UseBasicParsing
if (($response.StatusCode -ne 200) -and (!(Test-Path -Path $PS1Path))) {
    throw "No pre-downloaded script exists and the script '$PS1URL' failed to download. Exiting."
} elseif ($response.StatusCode -eq 200) {
    Remove-Item -Path $PS1Path -ErrorAction SilentlyContinue
    [System.IO.File]::WriteAllLines($PS1Path, $response.Content)
}
if (!(Test-Path -Path $PS1Path)) {
    throw 'An error occurred and the script was unable to be downloaded. Exiting.'
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
![Image13](../../../static/img/cwrmm-task-unknown-user-profiles/Image13.png)  
![Image14](../../../static/img/cwrmm-task-unknown-user-profiles/Image14.png)  

### Row 3 Logic: If/Then/Else

Add a new `If/Then/Else logic` from the `Add Logic` dropdown menu  
![Image15](../../../static/img/cwrmm-task-unknown-user-profiles/Image15.png) 

A blank logic will appear  
![Image16](../../../static/img/cwrmm-task-unknown-user-profiles/Image16.png) 

### Row 3a Condition: Output Contains

Set the condition to: 

`Output` `Contains` `Domain Controllers are not Supported`  
`Or`  
`Output` `Contains` `No pre-downloaded script exists and the script`  
`Or`  
`Output` `Contains` `An error occurred and the script was unable to be downloaded`  
![Image17](../../../static/img/cwrmm-task-unknown-user-profiles/Image17.png)  

### Row 3b Function: Script Exit

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Image18](../../../static/img/cwrmm-task-unknown-user-profiles/Image18.png) 

A blank function will appear.  
![Image20](../../../static/img/cwrmm-task-unknown-user-profiles/Image20.png)  

Search and select the `Script Exit` function.  
The following function will pop up on the screen:  
![Image19](../../../static/img/cwrmm-task-unknown-user-profiles/Image19.png)  

Type `%Output%` in the `Error Message` and click the `Save` button to save the function.  
![Image21](../../../static/img/cwrmm-task-unknown-user-profiles/Image21.png)  
![Image22](../../../static/img/cwrmm-task-unknown-user-profiles/Image22.png)  

### Row 3c Logic: If/Then/Else

Add a new `If/Then/Else logic` from the `Add Logic` dropdown menu inside the `Else` section.  
![Image23](../../../static/img/cwrmm-task-unknown-user-profiles/Image23.png) 

A blank logic will appear  
![Image24](../../../static/img/cwrmm-task-unknown-user-profiles/Image24.png) 

### Row 3c(i) Condition: Output Contains

Set the condition to:

`Output` `Contains` `Domain Trust Relationship between the computer`  
![Image25](../../../static/img/cwrmm-task-unknown-user-profiles/Image25.png) 

### Row 3c(ii) Function: Create Ticket

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Image26](../../../static/img/cwrmm-task-unknown-user-profiles/Image26.png) 

A blank function will appear.  
![Image27](../../../static/img/cwrmm-task-unknown-user-profiles/Image27.png)  

Search and select the `Create Ticket` function.  
The following function will pop up on the screen:  
![Image28](../../../static/img/cwrmm-task-unknown-user-profiles/Image28.png)  

- **Subject:** `Domain Trust Relationship is broken for @Computer@`  
- **Description:**  
```
    %Output%

    Please resolve the problem to enable the unknown user profile auditing solution.
```  
- **Priority:** `Medium`  
- Click the `Save` button to save the function.  

![Image29](../../../static/img/cwrmm-task-unknown-user-profiles/Image29.png)  
![Image30](../../../static/img/cwrmm-task-unknown-user-profiles/Image30.png)

### Row 3c(iii) Function: Script Exit

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Image26](../../../static/img/cwrmm-task-unknown-user-profiles/Image26.png) 

A blank function will appear.  
![Image27](../../../static/img/cwrmm-task-unknown-user-profiles/Image27.png)  

Search and select the `Script Exit` function.  
The following function will pop up on the screen:  
![Image19](../../../static/img/cwrmm-task-unknown-user-profiles/Image19.png)  

Type `%Output%` in the `Error Message` and click the `Save` button to save the function.  
![Image21](../../../static/img/cwrmm-task-unknown-user-profiles/Image21.png)  
![Image22](../../../static/img/cwrmm-task-unknown-user-profiles/Image22.png)  

### Row 3c(iv) Logic: If/Then/Else

Add a new `If/Then/Else logic` from the `Add Logic` dropdown menu inside the internal `Else` section.  
![Image31](../../../static/img/cwrmm-task-unknown-user-profiles/Image31.png) 

A blank logic will appear  
![Image32](../../../static/img/cwrmm-task-unknown-user-profiles/Image32.png) 

### Row 3c(iv)(1) Condition: Output Contains

Set the condition to: 

`Output` `Contains` `Unknown user profiles detected on`  
![Image33](../../../static/img/cwrmm-task-unknown-user-profiles/Image33.png)

### Row 3c(iv)(2) Function: Create Ticket

Add a new row by clicking the `Add Row` button inside the innermost `If` section.  
![Image35](../../../static/img/cwrmm-task-unknown-user-profiles/Image35.png) 

A blank function will appear.  
![Image34](../../../static/img/cwrmm-task-unknown-user-profiles/Image34.png)  

Search and select the `Create Ticket` function.  
The following function will pop up on the screen:  
![Image28](../../../static/img/cwrmm-task-unknown-user-profiles/Image28.png)  

- **Subject:** `Unknown user profiles detected on @Computer@`  
- **Description:**  
```
    %Output%

    Please confirm that the identified user profiles are safe to remove from the computer.
```  
- **Priority:** `Medium`  
- Click the `Save` button to save the function.  

![Image36](../../../static/img/cwrmm-task-unknown-user-profiles/Image36.png)  
![Image37](../../../static/img/cwrmm-task-unknown-user-profiles/Image37.png)  

### Row 3c(iv)(3) Function: Script Log

Add a new row by clicking the `Add Row` button inside the innermost `If` section.  
![Image35](../../../static/img/cwrmm-task-unknown-user-profiles/Image35.png) 

A blank function will appear.  
![Image34](../../../static/img/cwrmm-task-unknown-user-profiles/Image34.png)  

Search and select the `Script Log` function.  
The following function will pop up on the screen:  
![Image38](../../../static/img/cwrmm-task-unknown-user-profiles/Image38.png)  

Type `%Output%` in the `Script Log Message` and click the `Save` button to save the function.  
![Image39](../../../static/img/cwrmm-task-unknown-user-profiles/Image39.png)  
![Image40](../../../static/img/cwrmm-task-unknown-user-profiles/Image40.png)  

### Row 3c(iv)(4) Function: Script Log

Add a new row by clicking the `Add Row` button inside the innermost `Else` section.  
![Image41](../../../static/img/cwrmm-task-unknown-user-profiles/Image41.png) 

A blank function will appear.  
![Image42](../../../static/img/cwrmm-task-unknown-user-profiles/Image42.png)  

Search and select the `Script Log` function.  
The following function will pop up on the screen:  
![Image38](../../../static/img/cwrmm-task-unknown-user-profiles/Image38.png)  

Type `%Output%` in the `Script Log Message` and click the `Save` button to save the function.  
![Image39](../../../static/img/cwrmm-task-unknown-user-profiles/Image39.png)  
![Image40](../../../static/img/cwrmm-task-unknown-user-profiles/Image40.png)  


### Save Task

Click the `Save` button at the top right corner of the screen to save the task.  
![Image43](../../../static/img/cwrmm-task-unknown-user-profiles/Image43.png)  

## Completed Task

![Image46](../../../static/img/cwrmm-task-unknown-user-profiles/Image46.png)  

## Deployment

It is suggested to run the Task once per week against [Unknown User Profiles Detection](/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec) group.

- Go to Automation > Tasks.
- Search for `Unknown User Profiles` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.  

![Image47](../../../static/img/cwrmm-task-unknown-user-profiles/Image47.png)  

The following screen will appear:  
![Image48](../../../static/img/cwrmm-task-unknown-user-profiles/Image48.png)  

Select the `Schedule` button and click the `calendar icon` to change the recurrence schedule.  
![Image49](../../../static/img/cwrmm-task-unknown-user-profiles/Image49.png)

Select the `Weeks` for the `Repeat`, set `M` for `Day`, and click the `OK` button to save the schedule.  
![Image50](../../../static/img/cwrmm-task-unknown-user-profiles/Image50.png) 

Click the `Select Targets` button to select the concerned target.  
![Image51](../../../static/img/cwrmm-task-unknown-user-profiles/Image51.png)  

Search and select the [Unknown User Profiles Detection](/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec) Device Group for the target.  
![Image52](../../../static/img/cwrmm-task-unknown-user-profiles/Image52.png)  

Click the `Run` button to initiate the schedule.  
![Image53](../../../static/img/cwrmm-task-unknown-user-profiles/Image53.png)  

## Output

- Script Log
- Ticket

### Sample Ticket

![Image54](../../../static/img/cwrmm-task-unknown-user-profiles/Image54.png)  
