---
id: '3b44e58d-1764-414b-94fd-05fedddd511d'
slug: /3b44e58d-1764-414b-94fd-05fedddd511d
title: 'Get New SQL Updates'
title_meta: 'Get New SQL Updates'
keywords: ['sql', 'sql-server', 'sql-server-patching']
description: 'Audits and reports on new SQL-related Windows Updates since the last script run.'
tags: ['auditing', 'mssql', 'patching']
draft: false
unlisted: false
last_update:
  date: 2026-08-12
---

## Summary

Audits and reports on new SQL-related Windows Updates available for installation since the last execution. On its first run, the script retrieves updates released within the past 90 days. Detection uses the native Windows Update API and falls back to the PSWindowsUpdate module only when the API scan fails or returns no results.

The script also manages the ConnectWise ticket lifecycle by firing webhooks to the CWRMM Ticket Management for Monitors workflow:

- **Ticket created:** When one or more SQL updates released after the last successful run are detected on the machine.
- **Ticket closed:** When no SQL updates remain available for installation on the machine (all previously reported updates have been installed).
- **No action:** When SQL updates are still available but were already reported on a previous run (no new releases since the last run).

Because a Create webhook fires on every run that detects newly released updates, a machine can have multiple open tickets when patches are released on different days. For example, a patch released and detected today opens a ticket; a second patch released tomorrow and detected on the next run opens another ticket while the first one remains open.

If neither detection method completes, the scan is treated as an unknown state rather than a clean machine: the script fails without triggering a webhook and without advancing the last run date, so pending updates remain eligible for reporting on the next run.

**Note:** Script requires PowerShell 5+.

## Sample Run

![Image1](../../../static/img/docs/3b44e58d-1764-414b-94fd-05fedddd511d/image1.webp)

## Dependencies

- [Custom Field: Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab)
- [Group: SQL Servers](/docs/85ffcde0-01c8-4e6b-8c08-51371f80ae9c)
- [Triggers: CWRMM Ticket Management for Monitors](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7)
- [Workflow: CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57)
- [PowerShell: Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)
- [Solution: New SQL Updates](/docs/08281245-9380-4946-b1a6-099aebfffd6f)

## Task Setup Path

**Tasks Path:** `AUTOMATION` ➞ `Tasks`  
**Task Type:** `Script Editor`

## Task Creation

### Description

- **Name:** `Get New SQL Updates`  
- **Description:** `Audits and reports on new SQL-related Windows Updates since the last script run.`  
- **Category:** `Patching`

![Image2](../../../static/img/docs/3b44e58d-1764-414b-94fd-05fedddd511d/image2.webp)

### Script Editor

#### Step 1: Row -> Set Pre-defined Variable ( @workflowWebhookUrl@ = Ticket_Mgmt_Webhook_Url )

- **Variable Name:** `workflowWebhookUrl`  
- **Custom Field:** `Ticket_Mgmt_Webhook_Url`  
- **Operating System:** `Windows`  
- **Continue on Failure:** `False`  
- **PowerShell Script Editor:**

![Image5](../../../static/img/docs/3b44e58d-1764-414b-94fd-05fedddd511d/image5.webp)

#### Step 2: Row -> PowerShell script

- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `900`  
- **Operating System:** `Windows`  
- **Continue on Failure:** `False`  
- **PowerShell Script Editor:**

