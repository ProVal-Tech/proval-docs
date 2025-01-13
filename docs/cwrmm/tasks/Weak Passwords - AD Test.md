---
id: 'rmm-weak-passwords-ad-test'
title: 'Weak Passwords - AD Test'
title_meta: 'Weak Passwords - AD Test'
keywords: ['ad', 'credentials', 'passwords', 'security', 'audit']
description: 'This document outlines the process of utilizing the Test-WeakCredentials script to assess hashed credentials in Active Directory against known compromised or weak password lists. It includes setup instructions, user parameters, and implementation guidelines for effective password security audits.'
tags: ['active-directory', 'security', 'audit', 'setup', 'script']
draft: false
unlisted: false
---
## Summary

This task utilizes the agnostic script [Test-WeakCredentials](https://proval.itglue.com/DOC-5078775-9622592) to test the hashed credentials in AD against a known compromised or weak list.

## Sample Run

![Sample Run 1](../../../static/img/Weak-Passwords---AD-Test/image_2.png)

![Sample Run 2](../../../static/img/Weak-Passwords---AD-Test/image_3.png)

## Dependencies

- [Test-WeakCredentials](https://proval.itglue.com/DOC-5078775-9622592)  
- [CW RMM - Solution - Weak Passwords Audit](https://proval.itglue.com/DOC-5078775-17872310)

## User Parameters

| Name          | Example | Accepted Values                     | Required | Default | Type   | Description                                                                                     |
|---------------|---------|-------------------------------------|----------|---------|--------|-------------------------------------------------------------------------------------------------|
| `PWDictSize`  | Small   | 'Tiny', 'Small', 'Medium', 'Large' | False    | Medium  | String | This Parameter specifies the Password dictionary you wish to query. It is a validated set of 'Tiny', 'Small', 'Medium', 'Large' |
| `Force`       | All     | 'All', 'Text', 'Zipped'            | False    |         | String | This Parameter accepts any combination of its validated set. It is a validated set of 'All', 'Text', 'Zipped' |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Create Script](../../../static/img/Weak-Passwords---AD-Test/image_4.png)

![Script Editor](../../../static/img/Weak-Passwords---AD-Test/image_5.png)

**Name:** Weak Passwords - AD Test  
**Description:** This task utilizes the agnostic script Test-WeakCredentials to test the hashed credentials in AD against a known compromised or weak list.  
**Category:** Custom

![Category](../../../static/img/Weak-Passwords---AD-Test/image_6.png)

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/Weak-Passwords---AD-Test/image_7.png)

This screen will appear.

![Parameter Screen](../../../static/img/Weak-Passwords---AD-Test/image_8.png)

- Set `PWDictSize` in the `Parameter Name` field.
- Select `String` from the `Parameter Type` dropdown menu.
- Toggle Default Value
- Set Default Value as `Medium`
- Click the `Save` button
- ![Save Button](../../../static/img/Weak-Passwords---AD-Test/image_9.png)
- It will ask for the confirmation to proceed. Click the `Confirm` button to create the parameter.
![Confirm](../../../static/img/Weak-Passwords---AD-Test/image_10.png)

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Another Parameter](../../../static/img/Weak-Passwords---AD-Test/image_11.png)

- Set `Cleanup` in the `Parameter Name` field.
- Select `String` from the `Parameter Type` dropdown menu.
- Click the `Save` button
- Click the `Confirm` button to create the parameter.
![Confirm Another Parameter](../../../static/img/Weak-Passwords---AD-Test/image_12.png)

Parameters will look like as shown below:

![Parameters](../../../static/img/Weak-Passwords---AD-Test/image_13.png)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/Weak-Passwords---AD-Test/image_14.png)

A blank function will appear.

![Blank Function](../../../static/img/Weak-Passwords---AD-Test/image_15.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script](../../../static/img/Weak-Passwords---AD-Test/image_16.png)

The following function will pop up on the screen:

