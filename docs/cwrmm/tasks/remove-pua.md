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
  date: 2026-08-12
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


## User Parameters

| Name          | Example    | Required | Type        | Description  |
|---------------|------------|----------|--------------|----------------|
| ListBloatware  |  Yes  | False | Flag | Select Yes to list installed bloatwares without making changes. |
| Remove  | Microsoft.MicrosoftOfficeHub,Microsoft.XboxApp  | False | Text | Specify name(s) of the bloatwares to uninstall. |
| RemoveAll |  Yes | False | Flag | Set it to Yes to remove all bloatware by category or all found bloatware with or without exceptions |
| Category | XboxFeaturesApps | False | Text | Used with RemoveAll to filter bloatware to a certain category, allowing you to select just a specific category of bloatware. Accepted Values includes <br></br> - MsftBloatApps <br></br> - ThirdPartyBloatApps <br></br> - WindowsStoreApps <br></br> - XboxFeaturesApps <br></br> - NonAppxApps |
| Except | xboxGameOverlay | False | Text | Used with RemoveAll or Category to remove all except some item(s) from a category or all together |
| PUAListSource | `https://my.cdn.example/pua.json`, `C:\ProgramData\_Automation\Script\PUA\pua.json` | False | Text String | Optional source for an alternate PUA list JSON. When provided, the script will use the specified local JSON file or downloadable URL instead of the default PUA list (https://content.provaltech.com/attachments/potentially-unwanted-applications.json). |

**Note** : `The optional JSON file must contain only the following two supported categories: "MsftBloatApps" and "ThirdPartyBloatApps". All bloatware package names must be listed under one of these categories, as the script only processes these two categories. Any other categories included in the JSON file will not be recognized or processed by the script. `


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

#### PUAListSource

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `PUAListSource` in the `Parameter Name` field.  
- Select `Text String` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  

![Image](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image01.webp>)


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
$VerbosePreference = 'SilentlyContinue'
#endregion

#region basic variables
$projectName = 'Remove-PUA'
$workingDirectory = '{0}\_Automation\Script\{1}' -f $env:ProgramData, $projectName
$scriptPath = '{0}\{1}.ps1' -f $workingDirectory, $projectName
$baseUrl = 'https://contentrepo.net/repo'
$scriptUrl = '{0}/script/{1}.ps1' -f $baseUrl, $projectName
$logPath = '{0}\{1}-log.txt' -f $workingDirectory, $projectName
$errorLogPath = '{0}\{1}-error.txt' -f $workingDirectory, $projectName
$logContentReplacePattern = '{0}$' -f $projectName
$thumbprintFileName = 'ProValCertThumbprints'
$thumbprintSource = '{0}/config/{1}.json' -f $baseUrl, $thumbprintFileName
#endregion

#region script variables
#region user parameters
$ListBloatware = '@ListBloatware@'
$Remove = '@Remove@'
$RemoveAll = '@RemoveAll@'
$Category = '@Category@'
$Except = '@Except@'
$PuaListSource = '@PuaListSource@'


if ($ListBloatware -match '1|True|Yes') {
    $ListBloatware = $true
} else {
    $ListBloatware = $false
}


if ($Remove -and $Remove -notmatch 'Remove' -and $Remove -match '[A-z]') {
    $Remove = $Remove -replace ', ', ',' -replace ' ,', ','
    $Remove = $Remove.Trim()
    $Remove = $Remove.Split(',')
} else {
    $Remove = $false
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


# PUA List Source
if ($PuaListSource -and $PuaListSource -notmatch 'PuaListSource' -and $PuaListSource.Trim().Length -gt 0) {
    $PuaListSource = $PuaListSource.Trim()
} else {
    $PuaListSource = $false
}
#endregion


#region parameters hash table
$Parameters = @{}

if ($ListBloatware) {
    $Parameters.Add('ListBloatware', $true)
} elseif ($Remove) {
    $Parameters.Add('Remove', $Remove)
} elseif ($RemoveAll) {
    $Parameters.Add('RemoveAll', $true)

    if ($Category) {
        $Parameters.Add('Category', $Category)
    }

    if ($Except) {
        $Parameters.Add('Except', $Except)
    }
} else {
    throw 'Invalid parameter set.'
}

if ($PuaListSource) {
    $Parameters.Add('PuaListSource', $PuaListSource)
}
#endregion

#region mandatory function
#The function must return $true when the signature is valid, otherwise $false.
function Test-PayloadSignature {
    <#
    .SYNOPSIS
        Validates a script file code signature.
    .DESCRIPTION
        Verifies that the script is signed, the signature is valid, and the signer certificate thumbprint matches the expected value.
    .PARAMETER FilePath
        Full path to the script file to validate.
    .PARAMETER ExpectedThumbprint
        Expected thumbprint of the trusted code-signing certificate.
    .OUTPUTS
        Returns $true for a valid signature, otherwise returns $false.
    #>
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'Full path to the script file to validate.')]
        [string]$FilePath,
        [Parameter(Mandatory = $true, HelpMessage = 'Expected thumbprint of the trusted code-signing certificate.')]
        [string[]]$ExpectedThumbprint
    )

    try {
        $signature = Get-AuthenticodeSignature -FilePath $FilePath -ErrorAction Stop
        if ($signature.Status -eq 'Valid') {
            $cert = $signature.SignerCertificate
            if ($cert -and ($ExpectedThumbprint -contains $cert.Thumbprint)) {
                if ($signature.TimeStamperCertificate) {
                    return $true
                } else {
                    Write-Error -Message ('Invalid Signature: The script ''{0}'' is signed, but the signature is not timestamped. This can cause the signature to become invalid after certificate expiration.' -f $FilePath)
                    return $false
                }
            } else {
                Write-Error -Message ('Invalid Signature: The script ''{0}'' is signed, but the signer certificate thumbprint does not match the expected value.' -f $FilePath)
                return $false
            }
        } else {
            Write-Error -Message ('Invalid Signature: The script ''{0}'' is unsigned or has an invalid signature.' -f $FilePath)
            return $false
        }
    } catch {
        return $false
    }
}
#endregion

