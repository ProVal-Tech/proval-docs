---
id: 'c394b81e-3d3c-4316-8d92-0d243625a02c'
slug: /c394b81e-3d3c-4316-8d92-0d243625a02c
title: 'Windows Secure Boot Audit'
title_meta: 'Windows Secure Boot Audit'
keywords: ['audit','bios','certificates','secureboot','windows']
description: 'Fetches the status of key certificate and configurations that will be needed before the current secure boot certificates expire.'
tags: ['bios','certificates','secureboot','windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-23
---

## Summary
This Script fetches the status of key certificate and configurations that will be needed before the current secure boot certificates expire.

## Sample Run
![Image](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image18.webp) 

## Dependencies

- [Solution : Windows Secure Boot Audit](/docs/05b9e73a-64ae-43f6-8ed5-89c952a3aaec)

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

**Name:** `Windows Secure Boot Audit`  
**Description:** `Fetches the status of key certificate and configurations that will be needed before the current secure boot certificates expire.`  
**Category:** `Custom`

![Image](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image1.webp) 


### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Row 1 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  
 
![PowerShell Function Selected](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell

try { if (Confirm-SecureBootUEFI) { "Enabled" } else { "Disabled" } } catch { "Unsupported or Disabled" }

```

![Image](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image2.webp)


### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)  
 

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)

### Row 3 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addsetcustomfieldfunction.webp)  

The following function will pop up on the screen:  
![Set Custom Field Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blanksetcustomfieldfunction.webp)  

- Search and select the Computer-Level Custom Field `Windows Secure Boot` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.

![Set Custom Field Save 1](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image3.webp)  

![Set Custom Field Save 2](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image4.webp) 

#### Row 4 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  
 
![PowerShell Function Selected](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell

$result = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -ErrorAction SilentlyContinue).AllowTelemetry

if ($result -in 1,2,3) {
    "Enabled"
} else {
    "Disabled"
}

```

![Image](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image5.webp)

### Row 5 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)  
 

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)

### Row 6 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addsetcustomfieldfunction.webp)  

The following function will pop up on the screen:  
![Set Custom Field Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blanksetcustomfieldfunction.webp)  

- Search and select the Computer-Level Custom Field `Windows Telemetry` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.

![Set Custom Field Save 1](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image6.webp)  

![Set Custom Field Save 2](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image7.webp) 

#### Row 7 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  
 
![PowerShell Function Selected](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell

$result = [System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI db).bytes) -match '(Windows|Microsoft) UEFI CA 2023'

if ($result) {
    "Up to Date"
} else {
    "Out of Date"
}

```

![Image](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image8.webp)

### Row 8 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)  
 

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)

### Row 9 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addsetcustomfieldfunction.webp)  

The following function will pop up on the screen:  
![Set Custom Field Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blanksetcustomfieldfunction.webp)  

- Search and select the Computer-Level Custom Field `Windows DB Certificate` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.

![Set Custom Field Save 1](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image9.webp)  

![Set Custom Field Save 2](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image10.webp) 

### Row 10 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  
 
![PowerShell Function Selected](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell

$result = [System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI KEK).bytes) -match 'Microsoft Corporation KEK 2K CA 2023'

if ($result) {
    "Up to Date"
} else {
    "Out of Date"
}

```

![Image](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image11.webp)

### Row 11 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)  
 

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)

### Row 12 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addsetcustomfieldfunction.webp)  

The following function will pop up on the screen:  
![Set Custom Field Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blanksetcustomfieldfunction.webp)  

- Search and select the Computer-Level Custom Field `Windows KEK Certificate` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.

![Set Custom Field Save 1](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image12.webp)  

![Set Custom Field Save 2](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image13.webp) 

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Complete Task](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image14.webp) 


## Output

- Custom fields
- Script Output

## Schedule Task

### Task Details

- **Name:** `Windows Secure Boot Audit`  
- **Description:** `Fetches the status of key certificate and configurations that will be needed before the current secure boot certificates expire.`  
- **Category:** `Custom`

![Image](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image1.webp) 

### Schedule

- **Schedule Type:**  `Schedule`  
- **Timezone:** `Local Machine Time`  
- **Start:** `<Current Date>`  
- **Trigger:** `Time` `At` `<Current Time>`  
- **Recurrence:** `Every 15 Days`

![Image](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image15.webp) 

### Targeted Resource

**Device Group:** `Windows Machines`

![Image](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image16.webp) 


### Completed Scheduled Task

![Image](../../../static/img/docs/c394b81e-3d3c-4316-8d92-0d243625a02c/image17.webp) 

## Changelog

### 2026-03-23

- Initial version of the document