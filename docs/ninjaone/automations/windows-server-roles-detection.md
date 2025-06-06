---
id: '5cda8c79-bcd0-4226-b5a4-db846b9b35a9'
slug: /5cda8c79-bcd0-4226-b5a4-db846b9b35a9
title: 'Windows Server Roles Detection'
title_meta: 'Windows Server Roles Detection'
keywords: ['roles', 'server-roles', 'powershell', 'custom-fields']
description: 'Retrieves installed Windows Server roles, additional services, and FSMO roles (if applicable).'
tags: ['custom-fields']
draft: false
unlisted: false
---

## Overview

Retrieves installed Windows Server roles, additional services, and FSMO roles (if applicable).

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `Windows Server Roles Detection`  
![image1](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image1.webp)

**Run As:** `System`  
**Preset Parameter:** `Leave it untouched`  
**Custom Field:** `cpvalRolesDetected`  
![image2](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image2.webp)

**Run Automation:** `Yes`  
![RunAutomation](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/runautomation.webp)

## Dependencies

[cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)

## Parameters

| Name | Example | Required | Default | Type | Description |
| ---- | ------- | -------- | ------- | ---- | ----------- |
| CustomField | cpvalRolesDetected | True | cpvalRolesDetected | String/Text | Specifies a custom field name to store results using Ninja-Property-Set. Accepts value from `customfield` variable. |

## Automation Setup/Import

### Step 1

Navigate to `Administration` > `Library` > `Automation`  
![Step1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/step1.webp)

### Step 2

Locate the `Add` button on the right-hand side of the screen, click on it and click the `New Script` button.  
![Step2](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/step2.webp)

The scripting window will open.  
![ScriptingScreen](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/scriptingscreen.webp)

### Step 3

Configure the `Create Script` as follows:

**Name:** `Windows Server Roles Detection`  
**Description:** `Retrieves installed Windows Server roles, additional services, and FSMO roles (if applicable).`  
**Categories:** `ProVal`  
**Language:** `PowerShell`  
**Operating System:** `Windows`  
**Architecture:** `All`  
**Run As:** `System`  
![Image3](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image3.webp)

### Step 4

Paste the following powershell script in the scripting windows:

