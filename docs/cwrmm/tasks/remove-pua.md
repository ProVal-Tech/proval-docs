---
id: '5f664f90-26b9-4082-9a99-73954de0c840'
slug: /5f664f90-26b9-4082-9a99-73954de0c840
title: 'Remove PUA'
title_meta: 'Remove PUA'
keywords: ['PUA', 'bloatware', 'application', 'remove']
description: 'This script manages the removal of predefined bloatware packages or lists installed bloatware based on a centrally maintained list. It offers three primary operations: bulk removal, selective removal, and bloatware listing. The remove parameter allows bypassing the PUA List to remove any installed AppxPackage.'
tags: ['uninstallation']
draft: false
unlisted: false
---

## Summary

This script manages the removal of predefined bloatware packages or lists installed bloatware based on a centrally maintained list. It offers three primary operations: bulk removal, selective removal, and bloatware listing. The remove parameter allows bypassing the PUA List to remove any installed AppxPackage.

**PUA List:** [https://content.provaltech.com/attachments/potentially-unwanted-applications.json](https://content.provaltech.com/attachments/potentially-unwanted-applications.json)

## Sample Run

![Sample Run 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image1.webp>)

To get the list of installed Bloatware:  
![Sample Run 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image2.webp>)

To remove all installed Bloatware installed on the computer from the [PUA List](https://content.provaltech.com/attachments/potentially-unwanted-applications.json):  
![Sample Run 3](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image3.webp>)

To remove all installed Bloatware except any of `WindowsStoreApps` category apps and `Microsoft.BingNews`,  and `Microsoft.MSPaint`:  
![Sample Run 4](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image4.webp>)

To remove individual AppxPackages installed on the machine like `Microsoft.MicrosoftOfficeHub`, `Microsoft.XboxApp`, `Microsoft.Messaging`, and `Microsoft.People`:  
![Sample Run 5](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image5.webp>)

![Sample Run 6](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image6.webp>)

## Dependencies

[Remove-PUA](/docs/fda5f79b-3e83-4561-af2b-2533f41c7443)

## Implementation

### Script Details

#### Step 1

Navigate to `Automation`  ➞  `Tasks`  
![step1](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step1.webp)

#### Step 2

Create a new `Script Editor` style task by choosing the `Script Editor` option from the `Add` dropdown menu  
![step2](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step2.webp)

The `New Script` page will appear on clicking the `Script Editor` button:  
![step3](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step3.webp)

#### Step 3

Fill in the following details in the `Description` section:  

**Name:** `Remove - PUA`  
**Description:**

```Shell
This script manages the removal of predefined bloatware packages or lists installed bloatware based on a centrally maintained list. It offers three primary operations: bulk removal, selective removal, and bloatware listing. The remove parameter allows bypassing the PUA List to remove any installed AppxPackage. 

PUA List: https://content.provaltech.com/attachments/potentially-unwanted-applications.json
```

**Category:** Application  

![Task Detail](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image7.webp>)

### Parameters

#### ListBloatware

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `ListBloatware` in the `Parameter Name` field.  
- Select `Flag` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  
![Add Parameter 3](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image10.webp>)

#### Remove

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `Remove` in the `Parameter Name` field.  
- Select `Text String` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  
![Add Parameter 6](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image11.webp>)

#### RemoveAll

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `RemoveAll` in the `Parameter Name` field.  
- Select `Flag` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  
![Add Parameter 9](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image12.webp>)

#### Category

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `Category` in the `Parameter Name` field.  
- Select `Text String` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  
![Add Parameter 12](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image13.webp>)

#### Except

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `Except` in the `Parameter Name` field.  
- Select `Text String` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  
![Add Parameter 15](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image14.webp>)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear.  
![Add Row continued](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image15.webp>)

#### Row 1: Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Row 1 Image 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image16.webp>)

The following function will pop up on the screen:  
![Row 1 Image 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image17.webp>)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `3600` seconds. Click the `Save` button.

```powershell
#region user parameters
$ListBloatware = '@ListBloatware@'
$Remove = '@Remove@'
$RemoveAll = '@RemoveAll@'
$Category = '@Category@'
$Except = '@Except@'

if ($ListBloatware -match '1|True|Yes') {
    $ListBloatware = $true
} else {
    $ListBloatware = $false
}

if ($Remove -and $Remove -notmatch 'Remove' -and $Remove -match '[A-z]') {
    $Remove = $Remove -replace ', ', ',' -replace ' ,', ','
    $Remove = $Remove.Trim()
    $Remove = $Remove.Split(',')
}

if ($RemoveAll -match '1|True|Yes') {
    $RemoveAll = $true
} else {
    $RemoveAll = $false
}

if ($RemoveAll -and $Category -and $Category -notmatch 'Category' -and $Category -match '[A-z]') {
    if (!(('MsftBloatApps', 'ThirdPartyBloatApps') -contains $Category)) {
        throw 'Invalid category. Supported categories are: MsftBloatApps, and ThirdPartyBloatApps'
    } else {
        $Category = $Category
    }
} else {
    $Category = $false
}

if ($RemoveAll -and $Except -and $Except -notmatch 'Except' -and $Except -match '[A-z]') {
    $Except = $Except -replace ', ', ',' -replace ' ,', ','
    $Except = $Except.Trim()
    $Except = $Except.Split(',')
} else {
    $Except = $false
}
#endregion

#region parameters hash table
$Parameters = @{}
if ( $ListBloatware ) {
    $Parameters.Add('ListBloatware', $true)
} elseif ( $Remove ) {
    $Parameters.Add('Remove', $Remove)
} elseif ( $RemoveAll ) {
    $Parameters.Add('RemoveAll', $true)
    if ( $Category ) {
        $Parameters.Add('Category', $Category)
    }
    if ( $Except ) {
        $Parameters.Add('Except', $Except)
    }
} else {
    throw 'Invalid parameter set.'
}
#endregion

#region variables
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$ProjectName = 'Remove-PUA'
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$Workingpath = $WorkingDirectory
$LogPath = "$WorkingDirectory\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\$ProjectName-Error.txt"
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

& $PS1Path @Parameters
#region Execution
if ($Parameters) {
    & $PS1Path @Parameters
} else {
    & $PS1Path
}
#endregion

if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Row 1 Image 3](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image18.webp>)

#### Row 2: Function: Script Log

Add a new row by clicking the `Add Row` button.  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear.  
![Row 2 Image 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image15.webp>)

Search and select the `Script Log` function.  
![Row 2 Image 3](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image19.webp>)

![Row 2 Image 4](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image20.webp>)

The following function will pop up on the screen:  
![Row 2 Image 5](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image21.webp>)

In the script log message, simply type %output% and click the `Save` button  
![Row 2 Image 6](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image22.webp>)

Click the `Save` button at the top-right corner of the screen to save the script.  
![Row 2 Image 8](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image23.webp>)

## Completed Script

![Row 3 Image 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image24.webp>)

## Output

- Script log
