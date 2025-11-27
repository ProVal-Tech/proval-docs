---
id: '3d0d2136-fd90-44b2-9a61-79e4e7d9f3e9'
slug: /3d0d2136-fd90-44b2-9a61-79e4e7d9f3e9
title: 'ESU Audit'
title_meta: 'ESU Audit'
keywords: ['ESU','extended security']
description: 'This script will search for ESU licenses present on the endpoint and return information for any licenses found'
tags: ['auditing','licensing','patching','windows']
draft: false
unlisted: false
---

## Summary

This script will search for ESU licenses present on the endpoint and return information for any licenses found. Any data from the ESU licenses will be stored in the [ESU Status](/docs/90f075dc-5997-4abe-8a89-c46c6d566de0) custom field.

## Sample Run

![Image1](../../../static/img/docs/esu-audit/image.png)

## Dependencies

- [CW RMM - Custom Field - ESU Status](/docs/90f075dc-5997-4abe-8a89-c46c6d566de0)

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

**Name:** `ESU Audit`  
**Description:** `This script will search for ESU licenses present on the endpoint and return information for any licenses found`  
**Category:** `Data Collection`

![Image2](../../../static/img/docs/esu-audit/image-1.png)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Row 1 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  

![PowerShell Function Search](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_13.webp)  
![PowerShell Function Selected](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_14.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_15.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
#region Setup - Variables
$ProjectName = 'Get-ESUStatus'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
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
#region Execution
if ($Parameters) {
    $licenses = & $PS1Path @Parameters
} else {
    $licenses = & $PS1Path
}
#endregion

if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( $licenses ) {
    $status = @()
    foreach ( $license in $licenses ) {
        $status += "ID - $($license.ID) Name - $($license.Name) License Status - $($license.LicenseStatus)"
    }
    return $status -join '\|'
} else {
    return "No ESU Licenses found"
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
```

![Script Example](../../../static/img/docs/esu-audit/image-2.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row Step 1](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_17.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_18.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_19.webp)  
![Script Log Selected](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_20.webp)  

The following function will pop up on the screen:  
![Script Log Example](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_21.webp)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_22.webp)  

### Row 3 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row Step 2](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_17.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_18.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field Search](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_23.webp)  

The following function will pop up on the screen:  
![Set Custom Field Example](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_24.webp)  

- Search and select the Computer-Level Custom Field `ESU Status` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.

![Set Custom Field Save 1](../../../static/img/docs/esu-audit/image-3.png)
![Set Custom Field Save 2](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_26.webp)  

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Completed Task](../../../static/img/docs/esu-audit/image-4.png)

## Output

- Script Log  
![Script Log Output](../../../static/img/docs/esu-audit/image-5.png)
- Custom Field  
![Custom Field Output](../../../static/img/docs/esu-audit/image-6.png)