```powershell
#Requires -Version 4.0

<#
.SYNOPSIS
    Retrieves installed Windows Server roles, additional services, and FSMO roles (if applicable).

.DESCRIPTION
    This script detects:
    - Windows Server roles using Get-WindowsFeature
    - Additional services through service/registry detection (SQL Server, Exchange Server, MySQL, Veeam, SharePoint)
    - FSMO roles if the server is an Active Directory Domain Controller
    
    Detection methods vary:
    - Windows roles: Built-in PowerShell cmdlets
    - Additional services: Service existence and registry entries
    - FSMO roles: Active Directory queries (only on Domain Controllers)

.PARAMETER CustomField
    Specifies a custom field name to store results using Ninja-Property-Set.
    Accepts value from $env:customfield if present.

.EXAMPLE
    Get-ServerRolesNinja
    ## EXAMPLE OUTPUT ##
    Active Directory Domain Services
    DNS Server
    File and Storage Services
    Schema Master
    PDC Emulator

.EXAMPLE
    -CustomField 'cpvalRolesDetected'
    Saves output to NinjaRMM custom field 'cpvalRolesDetected'

.OUTPUTS
    String array of installed components. FSMO roles appear only on Domain Controllers.

.NOTES
    Minimum OS Supported: Windows Server 2012
    Admin Privileges: Required for Windows Feature detection
#>

[CmdletBinding()]
param (
    [string]
    $CustomField
)

begin {
    # Prefer environment variable for custom field if available
    if (-not [string]::IsNullOrEmpty($env:customfield)) {
        $CustomField = $env:customfield
    }
} process {
    $InstalledFeatures = @()

    # Service-based detection for SQL Server
    $SQLServices = Get-Service | Where-Object { $_.DisplayName -match 'SQL Server' }

    # Exchange Server detection via critical service
    $ExchangeServices = Get-Service -Name MSExchangeServiceHost -ErrorAction SilentlyContinue

    # Hyper-V Cluster Detection via Service
    $HyperVCluster = Get-Service -Name ClusSvc -ErrorAction SilentlyContinue

    # MySQL detection through registry uninstall entries
    $MySQLServer = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, 
    HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall -ErrorAction SilentlyContinue |
        Get-ItemProperty | Where-Object { $_.DisplayName -match 'mysql server' }

    # Veeam detection via registry
    $VeeamBDR = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall,
    HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall -ErrorAction SilentlyContinue |
        Get-ItemProperty | Where-Object { $_.DisplayName -eq 'Veeam Backup & Replication' }

    # SharePoint detection via PowerShell snapin
    try {
        Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction Stop
        $SharePointServer = [bool](Get-Command Get-SPFarm -ErrorAction SilentlyContinue)
    } catch {
        $SharePointServer = $false
    }

    # Get core Windows Server roles
    $InstalledFeatures = (Get-WindowsFeature -ErrorAction SilentlyContinue |
            Where-Object { $_.Installed -and $_.FeatureType -eq 'Role' }).DisplayName

    # Add supplemental detections
    if ($SQLServices) { $InstalledFeatures += 'MSSQL Server' }
    if ($ExchangeServices) { $InstalledFeatures += 'Exchange Server' }
    if ($MySQLServer) { $InstalledFeatures += 'MySQL Server' }
    if ($VeeamBDR) { $InstalledFeatures += 'Veeam BDR' }
    if ($SharePointServer) { $InstalledFeatures += 'SharePoint Server' }
    if ($HyperVCluster) { $InstalledFeatures += 'Hyper-V Cluster' }

    # FSMO Role Detection (only if AD DS role is present)
    if ($InstalledFeatures -contains 'Active Directory Domain Services') {
        try {
            Import-Module ActiveDirectory -ErrorAction Stop
            $currentDC = Get-ADDomainController -Identity $env:COMPUTERNAME -ErrorAction Stop
            $currentServerFQDN = $currentDC.HostName

            $forest = Get-ADForest
            $domain = Get-ADDomain

            # Map FSMO roles to their current holders
            $fsmoRoles = @{
                'Schema Master' = $forest.SchemaMaster
                'Domain Naming Master' = $forest.DomainNamingMaster
                'PDC Emulator' = $domain.PDCEmulator
                'RID Master' = $domain.RIDMaster
                'Infrastructure Master' = $domain.InfrastructureMaster
            }

            # Identify roles hosted on this server
            $InstalledFeatures += foreach ($role in $fsmoRoles.Keys) {
                if ($fsmoRoles[$role] -match "^$currentServerFQDN$") { $role }
            }
        } catch {
            Write-Output 'Active Directory module not available - skipping FSMO checks'
        }
    }

    # NinjaRMM Custom Field
    if ($CustomField) {
        Ninja-Property-Set -Name $CustomField -Value ($InstalledFeatures -join "`n")
    }
} end {
    return $InstalledFeatures
}
```

![Image4](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image4.webp)

## Script Variables

Click the `Add` button next to `Script Variables`.  
![AddVariableButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/addvariablebutton.webp)

Select the `String/Text` option.  
![Image5](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image5.webp)

The `Add String/Text Variable` window will open.  
![Image6](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image6.webp)

In the box, fill in the following details and select `Add` to create the script variable.  

**Name:** `Custom Field`  
**Description:** `Specifies the custom field where the detected roles will be stored.`  
**Mandatory:** `Enable`  
**Set Default Value:** `cpvalRolesDetected`  

![Image7](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image7.webp)

## Saving the Automation

Click the Save button in the top-right corner of the screen to save your automation.  
![SaveButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/savebutton.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/mfa.webp)

## Completed Automation

![Image8](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image8.webp)

## Output

- Activity Details  
![Image9](../../../static/img/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9/image9.webp)