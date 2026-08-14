---
id: '7115ebed-2a19-4d78-9267-e7ff88fa783d'
slug: /7115ebed-2a19-4d78-9267-e7ff88fa783d
title: 'Manage - .Net Runtimes'
title_meta: 'Manage - .Net Runtimes'
keywords: ['Sdk','runtime','Asp.Net','core','.net']
description: 'Automate implementation for managing .NET runtimes and SDKs on Windows: list, install, update, uninstall, and renew with Version and Force controls.'
tags: ['dotnet','windows']
draft: False
unlisted: false
last_update:
  date: 2026-08-11
---

## Summary
This CW RMM implementation helps keep .NET on Windows devices clean, current, and secure. It can list installed .NET components, install the latest supported versions, update patch releases, remove unsupported versions, or perform a full cleanup and refresh.

The script checks Microsoft release data in real time, then uses that information to decide what to install, update, or remove. This reduces manual effort and lowers the risk of keeping outdated .NET versions.

When you run this script, expect software changes on the endpoint. Depending on the selected action, it may download installers, silently install updates, and remove older versions. A stable internet connection and administrator access are required.

**NOTE:**

- Installing or uninstalling `sdk` can also install or remove related `aspNetCoreRuntime`, `desktopRuntime`, and `runtime` components.
- Installing or uninstalling `desktopRuntime` can also install or remove the related `runtime`.
- For actions other than `list`, if `Type` is not provided, the script uses `desktopRuntime` by default.
- Install and update use the machine's native architecture installer (for example, x64 installer on x64 machines).
- If x86 components already exist on a machine, the script can detect and remove outdated x86 components during `uninstall`, `update`, and `renew`.
- Use `Version` carefully:
  - For `list`, `install`, `uninstall`, and `update`, you can target specific major versions (including unsupported versions).
  - For `renew` with `Version`, all specified versions must still be supported. If any are unsupported, the action will stop.
- Set `Force` to `1` to apply force removal behavior. Any other value (or blank) means force is not applied.
- For `uninstall`, `update`, and `renew`, older-version cleanup primarily targets components detected by `dotnet.exe`. With `Force = 1`, cleanup can also remove .NET entries found through uninstall registry data and package metadata, including components that `dotnet.exe` does not list.
- `renew` is the most aggressive option. It can remove versions you are not targeting. Review your required application dependencies before using it.


## Sample Run

![Image](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image9.webp)

## Dependencies

- [Optimize-DotNetRunTime](/docs/6ec8fb3c-29ef-4b05-b8fd-546eb07176c7)  

## User Parameters

| Name | Example | Required | Default | Type | Description |
| ---- | ------- | -------- | ------- | ---- | ----------- |
| `Action` | <ul><li>`list`</li><li>`install`</li><li>`uninstall`</li><li>`update`</li><li>`renew`</li></ul> | False   | - | DropDown  | Select the action to perform. Valid values are: <br /><br /> <ul><li>`list`: Lists all installed .NET runtimes and SDKs.</li><li> `install`: Installs the latest supported versions of .NET runtimes and SDKs. </li><li> `uninstall`: Uninstalls unsupported or specific versions of .NET runtimes and SDKs. </li><li> `update`: Updates to latest patches and removes superseded patches. </li><li> `renew`: Removes all unsupported versions of .NET runtimes and SDKs and installs the latest available version.</li></ul> **Note:** Default Action is `list` |
| `Type`   | <ul><li>`sdk`</li><li>`runtime`</li><li>`desktopRuntime`</li><li>`aspNetCoreRuntime`</li><li>`all`</li></ul> | False  |  - | DropDown  | Select the type of .NET component to manage. Valid values are: <br /><br /> <ul><li>`sdk`: Manages .NET SDKs. </li><li> `runtime`: Manages .NET runtimes. </li><li> `desktopRuntime`: Manages .NET desktop runtimes. </li><li>`aspNetCoreRuntime`: Manages ASP.NET Core runtimes. </li><li>`all`: Manages all .NET components. </li></ul> **Note:** Default Type is `desktopRuntime`|
| `Version` | <ul><li>`8`</li><li>`9`</li><li>`8, 9`</li></ul> | False |  - | Text String    | (Optional) Limit the action to specific .NET versions by major version number (e.g., `8`, `9`, or `8, 9, 10`). When omitted, the script uses its default behavior for each action. Accepts both supported and EOL versions for `list`, `install`, `uninstall`, and `update`. For `renew`, all specified versions must be actively supported. **Note:** Default is not set (all applicable versions are targeted). |
| `Force` |  | False |  - | Flag | Select it to apply forced MSI dependency bypass during removal. If `Force` is not selected, normal safe behavior is used. |

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