![Function Popup](../../../static/img/Weak-Passwords---AD-Test/image_17.png)

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```powershell
if ( '@PWDictSize@' -notin ( 'Tiny', 'Small', 'Medium', 'Large' ) ) {
    $PWDictSize = 'Medium'
} else {
    $PWDictSize = '@PWDictSize@'
}

if ( '@Cleanup@' -notin ( 'All', 'Text', 'Zipped' ) ) {
    $Cleanup = $null
} else {
    $Cleanup = '@Cleanup@'
}

if (!($Cleanup)) {
    $Parameters = @{
        PWDictSize = $PWDictSize
    }
} else {
    $Parameters = @{
        PWDictSize = $PWDictSize
        Cleanup = $cleanup
    }
}

#region Setup - Variables
$ProjectName = 'Test-WeakCredentials'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
$PS1Path = "$WorkingDirectory/$ProjectName.ps1"
$Workingpath = $WorkingDirectory
$LogPath = "$WorkingDirectory/$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory/$ProjectName-Error.txt"
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
$TheseResults = & "$PS1Path" @Parameters 2>$Null 6>$Null

if (!$TheseResults) {
    if ( $ErrorLogPath ) {
        $errorContent = Get-Content $ErrorLogPath -ErrorAction SilentlyContinue
        throw $($errorContent | Out-String)
    }
    throw 'The underlying script failed to return any data. Please review script logs for additional information.'
}

$weakpw = $($TheseResults.WeakPasswords -replace '//', '//' -replace "'", "//'" -replace "$([char]0x2018)|$([char]0x2019)", "//'")
$DuplicatePW = $($TheseResults.DuplicatePasswords -replace '//', '//' -replace "'", "//'" -replace "$([char]0x2018)|$([char]0x2019)", "//'")
$weakpwcount = $TheseResults.WeakPasswords.Count
$DuplicatePWCount = $TheseResults.DuplicatePasswords.Count

return "DuplicatePasswordCount:$($DuplicatePWCount)|WeakPasswordCount:$($weakpwcount)|DuplicatePassword:$($DuplicatePW)|WeakPassword:$($weakpw)"
#endregion
```

### Row 2: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

### Row 3: Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Again](../../../static/img/Weak-Passwords---AD-Test/image_16.png)

The following function will pop up on the screen:

![Function Popup Again](../../../static/img/Weak-Passwords---AD-Test/image_17.png)

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```powershell
$output = '%output%'
$WeakPasswordCount = $($($output -split '/|')[1] -split ':')[1]
if ($WeakPasswordCount  -match '[1-9]') {return $WeakPasswordCount } else {return 'No weak password Found'}
```

![Row 3](../../../static/img/Weak-Passwords---AD-Test/image_18.png)

### Row 4 Logic: If /Then/Else

![Row 4 Logic](../../../static/img/Weak-Passwords---AD-Test/image_19.png)

There will be two sections If part and Else part

![Row 4 Else](../../../static/img/Weak-Passwords---AD-Test/image_20.png)

### Row 4a Condition: Output Contains

In IF part, Enter `password Found` in the right box of the "Output Contains" Part.

![Row 4a Condition](../../../static/img/Weak-Passwords---AD-Test/image_21.png)

### Row 4b Function: Set Custom Field

Add a new row by clicking on Add row button. Set Custom Field 'Weak Password Count' to 'NA'

![Row 4b](../../../static/img/Weak-Passwords---AD-Test/image_22.png)

### Row 4C Function: Set Custom Field

Add a new row by clicking on the Add row button in the ELSE part. Set Custom Field `Weak Password Count` to `%output%`

![Row 4C](../../../static/img/Weak-Passwords---AD-Test/image_23.png)

### Row 5: Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Row 5](../../../static/img/Weak-Passwords---AD-Test/image_16.png)

The following function will pop up on the screen:

![Row 5 Popup](../../../static/img/Weak-Passwords---AD-Test/image_17.png)

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```powershell
$output = '%output%'
$duplicatePasswordCount = $($($output -split '/|')[0] -split ':')[1]
if ($duplicatePasswordCount  -match '[1-9]') {return $duplicatePasswordCount } else {return 'No Duplicate Password found'}
```

![Row 5 Result](../../../static/img/Weak-Passwords---AD-Test/image_24.png)

### Row 6 Logic: If /Then/Else

![Row 6 Logic](../../../static/img/Weak-Passwords---AD-Test/image_25.png)

There will be two sections If part and Else part

![Row 6 Else](../../../static/img/Weak-Passwords---AD-Test/image_26.png)

### Row 6a Condition: Output Contains

In IF part, Enter `password Found` in the right box of the "Output Contains" Part.

![Row 6a Condition](../../../static/img/Weak-Passwords---AD-Test/image_21.png)

### Row 6b Function: Set Custom Field

Add a new row by clicking on Add row button. Set Custom Field `Duplicate Password Count` to `NA`

![Row 6b](../../../static/img/Weak-Passwords---AD-Test/image_27.png)

### Row 6C Function: Set Custom Field

Add a new row by clicking on the Add row button in the ELSE part. Set Custom Field `Duplicate Password Count` to `%output%`

![Row 6C](../../../static/img/Weak-Passwords---AD-Test/image_28.png)

## Completed Task

![Completed Task](../../../static/img/Weak-Passwords---AD-Test/image_29.png)

## Implementation

This task has to be scheduled on [CW RMM - Machine Group - Domain Controllers](https://proval.itglue.com/DOC-5078775-14036214) group for auto deployment. Script can also be run manually if required.

Go to Automations > Tasks.  
Search for Weak Passwords - AD Test  
Then click on Schedule and provide the parameters detail as it is necessary for the script completion.

![Implementation](../../../static/img/Weak-Passwords---AD-Test/image_30.png)

## Output

- Script Log