#region set tls policy
#It sets TLS policy to ensure secure download communication with the content repository.
$supportedTlsVersions = [enum]::GetValues('Net.SecurityProtocolType')
if (($supportedTlsVersions -contains 'Tls13') -and ($supportedTlsVersions -contains 'Tls12')) {
    [System.Net.ServicePointManager]::SecurityProtocol =
    [Enum]::ToObject([Net.SecurityProtocolType], 12288) -bor
    [Enum]::ToObject([Net.SecurityProtocolType], 3072)
    Write-Verbose -Message 'TLS policy set to allow TLS 1.2 and TLS 1.3.'
} else {
    [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
    Write-Verbose -Message 'TLS policy set to TLS 1.2 only because TLS 1.3 is not supported on this system.'
}
#endregion

#region get approved thumbprints
$proValCertThumbprint = @()
try {
    $proValCertThumbprint = Invoke-RestMethod -Uri $thumbprintSource -UseBasicParsing -ErrorAction Stop
} catch {
    throw ('Failed to retrieve approved thumbprints. Reason: {0}' -f $Error[0].Exception.Message)
}
#endregion


#region working Directory
#It creates the working directory when it does not already exist.
if (-not (Test-Path -Path $workingDirectory)) {
    try {
        New-Item -Path $workingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
        Write-Verbose -Message ('Created working directory: {0}' -f $workingDirectory)
    } catch {
        throw ('Failed to create working directory {0}. Reason: {1}' -f $workingDirectory, $Error[0].Exception.Message)
    }
} else {
    Write-Verbose -Message ('Working directory already exists: {0}' -f $workingDirectory)
}
#endregion

#region download script
#It downloads the script from the content repository, refreshing the local copy when available.
try {
    Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath -UseBasicParsing -ErrorAction Stop
    Write-Verbose -Message ('Downloaded script from {0} to {1}' -f $scriptUrl, $scriptPath)
} catch {
    if (-not (Test-Path -Path $scriptPath)) {
        throw ('Failed to download script from ''{0}'', and no local copy exists on this machine. Reason: {1}' -f $scriptUrl, $Error[0].Exception.Message)
    } else {
        Write-Verbose -Message ('Failed to download script from ''{0}'', but a local copy is available at: {1}' -f $scriptUrl, $scriptPath)
    }
}
#endregion

#region validate code signature
#It validates the downloaded script signature before execution.
if (-not (Test-PayloadSignature -FilePath $scriptPath -ExpectedThumbprint $proValCertThumbprint -ErrorAction Continue)) {
    throw ('Invalid Signature: Script ''{0}'' failed code-signature validation. Execution has been stopped.' -f $scriptPath)
} else {
    Write-Verbose -Message ('Script ''{0}'' passed code-signature validation.' -f $scriptPath)
}
#endregion

#region execute script
if ($parameters.Count -gt 0) {
    Write-Verbose -Message ('Executing script ''{0}'' with parameters: {1}' -f $scriptPath, (($parameters.GetEnumerator() | ForEach-Object { ('{0}={1}' -f $_.Key, $_.Value) }) -join '; ' | Out-String))
    & $scriptPath @parameters
} else {
    Write-Verbose -Message ('Executing script ''{0}'' without parameters.' -f $scriptPath)
    & $scriptPath
}
#endregion

#region log validation
#It validates the script execution by checking for the expected log files and outputs their content for verification.
if (-not (Test-Path -Path $logPath)) {
    throw ('Failed to run the agnostic script ''{0}''. A security application seems to have interrupted the script.' -f $scriptPath)
} else {
    $content = Get-Content -Path $logPath
    $logContent = $content[ $($($content.IndexOf($($content -match $logContentReplacePattern)[-1])) + 1)..$($content.length - 1) ]
    Write-Information -MessageData ('Log Content:{1}{0}' -f ($logContent | Out-String -ErrorAction SilentlyContinue), [Environment]::NewLine) -InformationAction Continue
}

if (Test-Path -Path $errorLogPath) {
    $errorLogContent = Get-Content -Path $errorLogPath -ErrorAction SilentlyContinue
    throw ('Error log Content:{1}{0}' -f ($errorLogContent | Out-String -ErrorAction SilentlyContinue), [Environment]::NewLine)
}
#endregion
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

### 2025-08-12

- Added another parameter `PuaListSource`. Its an Optional source for an alternate PUA list JSON. When provided, the script will use the specified local JSON file or downloadable URL instead of the default PUA list.
- Updated powershell to use this new parameter and as per our new cwrmm script standards.

### 2026-04-02

- Updated the PowerShell used in the script as per our new standards.

### 2025-05-02

- Fixed the bug where the script contained several outdated and potentially incorrect AppxPackage IDs in the bloatware removal arrays. Some Microsoft apps have changed their package identifiers in newer Windows versions, and some third-party apps may have incorrect publisher IDs.

### 2025-04-01

- Initial version of the document