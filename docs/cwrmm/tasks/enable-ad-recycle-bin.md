---
id: 'bb53445d-532a-4ec4-b4c5-3f8d0610d6f7'
slug: /bb53445d-532a-4ec4-b4c5-3f8d0610d6f7
title: 'Enable AD Recycle Bin'
title_meta: 'Enable AD Recycle Bin'
keywords: ['ad', 'recycle', 'bin', 'infrastructure', 'masters']
description: 'This document provides a detailed guide on how to enable the Active Directory Recycle Bin on Windows Infrastructure Masters, including script creation, dependencies, and deployment instructions.'
tags: ['active-directory', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to enable the Active Directory (AD) Recycle Bin on AD Infrastructure Masters.

## Dependencies

- [Custom Fields - AD Recycle Bin](/docs/e4801a6f-1945-4aee-bd39-1601a185b9eb)
- [Device Group - Infrastructure Master - Without Recycle Bin](/docs/24509826-3f15-4594-8bb2-4f801709720b)

## Create Script

To implement this script, please create a new "PowerShell" style script in the system.

![Image 1](../../../static/img/Enable-AD-Recycle-Bin/image_1.png)  
![Image 2](../../../static/img/Enable-AD-Recycle-Bin/image_2.png)  

**Name:** Enable AD Recycle Bin  
**Description:** This task enables AD recycle on Windows Infrastructure Masters  
**Category:** Custom  
![Image 3](../../../static/img/Enable-AD-Recycle-Bin/image_3.png)  

### Script

#### Row 1 Function: PowerShell Script

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_4.png)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds.

```PowerShell
$result = (Get-Host | Select -exp Version).ToString()
if($result -ge 3)
{
Write-Host "Supported: $result"
}
else
{
Write-Host "OutDated: $result"
}
```

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_5.png)  

#### Step 2 Logic: If/Then

- Add a new `If/Then` logic from the Add Logic dropdown menu.  

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_6.png)  

#### ROW 2a Condition: Output Contains

- Type `Outdated` in the Value box.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_7.png)  

#### ROW 2b Function: Set Custom Field

Add a new row in the If Section by clicking the Add Row button.

- Search and select the `Set Custom Field` function.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_8.png)  

- Search and select the `AD Recycle Bin` Custom Field.
- Type `Outdated PS version` in the `Value` box and click the Save button.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_9.png)  

#### ROW 2c Function: Script Exit

- Add a new row in the If Section by clicking the Add Row button.
- Search and select the `Script Exit` function.
- Input the following:

```PlainText
The AD Recycle Bin failed to be enabled on the DC server as the PowerShell version is outdated. Minimum version required is above 3.0 and the current version is %output%
```

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_10.png)  
![Image](../../../static/img/Enable-AD-Recycle-Bin/image_11.png)  

#### ROW 3 Function: PowerShell Script

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_4.png)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds.

```PowerShell
$adwsService = Get-Service -Name ADWS -ErrorAction SilentlyContinue
if ($adwsService -eq $null) {
    Write-Output "ADWS service is not installed."
} elseif ($adwsService.Status -ne "Running") {
    Start-Service -Name ADWS
    Write-Output "ADWS service has been started."
} else {
    Write-Output "ADWS service is already running."
}
```

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_12.png)  

#### ROW 4 Function: PowerShell Script

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_4.png)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds.

```PowerShell
Import-Module ActiveDirectory
$DomainCheck = (Get-ADDomain).DomainMode
$ForestCheck = (Get-ADForest).ForestMode

if($DomainCheck -eq 'Windows2008Domain' -or $ForestCheck -eq 'Windows2008Forest' -or $DomainCheck -match '2003' -or $ForestCheck -match '2003')
{
    Write-Host "Minimum criteria for AD Recycle Bin enable is: Above 2008R2 Domain and Forest mode required."
}
else
{
    Write-Host "Eligible for AD Recycle Bin."
}
```

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_13.png)  

#### Step 5 Logic: If/Then

- Add a new `If/Then` logic from the Add Logic dropdown menu.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_6.png)  

#### ROW 5a Condition: Output Contains

- Type `Minimum criteria for AD Recycle Bin enable` in the Value box.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_14.png)  

#### Row 5b Function: Set Custom Field

Add another row by selecting the `ADD ROW` button in the `If` section of the `If/Then` section.

- Search and select the `Set Custom Field` function.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_15.png)  

- Search and select the `AD Recycle Bin` Custom Field.
- Type `Does not meet minimum criteria` in the `Value` box and click the Save button.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_16.png)  

#### ROW 5c Function: Script Exit

- Add a new row in the If Section by clicking the Add Row button.
- Search and select the `Script Exit` function.
- Input the following:

```PlainText
The AD Recycle Bin failed to be enabled on the DC server. The DomainMode or ForestMode is not eligible for the AD Recycle Bin to be enabled.

Logs:

%output%
```

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_17.png)  
![Image](../../../static/img/Enable-AD-Recycle-Bin/image_18.png)  

#### ROW 6 Function: PowerShell Script

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_4.png)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds.

