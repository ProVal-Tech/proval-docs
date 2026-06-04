---
id: 'b1a55519-7ad5-42bb-a43f-24bfb5ac8ee8'
slug: /b1a55519-7ad5-42bb-a43f-24bfb5ac8ee8
title: 'Disable Personal OneDrive Sync'
title_meta: 'Disable Personal OneDrive Sync'
keywords: ['onedrive', 'sync']
description: 'Disables personal Microsoft OneDrive account synchronization for all users on the machine.'
tags: ['onedrive']
draft: false
unlisted: false
last_update:
  date: 2026-06-04
---

## Summary
Disables personal Microsoft OneDrive account synchronization for all users on the machine.

## Sample Run

![Image](../../../static/img/docs/b1a55519-7ad5-42bb-a43f-24bfb5ac8ee8/image4.webp) 

## Task Creation

### Script Details

#### Step 1

Navigate to `Automation` ➞ `Tasks`  
![step1](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step1.webp)

#### Step 2

Create a new `Script Editor` style task by choosing the `Script Editor` option from the `Add` dropdown menu  
![step2](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step2.webp)

The `New Script` page will appear on clicking the `Script Editor` button:  
![step3](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step3.webp)

#### Step 3

Fill in the following details in the `Description` section:  

**Name:** `Disable Personal OneDrive Sync`  
**Description:** `Disables personal Microsoft OneDrive account synchronization for all users on the machine.`  
**Category:** `Custom`

![Image](../../../static/img/docs/b1a55519-7ad5-42bb-a43f-24bfb5ac8ee8/image1.webp) 


#### Row 1 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  
 
![PowerShell Function Selected](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
<#
.SYNOPSIS
Disables personal Microsoft OneDrive account synchronization for all users on the machine.

.DESCRIPTION
This script configures the OneDrive policy setting 'DisablePersonalSync'
under HKLM:\SOFTWARE\Policies\Microsoft\OneDrive.

By applying the policy at the machine level, the restriction applies to all
existing users and any future users who log on to the device.

The script creates the required registry path if it does not exist and sets
the DisablePersonalSync DWORD value to 1.

.NOTES
Registry Path:
HKLM:\SOFTWARE\Policies\Microsoft\OneDrive

Registry Value:
DisablePersonalSync (DWORD)

Value Meanings:
0 = Allow personal OneDrive accounts
1 = Prevent personal OneDrive accounts

.REQUIREMENTS
- Administrative privileges.
- Windows system with Microsoft OneDrive installed or managed.
#>

$registryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive'

try {
    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force -ErrorAction Stop | Out-Null
    }

    New-ItemProperty `
        -Path $registryPath `
        -Name 'DisablePersonalSync' `
        -PropertyType DWord `
        -Value 1 `
        -Force `
        -ErrorAction Stop | Out-Null

    return 'Success - DisablePersonalSync has been configured for all users.'
}
catch {
    throw "Failed to configure DisablePersonalSync policy. Error: $($_.Exception.Message)"
}
```

![Image](../../../static/img/docs/b1a55519-7ad5-42bb-a43f-24bfb5ac8ee8/image2.webp) 

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)  
 

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)


## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image](../../../static/img/docs/b1a55519-7ad5-42bb-a43f-24bfb5ac8ee8/image3.webp) 

## Output

- Script Logs

## Changelog

### 2026-06-04

- Initial version of the document