**Name:** `Manage - .net Runtimes`  
**Description:** `This script ensures that the system is running the latest supported versions of .NET runtimes and SDKs while removing unsupported versions to maintain a clean and secure environment. It manages the installation, uninstallation, and listing of .NET runtimes and SDKs on a Windows system.`  
**Category:** `Custom`

![Image](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image1.webp)

### Parameters

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

### Action

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  

- Set `Action` in the `Parameter Name` field.
- Select `DropDown` from the `Parameter Type` dropdown menu.
- Select `String` from the `Option Type` dropdown menu.
- Add `list`,`install`,`uninstall`,`update`,`renew` from the `Option Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image2.webp)

### Type

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  

- Set `Type` in the `Parameter Name` field.
- Select `DropDown` from the `Parameter Type` dropdown menu.
- Select `String` from the `Option Type` dropdown menu.
- Add `sdk`,`runtimes`,`desktopRuntime`,`aspNetCoreRuntime`,`all` from the `Option Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image3.webp)

### Version

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  

- Set `Version` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image4.webp)

### Force

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  

- Set `Force` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image5.webp)


### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### **Row 1 Function: PowerShell script**

- **Notes:** `<Leave it Blank>`  
- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `600`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `Windows`  
- **PowerShell Script Editor:**

```PowerShell
<#
.SYNOPSIS
Executes the Optimize-DotNetRunTime remediation script.

.DESCRIPTION
This script acts as a secure wrapper for executing the Optimize-DotNetRunTime payload script.
It creates the required working directory, configures secure TLS communication, downloads the
latest approved script from the content repository, validates the script code signature, and
executes the payload with optional RMM-provided parameters.

The script ensures that only scripts signed with the approved code-signing certificate are
executed. If the downloaded script cannot be retrieved, the script will attempt to use an
existing local copy when available. Execution is stopped if signature validation fails.

.PARAMETER Action
Specifies the action to perform during the Optimize-DotNetRunTime execution.

.PARAMETER Type
Specifies the target type or optimization category.

.PARAMETER Version
Specifies the .NET Runtime version to evaluate or optimize.

.PARAMETER Force
Specifies whether to force execution of the optimization action regardless of existing state.

.NOTES
Project Name: Optimize-DotNetRunTime

The script is designed for use with an RMM platform and retrieves the execution payload from
the approved content repository.

Operational considerations:
- The code-signing certificate thumbprint validation must not be modified.
- The downloaded payload script must have a valid, timestamped Authenticode signature.
- TLS 1.2 is required for secure communication with the content repository.
- Existing local payload files may be used if the download operation fails.
- Execution will terminate if the payload signature validation fails.
- Logs and error details are stored in the configured working directory for troubleshooting.
#>

#region globals
$ProgressPreference = 'SilentlyContinue'
$WarningPreference = 'SilentlyContinue'
$VerbosePreference = 'SilentlyContinue'
#endregion

#region basic variables
$projectName = 'Optimize-DotNetRunTime'
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
$Parameters = @{}

$ParamAction = '@Action@'
if ($ParamAction -in ('list','install','uninstall','update','renew')) {
    $Parameters += @{Action = $ParamAction}
}

$ParamType = '@Type@'
if ($ParamType -in ('all','runtime','sdk','desktopRuntime','aspNetCoreRuntime')) {
    $Parameters += @{Type = $ParamType}
}

$ParamVersion = '@Version@'
if ($ParamVersion -match '^\d+(\.\d+)*$') {
    $Parameters += @{Version = $ParamVersion }
}

$ParamForce = '@Force@'

if ($ParamForce -match '^(Yes|1|True|Y)$') {
    $Parameters += @{Force = $true}
}
#endregion

#region mandatory function
#This function validates script code signatures.
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
#DO NOT change this block. It sets TLS policy to ensure secure download communication with the content repository.
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
#DO NOT change this block. It creates the working directory when it does not already exist.
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
#DO NOT change this block. It downloads the script from the content repository, refreshing the local copy when available.
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
#DO NOT change this block. It validates the downloaded script signature before execution.
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
#DO NOT change this block. It validates the script execution by checking for the expected log files and outputs their content for verification.
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
![Image](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image6.webp)

#### **Row 7 Function: Script Log**

- **Notes:** `<Leave it Blank>`  
- **Continue on Failure:** `False`  
- **Operating System:** `Windows`  
- **Script Log Message:** `%Output%`  

![Image](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image7.webp)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image8.webp)

## Output

- Script Logs

## Changelog

### 2026-08-11

- Initial version of the document