```PowerShell
#requires -RunAsAdministrator
#requires -Version 5.1

<#
.SYNOPSIS
    Audits and reports on new SQL-related Windows Updates since the last script run and manages ConnectWise ticketing.

.DESCRIPTION
    This script is designed to run as an administrator and requires PowerShell 5 or higher.
    It automates the detection of new SQL-related Windows Updates using the native Windows Update API,
    falling back to the PSWindowsUpdate module if necessary.
    It maintains a record of its last run date, in UTC, in a persistent storage table, enabling incremental
    update checks.
    Additionally, it manages a ConnectWise ticket lifecycle via webhooks: creating a ticket when new updates
    are found, and closing it when no SQL updates remain on the machine.

    A scan that fails is treated as an unknown state rather than a clean machine. If neither detection method
    completes, the script throws without triggering a webhook and without advancing the last run date.
    The last run date is only advanced after the relevant webhook has been triggered successfully, so a
    failed webhook leaves the detected updates eligible for reporting on the next run.

.EXAMPLE
    Invoke-SqlUpdateAudit.ps1

    Runs the script, outputs new SQL updates detected since the last run, and triggers ConnectWise webhooks as needed.
#>

[CmdletBinding()]
param()

#region globals
$ProgressPreference = 'SilentlyContinue'
$WarningPreference = 'SilentlyContinue'
$ConfirmPreference = 'None'
#endregion

#region variables
$tableName = 'availableSqlUpdatesAudit'
$webhookUrl = '@workflowWebhookUrl@'
$companyName = '%CompanyName%'

$dateFormat = 'yyyy-MM-dd HH:mm:ss'
$invariantCulture = [System.Globalization.CultureInfo]::InvariantCulture

$deviceId = 'Unknown'
$regPath = 'HKLM:\SOFTWARE\WOW6432Node\ITSPlatform'
#endregion

#region set tls policy
$supportedTlsVersions = [enum]::GetValues('Net.SecurityProtocolType')
if (($supportedTlsVersions -contains 'Tls13') -and ($supportedTlsVersions -contains 'Tls12')) {
    [System.Net.ServicePointManager]::SecurityProtocol =
    [Enum]::ToObject([Net.SecurityProtocolType], 12288) -bor
    [Enum]::ToObject([Net.SecurityProtocolType], 3072)
} else {
    [Net.ServicePointManager]::SecurityProtocol =
    [Enum]::ToObject([Net.SecurityProtocolType], 3072)
}
#endregion

#region strapper
$module = 'Strapper'
$moduleScriptName = 'Install-PSGalleryModule'
$moduleScriptUrl = 'https://contentrepo.net/repo/script/{0}.ps1' -f $moduleScriptName
$moduleScriptContent = Invoke-RestMethod -Uri $moduleScriptUrl -UseBasicParsing -ErrorAction Stop
$moduleScript = [scriptblock]::Create($moduleScriptContent)
& $moduleScript -Name $module -ErrorAction Stop
(Import-Module -Name $module) 3>&1 2>&1 1>$null
Set-StrapperEnvironment
#endregion

#region deviceid
if (Test-Path -Path $regPath) {
    try {
        $regItem = Get-ItemProperty -Path $regPath -ErrorAction Stop
        if ($null -ne $regItem.privateendpointid) {
            $deviceId = $regItem.privateendpointid
        }
    } catch {
        Write-Log -Text ('Failed to retrieve Device ID from registry. Error: {0}' -f $Error[0].Exception.Message) -Level Warning
    }
}
#endregion

#region functions
function ConvertTo-UtcDateTime {
    <#
    .SYNOPSIS
        Normalizes a datetime value to UTC.
    .DESCRIPTION
        Windows Update reports deployment timestamps in UTC, but COM marshalling surfaces them with an
        unspecified DateTimeKind, which makes them unsafe to compare against a local timestamp. Values
        already tagged as UTC are returned unchanged, local values are converted, and unspecified values
        are tagged as UTC without shifting the underlying value.
    #>
    [CmdletBinding()]
    [OutputType([datetime])]
    param(
        [Parameter(Mandatory)]
        [datetime]$DateTime
    )

    #region main
    switch ($DateTime.Kind) {
        'Utc' { return $DateTime }
        'Local' { return $DateTime.ToUniversalTime() }
        default { return [datetime]::SpecifyKind($DateTime, [System.DateTimeKind]::Utc) }
    }
    #endregion
}

function Get-LastRunDate {
    <#
    .SYNOPSIS
        Retrieves the last run date, in UTC, from persistent storage.
    .DESCRIPTION
        Queries the Strapper storage table for the last execution date and returns it as a UTC datetime.
        If no usable value is found, defaults to 90 days ago. A missing table is expected on the first run
        and is not treated as a failure.
    #>
    [CmdletBinding()]
    [OutputType([datetime])]
    param()

    #region main
    $defaultDate = (Get-Date).ToUniversalTime().AddDays(-90)
    $storedObjects = try { @(Get-StoredObject -TableName $tableName -ErrorAction Stop) } catch { @() }

    if ($storedObjects.Count -eq 0 -or [string]::IsNullOrWhiteSpace($storedObjects[-1].LastRunDate)) {
        Write-Log -Text ('No usable last run date found in the "{0}" storage table. Defaulting to {1} UTC.' -f $tableName, $defaultDate.ToString($dateFormat, $invariantCulture)) -Level Information
        return $defaultDate
    }

    $storedDate = [string]$storedObjects[-1].LastRunDate
    $parsedDate = [datetime]::MinValue
    $styles = [System.Globalization.DateTimeStyles]'AssumeUniversal, AdjustToUniversal'

    if (-not [datetime]::TryParseExact($storedDate, $dateFormat, $invariantCulture, $styles, [ref]$parsedDate)) {
        Write-Log -Text ('Unable to parse the stored last run date "{0}". Defaulting to {1} UTC.' -f $storedDate, $defaultDate.ToString($dateFormat, $invariantCulture)) -Level Warning
        return $defaultDate
    }

    return $parsedDate
    #endregion
}

function Set-LastRunDate {
    <#
    .SYNOPSIS
        Saves the current UTC date to persistent storage.
    .DESCRIPTION
        Updates the Strapper storage table with the current execution timestamp in UTC, using an invariant
        format so that it round-trips regardless of the machine's culture. Throws if the write fails, since a
        silently dropped write would cause the same updates to be reported again on the next run.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([void])]
    param()

    #region main
    $lastRun = @{
        LastRunDate = (Get-Date).ToUniversalTime().ToString($dateFormat, $invariantCulture)
    }
    if ($PSCmdlet.ShouldProcess('Update last run date')) {
        try {
            $lastRun | Write-StoredObject -TableName $tableName -Clobber -Depth 2 -ErrorAction Stop
        } catch {
            $message = 'Failed to write the last run date. Already reported updates may be reported again on the next run. Reason: {0}' -f $Error[0].Exception.Message
            Write-Log -Text $message -Level Error
            throw $message
        }
    }
    #endregion
}

function Get-SqlUpdatesViaCom {
    <#
    .SYNOPSIS
        Fetches SQL-related updates using the native Windows Update COM API.
    .DESCRIPTION
        Queries the Microsoft.Update.Session COM object for uninstalled, unhidden updates, filters them by SQL
        title, and projects each match into a normalized object with a UTC release date. Throws if the scan
        itself fails, so the caller can tell a failed scan apart from a machine with no pending SQL updates.

        Zero results are emitted as no pipeline output, so callers must wrap the call in @() before counting.
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param()

    #region main
    $sqlUpdates = [System.Collections.ArrayList]::new()

    try {
        $session = New-Object -ComObject 'Microsoft.Update.Session' -ErrorAction Stop
        $searcher = $session.CreateUpdateSearcher()
        $searchResult = $searcher.Search('IsInstalled=0 and IsHidden=0')
    } catch {
        $message = 'Failed to query the Windows Update API. Reason: {0}' -f $Error[0].Exception.Message
        Write-Log -Text $message -Level Warning
        throw $message
    }

    foreach ($update in $searchResult.Updates) {
        if ($update.Title -notmatch 'SQL') {
            continue
        }

        $releaseDate = $null
        if ($update.LastDeploymentChangeTime) {
            $releaseDate = ConvertTo-UtcDateTime -DateTime $update.LastDeploymentChangeTime
        }

        $null = $sqlUpdates.Add(
            [PSCustomObject]@{
                KB           = @($update.KBArticleIDs) -join ', '
                Title        = $update.Title
                Description  = $update.Description
                ReleaseDate  = $releaseDate
                IsMandatory  = $update.IsMandatory
                MsrcSeverity = $update.MsrcSeverity
            }
        )
    }

    return $sqlUpdates.ToArray()
    #endregion
}

function Get-SqlUpdatesViaModule {
    <#
    .SYNOPSIS
        Fetches SQL-related updates using the PSWindowsUpdate module.
    .DESCRIPTION
        Installs, imports, and queries the PSWindowsUpdate module for SQL updates, projecting each result into
        the same normalized shape as the COM path so downstream filtering and reporting are identical. Used as
        a fallback mechanism. Throws if the scan fails.

        Zero results are emitted as no pipeline output, so callers must wrap the call in @() before counting.
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject[]])]
    param()

    #region main
    $updateModuleName = 'PSWindowsUpdate'
    $installScriptName = 'Install-PSGalleryModule'
    $installScriptUrl = 'https://contentrepo.net/repo/script/{0}.ps1' -f $installScriptName
    $sqlUpdates = [System.Collections.ArrayList]::new()

    try {
        $installScriptContent = Invoke-RestMethod -Uri $installScriptUrl -UseBasicParsing -ErrorAction Stop
        $installScript = [scriptblock]::Create($installScriptContent)
        & $installScript -Name $updateModuleName -ErrorAction Stop
        (Import-Module -Name $updateModuleName) 3>&1 2>&1 1>$null

        $rawUpdates = Get-WindowsUpdate -Title 'SQL' -ErrorAction Stop
    } catch {
        $message = 'Failed to retrieve SQL updates via {0}. Reason: {1}' -f $updateModuleName, $Error[0].Exception.Message
        Write-Log -Text $message -Level Warning
        throw $message
    }

    foreach ($update in @($rawUpdates)) {
        $releaseDate = $null
        if ($update.LastDeploymentChangeTime) {
            $releaseDate = ConvertTo-UtcDateTime -DateTime $update.LastDeploymentChangeTime
        }

        $kb = ''
        if ($update.PSObject.Properties['KB'] -and $update.KB) {
            $kb = [string]$update.KB
        } elseif ($update.KBArticleIDs) {
            $kb = @($update.KBArticleIDs) -join ', '
        }

        $null = $sqlUpdates.Add(
            [PSCustomObject]@{
                KB           = $kb
                Title        = $update.Title
                Description  = $update.Description
                ReleaseDate  = $releaseDate
                IsMandatory  = $update.IsMandatory
                MsrcSeverity = $update.MsrcSeverity
            }
        )
    }

    return $sqlUpdates.ToArray()
    #endregion
}

function Invoke-ConnectWiseWorkflow {
    <#
    .SYNOPSIS
        Posts a ticket action to the ConnectWise workflow webhook.
    .DESCRIPTION
        Sends the supplied action, subject, body, and device ID to the configured workflow webhook. Throws on
        failure so that the caller does not advance the last run date for a ticket that was never raised or
        closed.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([void])]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('Create', 'Close')]
        [string]$Action,

        [Parameter(Mandatory)]
        [string]$TicketSubject,

        [Parameter(Mandatory)]
        [string]$TicketBody,

        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string]$DeviceId
    )

    #region main
    if (-not $PSCmdlet.ShouldProcess(('Trigger the ConnectWise {0} workflow' -f $Action))) {
        return
    }

    $payload = [ordered]@{
        Action        = $Action
        TicketSubject = $TicketSubject
        TicketBody    = $TicketBody
        DeviceId      = $DeviceId
    }

    try {
        $jsonPayload = $payload | ConvertTo-Json -Depth 2
        Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $jsonPayload -ContentType 'application/json' -UseBasicParsing -ErrorAction Stop | Out-Null
    } catch {
        $message = 'Failed to trigger the ConnectWise {0} workflow. The last run date was not updated. Reason: {1}' -f $Action, $Error[0].Exception.Message
        Write-Log -Text $message -Level Error
        throw $message
    }

    Write-Log -Text ('Successfully triggered the ConnectWise {0} workflow for SQL updates.' -f $Action) -Level Information
    #endregion
}
#endregion

#region main
$lastRunDate = Get-LastRunDate
$lastRunDateDisplay = $lastRunDate.ToString($dateFormat, $invariantCulture)
Write-Log -Text ('Auditing for SQL updates released after {0} UTC.' -f $lastRunDateDisplay) -Level Information

$sqlUpdates = @()
$scanSucceeded = $false

Write-Log -Text 'Querying for SQL updates using the native Windows Update API.' -Level Information
try {
    $sqlUpdates = @(Get-SqlUpdatesViaCom)
    $scanSucceeded = $true
    Write-Log -Text ('The Windows Update API scan completed and returned {0} available SQL update(s).' -f $sqlUpdates.Count) -Level Information
} catch {
    Write-Log -Text 'The Windows Update API scan did not complete.' -Level Warning
}

if (-not $scanSucceeded -or $sqlUpdates.Count -eq 0) {
    Write-Log -Text 'Falling back to the PSWindowsUpdate module.' -Level Information
    try {
        $sqlUpdates = @(Get-SqlUpdatesViaModule)
        $scanSucceeded = $true
        Write-Log -Text ('The PSWindowsUpdate scan completed and returned {0} available SQL update(s).' -f $sqlUpdates.Count) -Level Information
    } catch {
        Write-Log -Text 'The PSWindowsUpdate scan did not complete.' -Level Warning
    }
}

if (-not $scanSucceeded) {
    $scanFailureMessage = 'Unable to determine the SQL update status for {0}. Both the native Windows Update API and the PSWindowsUpdate module scans failed, so the machine cannot be treated as up to date. No ConnectWise workflow was triggered and the last run date was left unchanged.' -f $env:COMPUTERNAME
    Write-Log -Text $scanFailureMessage -Level Error
    throw $scanFailureMessage
}

$ticketSubject = 'SQL Updates pending review for {0} at {1}' -f $env:COMPUTERNAME, $companyName

if ($sqlUpdates.Count -eq 0) {
    $noUpdatesMessage = 'No SQL updates are available on the machine for installation.'
    Write-Log -Text $noUpdatesMessage -Level Information

    Invoke-ConnectWiseWorkflow -Action 'Close' -TicketSubject $ticketSubject -TicketBody 'All SQL updates have been addressed. No SQL updates are currently available for installation.' -DeviceId $deviceId

    Set-LastRunDate
    return $noUpdatesMessage
}

$filteredUpdates = @($sqlUpdates | Where-Object { $null -ne $_.ReleaseDate -and $_.ReleaseDate -gt $lastRunDate })

if ($filteredUpdates.Count -eq 0) {
    $noNewUpdateMessage = 'No new SQL Update(s) detected since {0} UTC. {1} previously reported SQL update(s) are still available for installation.' -f $lastRunDateDisplay, $sqlUpdates.Count
    Write-Log -Text $noNewUpdateMessage -Level Information

    Set-LastRunDate
    return $noNewUpdateMessage
}

$detectedUpdates = $filteredUpdates | Select-Object -Property 'KB', 'Title', 'Description',
@{ Name = 'ReleaseDateUtc'; Expression = { $_.ReleaseDate.ToString($dateFormat, $invariantCulture) } },
'IsMandatory', 'MsrcSeverity'

$logMessage = ('{0} new SQL Update(s) detected since {1} UTC.{2}{2}Detected Updates:{2}{3}' -f $filteredUpdates.Count, $lastRunDateDisplay, [Environment]::NewLine, ($detectedUpdates | Format-List | Out-String -Width 4096))
Write-Log -Text $logMessage -Level Information

Invoke-ConnectWiseWorkflow -Action 'Create' -TicketSubject $ticketSubject -TicketBody $logMessage -DeviceId $deviceId

Set-LastRunDate
return $logMessage
#endregion
```

