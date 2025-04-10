---
id: 'a96db8f9-87fc-4e02-a1b3-2ed60913fc82'
slug: /a96db8f9-87fc-4e02-a1b3-2ed60913fc82
title: 'New Domain Admins'
title_meta: 'New Domain Admins'
keywords: ['domain', 'admin', 'task', 'monitoring', 'auditing']
description: 'This document outlines the implementation of a PowerShell script for retrieving information about newly created domain administrators and users added to administrative groups on domain controllers. It includes scheduling instructions, dependencies, and a detailed step-by-step guide for setting up the task effectively.'
tags: ['active-directory', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The task involves executing a PowerShell script on the domain controllers to retrieve information about recently created domain administrators or users who have been added to an administrative group since the last execution of this task. Subsequently, the acquired data is formatted and stored in [Custom Field - New Domain Admins](/docs/376db2a5-e76b-426f-b696-6791c83ab626), facilitating enhanced auditing and monitoring processes.

Importantly, this task should be scheduled against the primary domain controller for each domain.

## Update Notice: 27-December-2024

The task has been updated to create a ticket. Therefore, the `New Domain Admins` monitor is no longer needed. Please remove the monitor set before updating the task.

## Sample Run

![Sample Run 1](../../../static/img/New-Domain-Admins/image_16.png)  
![Sample Run 2](../../../static/img/New-Domain-Admins/image_17.png)  

## Dependencies

- [CW RMM - Custom Field - New Domain Admins](/docs/376db2a5-e76b-426f-b696-6791c83ab626)
- [CW RMM - Machine Group - Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8)
- [CW RMM - Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68)
- [CW RMM - Custom Field - Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae)
- [CW RMM - Task - Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168)

## Variables

| Name   | Description                             |
|--------|-----------------------------------------|
| Output | Output of the PowerShell script        |

### Implementation

Create the Custom Field [CW RMM - Custom Field - New Domain Admins](/docs/376db2a5-e76b-426f-b696-6791c83ab626).

## Create Script

Create a new "Script Editor" style script in the system to implement this task.

![Create Script](../../../static/img/New-Domain-Admins/image_18.png)  
![Script Editor](../../../static/img/New-Domain-Admins/image_19.png)  

**Name:** New Domain Admins  
**Description:** The task involves executing a PowerShell script on the domain controllers to retrieve information about recently created domain administrators or users who have been added to an administrative group since the last execution of this task.  
**Category:** Custom  

![Script Category](../../../static/img/New-Domain-Admins/image_20.png)  

### Script

Start by adding a row. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row](../../../static/img/New-Domain-Admins/image_21.png)  

#### Row 1 Function: PowerShell Script

![PowerShell Function](../../../static/img/New-Domain-Admins/image_22.png)  
![PowerShell Function 2](../../../static/img/New-Domain-Admins/image_23.png)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. This PowerShell function will validate whether the endpoint is a domain controller or not.

```powershell
$check = ( Get-CimInstance -Class Win32_ComputerSystem -ErrorAction SilentlyContinue ).DomainRole
if ( $check -in ( 4,5 ) ) {
    return 'domain controller'
} elseif ( $check -eq 1 ) {
    return 'domain joined'
} else {
    return 'Workgroup'
}
```

![Validation](../../../static/img/New-Domain-Admins/image_24.png)  

#### Row 2 Logic: If Then

![If Then Logic](../../../static/img/New-Domain-Admins/image_25.png)  
![If Then Logic 2](../../../static/img/New-Domain-Admins/image_26.png)  

##### Row 2a Condition: Output Does Not Contain

Click the dropdown `Contains` and select `Does Not Contain`, then enter `domain controller` in the text box.

![Output Condition](../../../static/img/New-Domain-Admins/image_27.png)  

##### Row 2b Function: Script Exit

Add a new row by clicking on the Add row button.  
![Add Row](../../../static/img/New-Domain-Admins/image_28.png)  

Select `Script Exit` Function.

![Script Exit](../../../static/img/New-Domain-Admins/image_29.png)  

Add this message to the `Error Message` field that will appear after selecting the `Script Exit` function.

**Error Message:** This script is designed to work for a domain controller only.

![Error Message](../../../static/img/New-Domain-Admins/image_30.png)  
![Error Message 2](../../../static/img/New-Domain-Admins/image_31.png)  

#### Row 3 Function: PowerShell Script

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/New-Domain-Admins/image_28.png)  

Select `PowerShell Script` function.

![PowerShell Script](../../../static/img/New-Domain-Admins/image_22.png)  
![PowerShell Script 2](../../../static/img/New-Domain-Admins/image_23.png)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```powershell
### Region Strapper ###
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
try {
    Update-Module -Name Strapper -ErrorAction Stop
} catch {
    Install-Module -Name Strapper -Repository PSGallery -SkipPublisherCheck -Force
    Get-Module -Name Strapper -ListAvailable | Where-Object { $_.Version -ne (Get-InstalledModule -Name Strapper).Version } | ForEach-Object { Uninstall-Module -Name Strapper -MaximumVersion $_.Version }
}
(Import-Module -Name 'Strapper') 3>&1 2>&1 1>$null
Set-StrapperEnvironment
#endregion
```

