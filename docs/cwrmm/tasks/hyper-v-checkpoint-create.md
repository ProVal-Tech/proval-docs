---
id: 'f023947e-50a2-4f12-9935-53e6cc373143'
slug: /f023947e-50a2-4f12-9935-53e6cc373143
title: 'Hyper-V - Checkpoint Create'
title_meta: 'Hyper-V - Checkpoint Create'
keywords:   ['checkpoint', 'hyper-v', 'virtual-machine']
description: 'The task can be used to create a checkpoint of a virtual machine hosted on a Hyper-V Host Server.'
tags: ['backup', 'security', 'virtualization', 'windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-20
---

## Summary
The task can be used to create a checkpoint of a virtual machine hosted on a Hyper-V Host Server.

## Sample Run

![Image](../../../static/img/docs/f023947e-50a2-4f12-9935-53e6cc373143/image9.webp) 

## User Parameters

| Name        | Example                     | Required | Type        | Description                                 |
|-------------|-----------------------------|----------|-------------|---------------------------------------------|
| VMName  | DEV_Test-win10   | True     | Text String | Name of the virtual machine for which to create the checkpoint |

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

**Name:** `Hyper-V - Checkpoint Create`  
**Description:** `The task can be used to create a checkpoint of a virtual machine hosted on a Hyper-V Host Server.`  
**Category:** `Custom`

![Image](../../../static/img/docs/f023947e-50a2-4f12-9935-53e6cc373143/image1.webp) 

### Parameters

### VMName

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

- Set `VMName` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/2543f54a-2d4d-46d0-9827-ce94a1ef444d/image2.webp) 

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

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `600` seconds. Click the `Save` button.

```powershell
$VMName = '@VMName@'
if ([string]::IsNullOrEmpty($VMName)) {
  throw 'An error occurred: VMName is missing. Provide a valid VMName to proceed with deleting the snapshot.'
}


# Check if the Hyper-V module is installed
if ( ( Get-WindowsFeature -Name Hyper-V -ErrorAction SilentlyContinue ) -or (  Get-WindowsOptionalFeature -Online -FeatureName 'Microsoft-Hyper-V' -ErrorAction SilentlyContinue | Where-Object {$_.State -eq 'Enabled'} ) ) { 
    Import-Module Hyper-V -ErrorAction SilentlyContinue -Force
} else {
    throw "The Hyper-V module is not installed. Please install it using 'Add-WindowsFeature Hyper-V'"
}

# Check if the VM exists
$VM = Get-VM -Name $VMName -ErrorAction SilentlyContinue
if ( !( $VM ) ) {
    throw "Virtual machine '$VMName' not found. Please provide a valid virtual machine name."
}

# Create a checkpoint of the virtual machine
try {
    Checkpoint-VM -VM $VM -SnapshotName "Checkpoint_$(Get-Date -Format 'yyyyMMdd_HHmmss')" -Confirm:$false
    return "Checkpoint created successfully for virtual machine '$VMName'"
} catch {
    throw "Error creating checkpoint: $_"
}
```

![Image](../../../static/img/docs/f023947e-50a2-4f12-9935-53e6cc373143/image7.webp) 


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

![Image](../../../static/img/docs/f023947e-50a2-4f12-9935-53e6cc373143/image8.webp) 

## Output

- Script Logs

## Changelog

### 2026-03-20

- Initial version of the document