![Image3](../../../static/img/docs/3b44e58d-1764-414b-94fd-05fedddd511d/image3.webp)

#### Step 3: Row -> Script Log

- **Script Log Message:** `%Output%`  
- **Continue on Failure:** `False`  
- **Operating System:** `Windows`

![Image4](../../../static/img/docs/3b44e58d-1764-414b-94fd-05fedddd511d/image4.webp)

## Completed Script

![Image8](../../../static/img/docs/3b44e58d-1764-414b-94fd-05fedddd511d/image8.webp)

## Output

- Script Log
- Ticket

## Ticketing

**Subject:** `SQL Updates pending review for <Computer Name> at <Client Name>`  
**Ticket Body:** `<Output of the ticket body>`
**Ticket Body Example:**

```PlainText
1 new SQL Update(s) detected since 2025-05-15 07:41:50.

Detected Updates:


KB           : KB5063757
Title        : Security Update for SQL Server 2019 RTM CU (KB5063757)
Description  : Security issues have been identified in the SQL Server 2019 RTM CU that could allow an attacker to
               compromise your system and gain control over it. You can help protect your computer by installing this
               update from Microsoft. After you install this item, you may have to restart your computer.
ReleaseDate  : 8/12/2025 12:00:00 AM
IsMandatory  : False
MsrcSeverity : Important
```