```powershell
$adminTableName = 'domainadmin'
$previousDomainAdmins = try { Get-StoredObject -TableName $adminTableName -WarningAction SilentlyContinue } catch { $null }
$adminGroupMembers = Get-ADGroupMember -Identity Administrators -Recursive | Where-Object { $_.ObjectClass -eq 'User' } | Select-Object -Property DistinguishedName, Name, ObjectClass, ObjectGUID, SamAccountName, SID -Unique
if (!$previousDomainAdmins) {
    Write-Log -Text 'No previous runs of the script were detected. Creating new chain.' -Level Information
} elseif ($newDomainAdmins = $adminGroupMembers | Where-Object { $_.SID.Value -notin $previousDomainAdmins.SID.Value }) {
    Write-Log -Text "$($newDomainAdmins.Count) new domain admin(s) detected." -Level Information
    Write-Output "New Domain admin(s): $(foreach ($admin in $newDomainAdmins) { "'$($admin.SamAccountName)';" })"
} else {
    Write-Log -Text 'No new domain admin detected.' -Level Information
    Write-Output 'No new domain admin detected.'
}
$adminGroupMembers | Write-StoredObject -TableName $adminTableName -Clobber -WarningAction SilentlyContinue -Depth 2
```

![Admin Table](../../../static/img/New-Domain-Admins/image_32.png)  

#### Row 4 Function: Set Custom Field

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/New-Domain-Admins/image_28.png)  

Select `Set Custom Field` Function.

![Set Custom Field](../../../static/img/New-Domain-Admins/image_33.png)  

When you select `Set Custom Field`, a new window will open.

![Custom Field Window](../../../static/img/New-Domain-Admins/image_34.png)  

In this window, search for the `New Domain Admins` field.

**Custom Field:** New Domain Admins  
**Value:** %Output% 

![Set Custom Field](../../../static/img/New-Domain-Admins/image_35.png)  

#### Row 5 Function: Script Log

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/New-Domain-Admins/image_28.png)  

Select `Script Log` function.

![Script Log](../../../static/img/New-Domain-Admins/image_36.png)  

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log Message](../../../static/img/New-Domain-Admins/image_37.png)  
![Script Log Message 2](../../../static/img/New-Domain-Admins/image_38.png)  

#### Row 6 Logic: If Then

![If Then Logic](../../../static/img/New-Domain-Admins/image_25.png)  
![If Then Logic 2](../../../static/img/New-Domain-Admins/image_26.png)  

##### Row 6a Condition: Output Contains

Click the dropdown `Contains` and select `Contains`, then enter `New Domain admin(s):` in the text box.

![Output Condition](../../../static/img/New-Domain-Admins/image_39.png)  

##### Row 6b Function: Set Pre-defined Variable

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/New-Domain-Admins/image_40.png)  

Select `Set Pre-defined Variable` Function.

![Set Pre-defined Variable](../../../static/img/New-Domain-Admins/image_41.png)  

This pop-up box will appear.

![Pop-up Box](../../../static/img/New-Domain-Admins/image_42.png)  

Select the `System Variable` button, set `Computer` for the `Variable Name` and `friendlyName` for the `System Variable`. `friendlyName` can be found in the `Asset` section. Click the `Save` button to save changes.  

![Save Changes 2](../../../static/img/New-Domain-Admins/image_44.png)  

##### Row 6c Function: Create Ticket

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/New-Domain-Admins/image_40.png)  

Select the `Create Ticket` function.

![Create Ticket](../../../static/img/New-Domain-Admins/image_45.png)  

This function will appear.

![Create Ticket Function](../../../static/img/New-Domain-Admins/image_46.png)  

**Subject:** `New domain admin detected on @computer@ at %companyname%`  
**Description:** `%Output%`  
**Priority:** `Medium`  

![Ticket Details](../../../static/img/New-Domain-Admins/image_47.png)  

Once all items are added, please save the task. The final task should look like the screenshot below.

![Final Task](../../../static/img/New-Domain-Admins/image_48.png)  
![Final Task 2](../../../static/img/New-Domain-Admins/image_49.png)  

## Deployment

It is suggested to run the task once per hour against the primary domain controllers or infrastructure masters.

- Go to `Automation` > `Tasks`.
- Search for `New Domain Admins Task`.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.  

![Schedule Task](../../../static/img/New-Domain-Admins/image_50.png)  

This screen will appear.  

![Schedule Screen](../../../static/img/New-Domain-Admins/image_51.png)  

Click the `Does not repeat` button.  

![Does Not Repeat](../../../static/img/New-Domain-Admins/image_52.png)  

This pop-up box will appear.  

![Repeat Options](../../../static/img/New-Domain-Admins/image_53.png)  

Select the `Hour(s)` option from the Repeat dropdown.  

![Select Hour](../../../static/img/New-Domain-Admins/image_54.png)  
![Select Hour 2](../../../static/img/New-Domain-Admins/image_55.png)  

Search for `Infrastructure` in the `Resources*` and select the `Infrastructure Master` group.  

![Select Infrastructure Master](../../../static/img/New-Domain-Admins/image_56.png)  

Now click the `Run` button to initiate the task.  

![Run Task](../../../static/img/New-Domain-Admins/image_57.png)  

The task will start appearing in the Scheduled Tasks.  

![Scheduled Tasks](../../../static/img/New-Domain-Admins/image_58.png)  
![Scheduled Tasks 2](../../../static/img/New-Domain-Admins/image_59.png)  

## Output

- **Script Log**  
![Script Log Output](../../../static/img/New-Domain-Admins/image_60.png)  
![Script Log Output 2](../../../static/img/New-Domain-Admins/image_61.png)  
![Script Log Output 3](../../../static/img/New-Domain-Admins/image_62.png)  

- **Custom Field**  
![Custom Field Output](../../../static/img/New-Domain-Admins/image_63.png)  
![Custom Field Output 2](../../../static/img/New-Domain-Admins/image_64.png)  
![Custom Field Output 3](../../../static/img/New-Domain-Admins/image_65.png)  

- **Ticket**  
![Ticket Output](../../../static/img/New-Domain-Admins/image_66.png)  



