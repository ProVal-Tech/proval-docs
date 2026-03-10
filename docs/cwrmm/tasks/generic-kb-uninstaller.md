---
id: '971fcd79-6316-43d1-adf3-05e9b2b87539'
slug: /971fcd79-6316-43d1-adf3-05e9b2b87539
title: 'Generic KB Uninstaller'
title_meta: 'Generic KB Uninstaller'
keywords: ['uninstall', 'windows', 'update', 'kbid', 'reboot']
description: 'This task uninstalls a specified Windows update from a machine. It requires the user to provide the KBID (Knowledge Base ID) of the update through a user parameter. Additionally, it also includes an optional setting that allows a system restart if the uninstallation process requires it.'
tags: ['reboot', 'software', 'uninstallation', 'update', 'windows']
draft: False
unlisted: false
last_update:
  date: 2025-05-07
---

## Summary
This task uninstalls a specified Windows update from a machine. It requires the user to provide the KBID (Knowledge Base ID) of the update through a user parameter. Additionally, it also includes an optional setting that allows a system restart if the uninstallation process requires it.


## Sample Run

![Image](../../../static/img/docs/971fcd79-6316-43d1-adf3-05e9b2b87539/image6.webp)


## User Parameters

| Name | Example | Required | Default | Type | Description |
| ---- | ------- |  -------- | ------- | ---- | ----------- |
| kbID | 545664 | True | - | String | KBID (Knowledge Base Identifier) of the Windows update to uninstall. |
| Reboot | Yes/No | False | False | String | Select `Yes` to facilitate a system reboot when required. `No` to suppress the reboot. |

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

**Name:** `Generic KB Uninstaller`  
**Description:** `This task uninstalls a specified Windows update from a machine. It requires the user to provide the KBID (Knowledge Base ID) of the update through a user parameter. Additionally, it also includes an optional setting that allows a system restart if the uninstallation process requires it.`  
**Category:** `Patching`

![Task Creation Step](../../../static/img/docs/971fcd79-6316-43d1-adf3-05e9b2b87539/image1.webp)

### Parameters

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)


### kbID:

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)


- Set `kbID` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Required Field` button.
- Click the `Save` button.

![Image](../../../static/img/docs/971fcd79-6316-43d1-adf3-05e9b2b87539/image2.webp)

### Reboot:

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

- Set `Reboot` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Enable the `Default Value` button.
- Set `False` in the `Value` field.
- Click the `Save` button.

![Image](../../../static/img/docs/971fcd79-6316-43d1-adf3-05e9b2b87539/image3.webp)


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

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `1800` seconds. Click the `Save` button.

```powershell
if ( '@kbID@' -match '^[0-9]{4,10}$' ) {
$kbID = '@kbID@'
}

if ( '@Reboot@' -match 'True|Yes|1' ) {
$Reboot = $true
} else {
$Reboot = $false
}

$installedPackages = dism /online /get-packages | Select-String -Pattern 'Package_for'
foreach ($package in $installedPackages) {
    $Name = ( $package -split ':' )[1].Trim()
    $packageDetail = dism /online /get-packageInfo /PackageName:$Name
    if ( $packageDetail -match $kbID ) {
        $packageName = $Name
        break
    }
}


if ($packageName) {
    if ( $Reboot ) {
        dism /Online /Remove-Package /PackageName:$packageName /Quiet
    } else {
        dism /Online /Remove-Package /PackageName:$packageName /Quiet /NoRestart
    }

    $Message = switch ($LASTEXITCODE) {
        0 { '!Information! The operation completed successfully.' }
        2 { '!Error! The system cannot find the file specified.' }
        3 { '!Error! The system cannot find the path specified.' }
        5 { '!Error! Access is denied.' }
        87 { '!Error! The parameter is incorrect.' }
        112 { '!Error! There is not enough space on the disk.' }
        1726 { '!Error! The remote procedure call failed.' }
        3010 { '!Information! The requested operation is successful. Changes will not be effective until the system is rebooted.' }
        16389 { '!Error! An unexpected failure occurred during the operation.' }
        Default { "!Error! An unknown exit code was encountered: $LASTEXITCODE" }
    }

    if ( $Message -match '!Error!' ) {
        throw $Message
    } else { 
        return $Message
    }

} else {
    return 'Package Not Installed'
}
```

![Image](../../../static/img/docs/971fcd79-6316-43d1-adf3-05e9b2b87539/image4.webp)

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

![Image](../../../static/img/docs/971fcd79-6316-43d1-adf3-05e9b2b87539/image5.webp)

## Output

- Script Output

## Changelog

- Initial Version