## Schedule Task

### Task Details

- **Name:** `Get New SQL Updates`  
- **Description:** `Audits and reports on new SQL-related Windows Updates since the last script run.`  
- **Category:** `Patching`

![Image9](../../../static/img/docs/3b44e58d-1764-414b-94fd-05fedddd511d/image9.webp)

### Schedule

- **Schedule Type:**  `Schedule`  
- **Timezone:** `Local Machine Time`  
- **Start:** `<Current Date>`  
- **Trigger:** `Time` `At` `<Current Time>`  
- **Recurrence:** `Every day`

![Image10](../../../static/img/docs/3b44e58d-1764-414b-94fd-05fedddd511d/image10.webp)

### Targeted Resource

**Device Group:** `SQL Servers`

![Image11](../../../static/img/docs/3b44e58d-1764-414b-94fd-05fedddd511d/image11.webp)

### Completed Scheduled Task

![Image12](../../../static/img/docs/3b44e58d-1764-414b-94fd-05fedddd511d/image12.webp)

## Changelog

### 2026-08-12

- Updated the script to use the ConnectWise workflow webhook for ticketing instead of the task's built-in ticketing function.
- Switched primary update detection to the native Windows Update API; the PSWindowsUpdate module is now installed and imported only as a fallback when the API scan fails or returns no updates.

### 2025-08-13

- Initial version of the document