```PowerShell
Import-Module ActiveDirectory

# Check the domain and forest modes
$DomainCheck = (Get-ADDomain).DomainMode
$ForestCheck = (Get-ADForest).ForestMode

if ($DomainCheck -eq 'Windows2008Domain' -or $ForestCheck -eq 'Windows2008Forest' -or $DomainCheck -match '2003' -or $ForestCheck -match '2003') {
    Write-Host "Minimum criteria for enabling the AD Recycle Bin: Domain and Forest modes must be above 2008R2."
} else {
    # Check if the Recycle Bin feature is already enabled
    $Result = Get-ADOptionalFeature -Filter * -ErrorAction SilentlyContinue | Select-Object -ExpandProperty EnabledScopes
    if ($Result) {
        Write-Host "The AD Recycle Bin is already enabled."
    } else {
        Write-Host "The AD Recycle Bin is not enabled. Proceeding to enable it."
        $Domain = Get-ADForest | Select-Object -ExpandProperty RootDomain
        Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target $Domain -Confirm:$false
        $Result = Get-ADOptionalFeature -Filter * -ErrorAction SilentlyContinue | Select-Object -ExpandProperty EnabledScopes
        if ($Result) {
            Write-Host "The AD Recycle Bin has been successfully enabled."
        } else {
            Write-Host "Failed to enable the AD Recycle Bin."
        }
    }
}
```

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_19.png)  

#### Step 7 Logic: If/Then/Else

- Add a new `If/Then/Else` logic from the Add Logic dropdown menu.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_20.png)  

#### ROW 7a Condition: Output Contains

- Type `Failed to enable` in the Value box.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_21.png)  

#### Step 7b Logic: If/Then

Add a new `If/Then` logic from the `Add Logic` dropdown menu inside the `IF` section.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_22.png)  

#### Row 7b(i) Condition: Custom Field Does Not Contain

- Select `Custom field` from the dropdown.
- Select `AD Recycle Bin` custom field from the dropdown.
- Select `Does Not Contain` from the dropdown.
- Type `Does not meet minimum criteria` into the value.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_23.png)  

Select ADD CONDITION in the Custom field section and add another condition.

- Select `Custom field` from the dropdown.
- Select `AD Recycle Bin` custom field from the dropdown.
- Select `Does Not Contain` from the dropdown.
- Type `Outdated PS version` into the value.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_24.png)  

Select ADD CONDITION in the Custom field section and add another condition.

- Select `Custom field` from the dropdown.
- Select `AD Recycle Bin` custom field from the dropdown.
- Select `Does Not Contain` from the dropdown.
- Type `Enabled` into the value.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_25.png)  

Select ADD CONDITION in the Custom field section and add another condition.

- Select `Custom field` from the dropdown.
- Select `AD Recycle Bin` custom field from the dropdown.
- Select `Does Not Contain` from the dropdown.
- Type `failed more than 3 times` into the value.

The whole custom field should look like this.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_26.png)  

#### Row 7b(ii) Condition: Set Pre-defined Variable

Add another row by selecting the `ADD ROW` button in the `IF` section of the internal `If/Then` section.

- Select `Set Pre-Defined Variable` function.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_27.png)  

- Select `Custom Field`.
- Input `AD_RecycleBin_Result` as the variable name.
- Select `AD Recycle Bin` custom field from the dropdown.
- Click Save.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_28.png)  

#### Row 7b(iii) Function: PowerShell Script

Add another row by selecting the `ADD ROW` button in the `IF` section of the internal `If/Then` section.

- Select PowerShell Script function.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_4.png)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds.

```PowerShell
if ('@AD_RecycleBin_Result@' -eq '2'){return 'failed more than 3 times'} 
elseif ('@AD_RecycleBin_Result@' -eq '0'){return '1'} 
elseif ('@AD_RecycleBin_Result@' -eq '1'){return '2'} 
else {return 'failed more than 3 times'}
```

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_29.png)  

#### Row 7b(iv) Function: Set Custom Field

Add another row by selecting the `ADD ROW` button in the `IF` section of the internal `If/Then` section.

- Search and select the `Set Custom Field` function.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_30.png)  

- Search and select the `AD Recycle Bin` Custom Field.
- Type `%Output%` in the `Value` box and click the Save button.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_31.png)  

#### Row 7b(v) Function: Script Exit

Add another row by selecting the `ADD ROW` button in the `Else` section of the internal `If/Then` section.

- Search and select the `Script Exit` function.
- Input the following:

```PlainText
Script failed to enable AD Recycle Bin on the DC server.

Logs:

%output%
```

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_32.png)  
![Image](../../../static/img/Enable-AD-Recycle-Bin/image_33.png)  

#### Row 7c Function: Set Custom Field

Add another row by selecting the `ADD ROW` button in the `Else` part of the `If/Then/Else` section.

- Search and select the `Set Custom Field` function.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_34.png)  

- Search and select the `AD Recycle Bin` Custom Field.
- Type `Enabled` in the `Value` box and click the Save button.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_35.png)  

The final task should look like the screenshot below.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_36.png)  
![Image](../../../static/img/Enable-AD-Recycle-Bin/image_37.png)  

## Script Deployment

This task must be scheduled on the [Infrastructure Master - Without Recycle Bin](/docs/24509826-3f15-4594-8bb2-4f801709720b) group for auto deployment. The script can also be run manually if required.

Go to Automations > Tasks.  
Search for Enable AD Recycle Bin.  
Then click on Schedule and provide the necessary parameters for script completion.

![Image](../../../static/img/Enable-AD-Recycle-Bin/image_38.png)  

## Output

- Script log
