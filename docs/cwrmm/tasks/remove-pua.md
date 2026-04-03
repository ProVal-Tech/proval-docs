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
last_update:
  date: 2025-11-27
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
<#
.SYNOPSIS
Wrapper script that prepares parameters, downloads, and runs the Remove-PUA automation script.

.DESCRIPTION
This script is an automation wrapper for Remove-PUA operations.
It reads runtime placeholders from an RMM tool, validates and normalizes user input,
builds the correct parameter set, prepares a local working directory, ensures TLS support,
downloads the latest Remove-PUA script from the content repository, executes it with the
selected parameters, and validates generated logs.

Main workflow blocks:
1. Globals and user parameters:
    Reads placeholders such as ListBloatware, Remove, RemoveAll, Category, and Except,
    then converts them into boolean/array values as needed.
2. Parameter hash table:
    Creates one valid parameter set for the downstream script and rejects invalid input.
3. Variables and working directory setup:
    Builds file paths under ProgramData and creates the working folder if needed.
4. Permissions:
    Ensures the working directory has an Everyone FullControl ACL rule for automation access.
5. TLS policy:
    Forces TLS 1.2/1.3 where available so secure download calls can succeed.
6. Script download and execution:
    Downloads Remove-PUA.ps1 from the repository and runs it with splatted parameters.
7. Log verification:
    Confirms expected log output exists and throws with error log content when failures are detected.
#>

#region globals
$ProgressPreference = 'SilentlyContinue'
$WarningPreference = 'SilentlyContinue'
#endRegion

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
$projectName = 'Remove-PUA'
$workingDirectory = '{0}\_Automation\Script\{1}' -f $env:ProgramData, $projectName
$scriptPath = '{0}\{1}.ps1' -f $workingDirectory, $projectName
$logPath = '{0}\{1}-log.txt' -f $workingDirectory, $projectName
$errorLogPath = '{0}\{1}-error.txt' -f $workingDirectory, $projectName
$baseUrl = 'https://contentrepo.net/repo'
$scriptUrl = '{0}/script/{1}.ps1' -f $baseUrl, $projectName
#endRegion

#region working Directory
if (!(Test-Path -Path $workingDirectory)) {
    try {
        New-Item -Path $workingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    } catch {
        throw ('Failed to Create working directory {0}. Reason: {1}' -f $workingDirectory, $($Error[0].Exception.Message))
    }
}

$acl = Get-Acl -Path $workingDirectory
$hasFullControl = $acl.Access | Where-Object {
    $_.IdentityReference -match 'Everyone' -and $_.FileSystemRights -match 'FullControl'
}
if (-not $hasFullControl) {
    $accessRule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule(
        'Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'
    )
    $acl.AddAccessRule($accessRule)
    Set-Acl -Path $workingDirectory -AclObject $acl -ErrorAction SilentlyContinue
}
#endRegion

#region set tls policy
$supportedTLSversions = [enum]::GetValues('Net.SecurityProtocolType')
if (($supportedTLSversions -contains 'Tls13') -and ($supportedTLSversions -contains 'Tls12')) {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls13 -bor [System.Net.SecurityProtocolType]::Tls12
} elseif ($supportedTLSversions -contains 'Tls12') {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
} else {
    Write-Information 'TLS 1.2 and/or TLS 1.3 are not supported on this system. This download may fail!' -InformationAction Continue
    if ($PSVersionTable.PSVersion.Major -lt 3) {
        Write-Information 'PowerShell 2 / .NET 2.0 doesn''t support TLS 1.2.' -InformationAction Continue
    }
}
#endRegion

#region download script
try {
    Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath -UseBasicParsing -ErrorAction Stop
} catch {
    if (!(Test-Path -Path $scriptPath)) {
        throw ('Failed to download the script from ''{0}'', and no local copy of the script exists on the machine. Reason: {1}' -f $scriptUrl, $($Error[0].Exception.Message))
    }
}
#endRegion

#region execute script
if ($parameters) {
    & $scriptPath @parameters
} else {
    & $scriptPath
}
#endRegion

#region log verification
if (!(Test-Path -Path $logPath )) {
    throw ('Failed to run the agnostic script ''{0}''. A security application seems to have interrupted the script.' -f $scriptPath)
} else {
    $content = Get-Content -Path $logPath
    $logContent = $content[ $($($content.IndexOf($($content -match "$($projectName)$")[-1])) + 1)..$($content.length - 1) ]
    Write-Information ('Log Content: {0}' -f ($logContent | Out-String)) -InformationAction Continue
}

if ((Test-Path -Path $errorLogPath)) {
    $errorLogContent = Get-Content -Path $errorLogPath -ErrorAction SilentlyContinue
    throw ('Error log Content: {0}' -f ($errorLogContent | Out-String -ErrorAction SilentlyContinue))
}
#endRegion
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

## Changelog

### 2025-05-02

- Initial version of the document

### 2025-04-01

- Fixed the bug where the script contained several outdated and potentially incorrect AppxPackage IDs in the bloatware removal arrays. Some Microsoft apps have changed their package identifiers in newer Windows versions, and some third-party apps may have incorrect publisher IDs.

### 2026-04-02

- Updated the PowerShell used in the script as per our new standards.

